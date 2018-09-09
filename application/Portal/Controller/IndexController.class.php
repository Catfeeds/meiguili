<?php
// +----------------------------------------------------------------------
// | thinkcmf [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace Portal\Controller;
use Common\Controller\HomebaseController; 
/**
 * 首页
 */
class IndexController extends HomebaseController {
	
    //过渡首页
	public function index() {
    	$this->display(":index");
    }
     //首页
	public function main() {
		$comment_model=M("Comment");	
        $data['status']=1; 
		$commentlist=$comment_model->alias('a')->join('data_users u ON u.id= a.uid')->where($data)->order('id desc')->limit(0,3)->field('a.*,u.user_nicename,u.avatar')->select();  
        $_SESSION["mainnav"]=1;    
        $this->assign('commentlist', $commentlist); 
    	$this->display(":main");
    }
     //商务首页
    public function swmain() {
        $comment_model=M("Comment");
        $data['status']=1;   
        $commentlist=$comment_model->alias('a')->join('data_users u ON u.id= a.uid')->order('id desc')->limit(0,3)->field('a.*,u.user_nicename,u.avatar')->select();  
        $_SESSION["mainnav"]=2;      
        $this->assign('commentlist', $commentlist); 
        $this->display(":swmain");
    }
       public function do_like(){
    	$this->check_login();    	
    	$id=intval($_GET['id']); 	
    	$comment_model=M("Comment");   	
    	$comment_model->save(array("id"=>$id,"post_like"=>array("exp","post_like+1")));
    	$this->success("您已成功点赞！");  	
    }
        public function indexformadd(){
     
            if (IS_POST) {
                $posttime['createtime']=date("Y-m-d H:i:s"); 
               // $posttime['uid']=session('user')['id']; 
                $data =array_merge($posttime,$_POST);
                $form_model=M("Indextable");
                $rst = $form_model->add($data);
                if($rst){                                                
                $this->success("添加成功！");            
                }else{
                $this->error("添加失败！");
                }  
          }         
    }
    public function getaddsession(){
         if (IS_POST) {
             $_SESSION['address']=$_POST['address'];
             $this->success("切换成功！");    
         }else{
            $_SESSION['address']='';
             $this->success("切换地址失败！");   
         }
    } 
    public function updatenum(){        
              $num = M("Num");  
              $num->where('id=1')->setInc('num',1);    
          
    }

}


