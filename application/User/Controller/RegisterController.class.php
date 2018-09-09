<?php
/**
 * 会员注册
 */
namespace User\Controller;
use Common\Controller\HomebaseController;
class RegisterController extends HomebaseController {
	
	function index(){
	    if(sp_is_user_login()){ //已经登录时直接跳到首页
	        redirect(__ROOT__."/");
	    }else{
	        $this->display(":register");
	    }
	}
    public function mobilecodeSend(){
	 	
			header("Content-Type:text/html;charset=utf-8");
			$apikey = "6d4facb89021516c462df70f66ec076b"; //修改为您的apikey(https://www.yunpian.com)登陆官网后获取
			$mobile = $_POST['tel']; //请用自己的手机号代替
			$code = rand(999, 10000);
			$_SESSION['code']= $code;

			$company = "玫瑰里";
		 	$text="【玫瑰里】您的注册验证码是".$code;
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
	
	private	function get_user($ch,$apikey){
	    curl_setopt ($ch, CURLOPT_URL, 'https://sms.yunpian.com/v1/user/get.json');
	    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query(array('apikey' => $apikey)));
	    return curl_exec($ch);
	}
	private	function send($ch,$data){
	    curl_setopt ($ch, CURLOPT_URL, 'https://sms.yunpian.com/v1/sms/send.json');
	    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
	    return curl_exec($ch);
	}
	private	function tpl_send($ch,$data){
	    curl_setopt ($ch, CURLOPT_URL, 'https://sms.yunpian.com/v1/sms/tpl_send.json');
	    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
	    return curl_exec($ch);
	}
	private	function voice_send($ch,$data){
	    curl_setopt ($ch, CURLOPT_URL, 'http://voice.yunpian.com/v1/voice/send.json');
	    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
	    return curl_exec($ch);
	}


	
	function doregister(){
    	
    	if(isset($_POST['email'])){
    	    
    	    //邮箱注册
    	    $this->_do_email_register();
    	    
    	}elseif(isset($_POST['mobile'])){
    	    
    	    //手机号注册
    	    $this->_do_mobile_register();
    	    
    	}else{
    	    $this->error("注册方式不存在！");
    	}
    	
	}
	
		private function _do_mobile_register(){

	     
	    if(!sp_check_mobile_verify_code()){
	            $this->error("验证码错误！");
        }
        $rules = array(
            //array(验证字段,验证规则,错误提示,验证条件,附加规则,验证时间)
            array('name', 'require', '姓名不能为空！', 1 ),
            array('mobile', 'require', '手机号不能为空！', 1 ),
            array('verifycode', 'require', '手机验证码不能为空！', 1 ),
            array('verify', 'require', '验证码不能为空！', 1 ),
            // array('user_email','email','邮箱格式不正确！',1),
            // array('parentmobile', 'require', '上一级代理手机号不能为空！', 1 ),            
            array('password','require','密码不能为空！',1),
        );
        	
	    $users_model=M("Users");
	     
	    if($users_model->validate($rules)->create()===false){
	        $this->error($users_model->getError());
	    }
	   
	     
	    $password=$_POST['password'];
	    $mobile=$_POST['mobile'];
	    $parentmobile=$_POST['parentmobile'];
	    if(!preg_match("/^1[3-8][0-9]\d{8}$/", $mobile)){    
             			$this->error("请填写正确的手机号！");
        } 
        // if(!preg_match("/^1[3-8][0-9]\d{8}$/", $parentmobile)){    
        //      			$this->error("请填写正确的上一级代理手机号！");
        // }
	    if(strlen($password) < 5 || strlen($password) > 20){
	        $this->error("密码长度至少5位，最多20位！");
	    }
	     
	     if($password!=$_POST['repassword']){
	     $this->error("两次密码输入不一致！");
	     }
	    
	    $where['mobile']=$mobile;
	    if($_POST['verifycode']== $_SESSION['code']){
	     
	    $users_model=M("Users");
	    $result = $users_model->where($where)->count();
	    // $map['user_email']=$_POST['user_email'];
	    // $resultemail = $users_model->where($map)->count();
	    if($result){
	        $this->error("手机号已被注册！");
	    }else{

	        $data=array(
	            'user_login' => '',
	            // 'user_email' => $_POST['user_email'],
	            'mobile' =>$_POST['mobile'],
	            'user_nicename' =>$_POST['name'],
	            'user_pass' => sp_password($password),
	            'last_login_ip' => get_client_ip(0,true),
	            'create_time' => date("Y-m-d H:i:s"),
	            'creattime' => date("Y-m-d H:i:s"),
	            'last_login_time' => date("Y-m-d H:i:s"),
	            'user_status' => 1,
	            "user_type"=>2,//会员
	        );
	        
	        $rst = $users_model->add($data);
	        if($rst){
	            //登入成功页面跳转
	            $data['id']=$rst;
	            $_SESSION['user']=$data;
	            // $this->error("注册成功！",'/index.php?g=user&m=center&a=index');
	   //          $data['relationpath']="0-".$data['id'];
	             
				// $this->$users_model->save($data);
	            
	            $this->success("注册成功！",'/');
	        
	        }else{
	            $this->error("注册失败！",U("user/register/index"));
	        }
	         
	      }
	    }else{
        	$this->error("手机验证码不正确！");
        }
	}

	
	private function _do_email_register(){
	   
        if(!sp_check_verify_code()){
            $this->error("验证码错误！");
        }
        
        $rules = array(
            //array(验证字段,验证规则,错误提示,验证条件,附加规则,验证时间)
            array('email', 'require', '邮箱不能为空！', 1 ),
            array('password','require','密码不能为空！',1),
            array('repassword', 'require', '重复密码不能为空！', 1 ),
            array('repassword','password','确认密码不正确',0,'confirm'),
            array('email','email','邮箱格式不正确！',1), // 验证email字段格式是否正确
            	
        );
	    
	     
	    $users_model=M("Users");
	     
	    if($users_model->validate($rules)->create()===false){
	        $this->error($users_model->getError());
	    }
	     
	    $password=$_POST['password'];
	    $email=$_POST['email'];
	    $username=str_replace(array(".","@"), "_",$email);
	    //用户名需过滤的字符的正则
	    $stripChar = '?<*.>\'"';
	    if(preg_match('/['.$stripChar.']/is', $username)==1){
	        $this->error('用户名中包含'.$stripChar.'等非法字符！');
	    }
	     
// 	    $banned_usernames=explode(",", sp_get_cmf_settings("banned_usernames"));
	     
// 	    if(in_array($username, $banned_usernames)){
// 	        $this->error("此用户名禁止使用！");
// 	    }
	     
	    if(strlen($password) < 5 || strlen($password) > 20){
	        $this->error("密码长度至少5位，最多20位！");
	    }
	    
	    $where['user_login']=$username;
	    $where['user_email']=$email;
	    $where['_logic'] = 'OR';
	    
	    $ucenter_syn=C("UCENTER_ENABLED");
	    $uc_checkemail=1;
	    $uc_checkusername=1;
	    if($ucenter_syn){
	        include UC_CLIENT_ROOT."client.php";
	        $uc_checkemail=uc_user_checkemail($email);
	        $uc_checkusername=uc_user_checkname($username);
	    }
	     
	    $users_model=M("Users");
	    $result = $users_model->where($where)->count();
	    if($result || $uc_checkemail<0 || $uc_checkusername<0){
	        $this->error("用户名或者该邮箱已经存在！");
	    }else{
	        $uc_register=true;
	        if($ucenter_syn){
	             
	            $uc_uid=uc_user_register($username,$password,$email);
	            //exit($uc_uid);
	            if($uc_uid<0){
	                $uc_register=false;
	            }
	        }
	        if($uc_register){
	            $need_email_active=C("SP_MEMBER_EMAIL_ACTIVE");
	            $data=array(
	                'user_login' => $username,
	                'user_email' => $email,
	                'user_nicename' =>$username,
	                'user_pass' => sp_password($password),
	                'last_login_ip' => get_client_ip(0,true),
	                'create_time' => date("Y-m-d H:i:s"),
	                'last_login_time' => date("Y-m-d H:i:s"),
	                'user_status' => $need_email_active?2:1,
	                "user_type"=>2,//会员
	            );
	            $rst = $users_model->add($data);
	            if($rst){
	                //登入成功页面跳转
	                $data['id']=$rst;
	                $_SESSION['user']=$data;
	                	
	                //发送激活邮件
	                if($need_email_active){
	                    $this->_send_to_active();
	                    unset($_SESSION['user']);
	                    $this->success("注册成功，激活后才能使用！",U("user/login/index"));
	                }else {
	                    $this->success("注册成功！",__ROOT__."/");
	                }
	                	
	            }else{
	                $this->error("注册失败！",U("user/register/index"));
	            }
	             
	        }else{
	            $this->error("注册失败！",U("user/register/index"));
	        }
	         
	    }
	}
	
	function active(){
		$hash=I("get.hash","");
		if(empty($hash)){
			$this->error("激活码不存在");
		}
		
		$users_model=M("Users");
		$find_user=$users_model->where(array("user_activation_key"=>$hash))->find();
		
		if($find_user){
			$result=$users_model->where(array("user_activation_key"=>$hash))->save(array("user_activation_key"=>"","user_status"=>1));
			
			if($result){
				$find_user['user_status']=1;
				$_SESSION['user']=$find_user;
				$this->success("用户激活成功，正在登录中...",__ROOT__."/");
			}else{
				$this->error("用户激活失败!",U("user/login/index"));
			}
		}else{
			$this->error("用户激活失败，激活码无效！",U("user/login/index"));
		}
		
		
	}
	
	
}