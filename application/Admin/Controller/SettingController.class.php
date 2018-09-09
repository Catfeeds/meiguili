<?php
namespace Admin\Controller;
use Common\Controller\AdminbaseController;
class SettingController extends AdminbaseController{
	
	protected $options_model;
	
	function _initialize() {
		parent::_initialize();
		$this->options_model = D("Common/Options");
	}
	
	function site(){
	    C(S('sp_dynamic_config'));//加载动态配置
		$option=$this->options_model->where("option_name='site_options'")->find();
		$cmf_settings=$this->options_model->where("option_name='cmf_settings'")->getField("option_value");
		$tpls=sp_scan_dir(C("SP_TMPL_PATH")."*",GLOB_ONLYDIR);
		$noneed=array(".","..",".svn");
		$tpls=array_diff($tpls, $noneed);
		$this->assign("templates",$tpls);
		
		$adminstyles=sp_scan_dir("public/simpleboot/themes/*",GLOB_ONLYDIR);
		$adminstyles=array_diff($adminstyles, $noneed);
		$this->assign("adminstyles",$adminstyles);
		if($option){
			$this->assign((array)json_decode($option['option_value']));
			$this->assign("option_id",$option['option_id']);
		}
		
		$this->assign("cmf_settings",json_decode($cmf_settings,true));
		
		
		$this->display();
	}
	
	function site_post(){
		if (IS_POST) {
			if(isset($_POST['option_id'])){
				$data['option_id']=intval($_POST['option_id']);
			}
			
			$configs["SP_SITE_ADMIN_URL_PASSWORD"]=empty($_POST['options']['site_admin_url_password'])?"":md5(md5(C("AUTHCODE").$_POST['options']['site_admin_url_password']));
			$configs["SP_DEFAULT_THEME"]=$_POST['options']['site_tpl'];
			$configs["DEFAULT_THEME"]=$_POST['options']['site_tpl'];
			$configs["SP_ADMIN_STYLE"]=$_POST['options']['site_adminstyle'];
			$configs["URL_MODEL"]=$_POST['options']['urlmode'];
			$configs["URL_HTML_SUFFIX"]=$_POST['options']['html_suffix'];
			$configs["UCENTER_ENABLED"]=empty($_POST['options']['ucenter_enabled'])?0:1;
			$configs["COMMENT_NEED_CHECK"]=empty($_POST['options']['comment_need_check'])?0:1;
			$comment_time_interval=intval($_POST['options']['comment_time_interval']);
			$configs["COMMENT_TIME_INTERVAL"]=$comment_time_interval;
			$_POST['options']['comment_time_interval']=$comment_time_interval;
			$configs["MOBILE_TPL_ENABLED"]=empty($_POST['options']['mobile_tpl_enabled'])?0:1;
			$configs["HTML_CACHE_ON"]=empty($_POST['options']['html_cache_on'])?false:true;
				
			sp_set_dynamic_config($configs);//sae use same function
				
			$data['option_name']="site_options";
			$data['option_value']=json_encode($_POST['options']);
			if($this->options_model->where("option_name='site_options'")->find()){
				$r=$this->options_model->where("option_name='site_options'")->save($data);
			}else{
				$r=$this->options_model->add($data);
			}
			
			$banned_usernames=preg_replace("/[^0-9A-Za-z_\x{4e00}-\x{9fa5}-]/u", ",", $_POST['cmf_settings']['banned_usernames']);
			$_POST['cmf_settings']['banned_usernames']=$banned_usernames;

			sp_set_cmf_setting($_POST['cmf_settings']);
			
			if ($r!==false) {
				$this->success("保存成功！");
			} else {
				$this->error("保存失败！");
			}
			
		}
	}
	
	function password(){
		$this->display();
	}
	
	function password_post(){
		if (IS_POST) {
			if(empty($_POST['old_password'])){
				$this->error("原始密码不能为空！");
			}
			if(empty($_POST['password'])){
				$this->error("新密码不能为空！");
			}
			$user_obj = D("Common/Users");
			$uid=get_current_admin_id();
			$admin=$user_obj->where(array("id"=>$uid))->find();
			$old_password=$_POST['old_password'];
			$password=$_POST['password'];
			if(sp_compare_password($old_password,$admin['user_pass'])){
				if($_POST['password']==$_POST['repassword']){
					if(sp_compare_password($password,$admin['user_pass'])){
						$this->error("新密码不能和原始密码相同！");
					}else{
						$data['user_pass']=sp_password($password);
						$data['id']=$uid;
						$r=$user_obj->save($data);
						if ($r!==false) {
							$this->success("修改成功！");
						} else {
							$this->error("修改失败！");
						}
					}
				}else{
					$this->error("密码输入不一致！");
				}
	
			}else{
				$this->error("原始密码不正确！");
			}
		}
	}
	
	//清除缓存
	function clearcache(){
			
		sp_clear_cache();
		$this->display();
	}
	
	
	function setaddress(){
		$this->display();
	}
	function address_post(){
		if (IS_POST) {
			if(empty($_POST['address'])){
				$this->error("地址名称不能为空！");
			}
			$area_obj=M("Area");
			$uid=get_current_admin_id();
			$data['address']=$_POST['address'];
			$findaddress=$area_obj->where($data)->find();   
            if($findaddress){
                $this->error("该地址名称已存在！");
            }else{
            	$data['uid']=$uid;
				$data['status']=1;
				$data['createtime']=date("Y-m-d H:i:s");
				$r=$area_obj->add($data);
				if ($r!==false) {
					$this->success("添加成功！");
				} else {
					$this->error("添加失败！");
				}
            	
            }
				
	}

	}
	function addresslist($table=""){
		$where=array();
		if(!empty($table)){
			$where['post_table']=$table;
		}
		$area_obj=M("Area");
		
		$post_id=I("get.post_id");
		if(!empty($post_id)){
			$where['post_id']=$post_id;
		}
		$count=$area_obj->where($where)->count();
		$page = $this->page($count, 20);
		$addresslist=$area_obj
		->where($where)
		->limit($page->firstRow . ',' . $page->listRows)
		->order("createtime DESC")
		->select();
		$this->assign("addresslist",$addresslist);
		$this->assign("Page", $page->show('Admin'));
		$this->display();
	}
	function addressdelete(){
			$area_obj=M("Area");
		if(isset($_GET['id'])){
			$id = intval(I("get.id"));
			if ($area_obj->where("id=$id")->delete()!==false) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
		if(isset($_POST['ids'])){
			$ids=join(",",$_POST['ids']);
			if ($area_obj->where("id in ($ids)")->delete()!==false) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
	}
	function setphone(){
		if(!empty($_GET['id'])){
			$phone_obj=M("Area_phone");
			$data['id']=$_GET['id'];
			$findphone=$phone_obj->where($data)->find();  
			$this->assign($findphone);
		}	
		$this->display();
	}
	function phonelist($table=""){
		$where=array();
		if(!empty($table)){
			$where['post_table']=$table;
		}
		$area_obj=M("Area_phone");
		
		$post_id=I("get.post_id");
		if(!empty($post_id)){
			$where['post_id']=$post_id;
		}
		$count=$area_obj->where($where)->count();
		$page = $this->page($count, 20);
		$phonelist=$area_obj
		->where($where)
		->limit($page->firstRow . ',' . $page->listRows)
		->order("createtime DESC")
		->select();
		$this->assign("phonelist",$phonelist);
		$this->assign("Page", $page->show('Admin'));
		$this->display();
	}

	// function phone_post(){
	// 	if (IS_POST) {
	// 		if(empty($_POST['phone'])){
	// 			$this->error("手机号不能为空！");
	// 		}
	// 		$phone_obj=M("Area_phone");
	// 		$uid=get_current_admin_id();
	// 		$data['address']=$_POST['address'];
	// 		$data['phone']=$_POST['phone'];
	// 		$findaddress=$phone_obj->where($data)->find();   
 //            if($findaddress){
 //                $this->error("该地址名称已存在！");
 //            }else{
 //            	$data['uid']=$uid;
	// 			$data['status']=1;
	// 			$data['createtime']=date("Y-m-d H:i:s");
	// 			$r=$phone_obj->add($data);
	// 			if ($r!==false) {
	// 				$this->success("添加成功！");
	// 			} else {
	// 				$this->error("添加失败！");
	// 			}
            	
 //            }
				
	// }

	// }
	function phone_post(){
		if (IS_POST) {
			if(empty($_POST['phone'])){
				$this->error("手机号不能为空！");
			}
			$phone_obj=M("Area_phone");
			$uid=get_current_admin_id();
			// $data['address']=$_POST['address'];
			$data['phone']=$_POST['phone'];
			$data['id']=$_POST['id'];
			$findaddress=$phone_obj->where($data)->find();   
            if($findaddress){
                $this->error("未修改请勿保存！");
            }else{
    //         	$data['uid']=$uid;
				// $data['status']=1;
				// $data['createtime']=date("Y-m-d H:i:s");
				$dataphone['phone']=$_POST['phone'];
				$where['id']=$_POST['id'];
				$r=$phone_obj->where($where)->save($dataphone);
				if ($r!==false) {
					$this->success("修改成功！");
				} else {
					$this->error("修改失败！");
				}
            	
            }
				
	}

	}
	function phonedelete(){
			$phone_obj=M("Area_phone");
		if(isset($_GET['id'])){
			$id = intval(I("get.id"));
			if ($phone_obj->where("id=$id")->delete()!==false) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
		if(isset($_POST['ids'])){
			$ids=join(",",$_POST['ids']);
			if ($phone_obj->where("id in ($ids)")->delete()!==false) {
				$this->success("删除成功！");
			} else {
				$this->error("删除失败！");
			}
		}
	}
}