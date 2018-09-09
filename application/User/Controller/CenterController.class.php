<?php

/**
 * 会员中心
 */
namespace User\Controller;
use Common\Controller\MemberbaseController;
class CenterController extends MemberbaseController {
	
	protected $users_model;
	function _initialize(){
		parent::_initialize();
		$this->users_model=D("Common/Users");
	}
    //会员中心
	public function index() {
		$userid=sp_get_current_userid();
		$user=$this->users_model->where(array("id"=>$userid))->find();
		$this->assign($user);
    	$this->display(':center');
    }
    public function indexformadd(){
     
			if (IS_POST) {
                $posttime['createtime']=date("Y-m-d H:i:s"); 
                $posttime['uid']=session('user')['id']; 
                $data =array_merge($posttime,$_POST);               
                $form_model=M("Indextable");
                $objwhere['address']=$_POST['address'];
                $obj_model=M("Area_phone");    
                $findphone=$obj_model->where($objwhere)->find();         

                $rst = $form_model->add($data);   

                
                if($rst){    
                  if($findphone){
                   $this->mobilecodeSend($findphone['phone'],$_POST['tel'],$_POST['address']); 
                }                                             
                $this->success("添加成功！");  
               

                }else{
                $this->error("添加失败！");
                }  
          }  	    
    }

 public function mobilecodeSend($mobile,$tel,$city){
        
            header("Content-Type:text/html;charset=utf-8");
            $apikey = "6d4facb89021516c462df70f66ec076b"; //修改为您的apikey(https://www.yunpian.com)登陆官网后获取


            //$mobile = $_POST['tel']; //请用自己的手机号代替
            // $code = rand(999, 10000);
            // $_SESSION['code']= $code;

            $company = "玫瑰里";

            $text="【玫瑰里】{新增预约}玫瑰里".$city."：有一个新的预约，手机：".$tel."，请尽快联系。";
            $ch = curl_init();

            /* 设置验证方式 */

            curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept:text/plain;charset=utf-8', 'Content-Type:application/x-www-form-urlencoded','charset=utf-8'));

            /* 设置返回结果为流 */
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

            /* 设置超时时间*/
            curl_setopt($ch, CURLOPT_TIMEOUT, 10);

            /* 设置通信方式 */
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            // 取得用户信息
            // $json_data = $this->get_user($ch,$apikey);
               
            // $array = json_decode($json_data,true);
            //echo '<pre>';print_r($array);
            // 发送短信         
            $data=array('text'=>$text,'apikey'=>$apikey,'mobile'=>$mobile);
             
            $json_data = $this->send($ch,$data);
            $array = json_decode($json_data,true);
            echo '<pre>';print_r($array);
            // 发送模板短信
            // 需要对value进行编码
            // $data=array('tpl_id'=>'1516620','tpl_value'=>('#code#').'='.urlencode($code).'&'.urlencode('#company#').'='.urlencode($company),'apikey'=>$apikey,'mobile'=>$mobile);
            // //print_r ($data);
            // $json_data = $this->tpl_send($ch,$data);
            // $array = json_decode($json_data,true);
            // echo '<pre>';print_r($array);

         

            curl_close($ch);

            /***************************************************************************************/
            //获得账户
                    
    }
    
    private function get_user($ch,$apikey){
        curl_setopt ($ch, CURLOPT_URL, 'https://sms.yunpian.com/v1/user/get.json');
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query(array('apikey' => $apikey)));
        return curl_exec($ch);
    }
    private function send($ch,$data){
        curl_setopt ($ch, CURLOPT_URL, 'https://sms.yunpian.com/v1/sms/send.json');
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        return curl_exec($ch);
    }
    private function tpl_send($ch,$data){
        curl_setopt ($ch, CURLOPT_URL, 'https://sms.yunpian.com/v1/sms/tpl_send.json');
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        return curl_exec($ch);
    }
    private function voice_send($ch,$data){
        curl_setopt ($ch, CURLOPT_URL, 'http://voice.yunpian.com/v1/voice/send.json');
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
        return curl_exec($ch);
    }


    

    public function indexmsgadd(){
        if (IS_POST) {
                $posttime['createtime']=date("Y-m-d H:i:s"); 
                $posttime['uid']=session('user')['id']; 
                $data =array_merge($posttime,$_POST);
                $form_model=M("Comment");
                $rst = $form_model->add($data);
                if($rst){                                                
                $this->success("添加成功！");            
                }else{
                $this->error("添加失败！");
                }  
          } 
    }
}
