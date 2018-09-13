<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
	<html>
	<head>
		<title><?php echo ($site_seo_title); ?> <?php echo ($site_name); ?></title>
		<meta name="keywords" content="<?php echo ($site_seo_keywords); ?>" />
		<meta name="description" content="<?php echo ($site_seo_description); ?>">
			<?php  function _sp_helloworld(){ echo "hello 玫瑰里!"; } function _sp_helloworld2(){ echo "hello 玫瑰里2!"; } function _sp_helloworld3(){ echo "hello 玫瑰里3!"; } ?>
	<?php $portal_index_lastnews="2"; $portal_hot_articles="1,2"; $portal_last_post="1,2"; $tmpl=sp_get_theme_path(); $default_home_slides=array( array( "slide_name"=>"玫瑰里X2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/1.jpg", "slide_url"=>"", ), array( "slide_name"=>"玫瑰里X2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/2.jpg", "slide_url"=>"", ), array( "slide_name"=>"玫瑰里X2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/3.jpg", "slide_url"=>"", ), ); ?>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- <meta name="viewport" content="width=1200, initial-scale=1"/> -->
    <!-- Set render engine for 360 browser -->
    <!-- <meta name="renderer" content="webkit"> -->
   	<!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
	<link rel="icon" href="/themes/simplebootx/Public/images/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="/themes/simplebootx/Public/images/favicon.ico" type="image/x-icon">
    <link href="/themes/simplebootx/Public/simpleboot/font-awesome/4.4.0/css/font-awesome.min.css"  rel="stylesheet" type="text/css">
	<!--[if IE 7]>
	<link rel="stylesheet" href="/themes/simplebootx/Public/simpleboot/font-awesome/4.4.0/css/font-awesome-ie7.min.css">
	<![endif]-->
	<link href="/css/common.css" rel="stylesheet">
	<link href="/css/main.css" rel="stylesheet">
    <link media="screen and (min-device-width:320px) and (max-device-width:400px)" rel="stylesheet" href="/css/style.css" />
	</head>
<body>
<?php if ($_SESSION['address'] == '北京·太阳公元') { echo $site_bj_kf; } elseif ($_SESSION['address'] == '上海·外滩') { echo $site_sh_kf; } elseif ($_SESSION['address'] == '天津·爱琴海') { echo $site_tj_kf; } elseif ($_SESSION['address'] == '南京·外秦淮') { echo $site_njwq_kf; } elseif ($_SESSION['address'] == '南京·1865') { echo $site_nj_kf; } else { echo $site_bj_kf; } ?>
<div class="navheader">
	<div class="w1200 clear">
		<div class="pright" id="center-login">
		<span class="login"><a href="<?php echo U('user/center/index');?>">个人中心</a><a href="<?php echo U('user/index/logout');?>">退出</a> </span>
<span class="offline"><a href="<?php echo leuu('user/login/index');?>">登录</a>|<a href="<?php echo leuu('user/register/index');?>">注册</a></span>
 
<span >
<?php  if($_SESSION["mainnav"]==1){ echo '<a href="/index.php?g=&m=index&a=swmain">玫瑰里·商务</a>'; }else{ echo '<a href="/index.php?g=&m=index&a=main">玫瑰里·婚礼</a>'; } ?>
		</span>
		</div>
	</div>
</div>
<div class="nav-header">
<div class="w1200 clear">
<div class="header-l">
<a href="/"><img src="/images/small-logo.png"></a>
<?php $getaddress=sp_getaddress(); if(isset($_SESSION['address'])){ $address=$_SESSION['address']; }else{ $address=$getaddress[0]['address']; } ?>
<select name="navaddress" id="navaddress">
<?php if(is_array($getaddress)): foreach($getaddress as $key=>$vo): if($vo["address"] == $address): ?><option value="<?php echo ($vo["address"]); ?>" selected=""><?php echo ($vo["address"]); ?></option>
				<?php else: ?><option value="<?php echo ($vo["address"]); ?>" ><?php echo ($vo["address"]); ?></option><?php endif; endforeach; endif; ?>
 </select><span id="city">城市选择</span>
</div>
<div class="header-r">
	<?php
 $effected_id="main-menu"; $filetpl="<a href='\$href' target='\$target'  data-cid='\$cid'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target'  data-cid='\$cid'>\$label </a>"; $ul_class="dropdown-menu" ; $li_class="" ; $style="nav"; $showlevel=6; $dropdown='dropdown'; if($_SESSION["mainnav"]==2){ echo sp_get_menu(2,$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); }else{ echo sp_get_menu("main",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); } ?>
</div>
</div>
</div>
 
	<div class="tab-pane" id="mobile">
	<h1>玫瑰里用户注册</h1>
						<form class="form-horizontal js-ajax-form" action="<?php echo U('user/register/doregister');?>" method="post">
							<div class="control-group">
                    		<input type="text"   name="name" placeholder="请输入用户名">
                            </div>
		
							<div class="control-group">
								<input type="text" name="mobile" placeholder="请输入手机号码" >
							</div>
								<div class="control-group">								 
									<input type="text" name="verifycode" placeholder="请输入手机验证码" >
									 <input type="button" name="codebtn" class="codebtn"  value="获取" onclick="getcode()">
								 
							</div>
		
					<!--  <div class="control-group">
		                    <input type="text"  name="user_email" placeholder="输入邮箱">
		                </div> -->
		                 <div class="control-group">
		                    <input type="password"  name="password" placeholder="输入密码">
		                </div>
		                
		                <div class="control-group">
		                    <input type="password"   name="repassword" placeholder="确认密码">
		                </div>
							
							<div class="control-group">								 
									<input type="text" name="verify" placeholder="请输入验证码" >
									<?php echo sp_verifycode_img('length=4&font_size=14&width=120&height=34&charset=1234567890&use_noise=1&use_curve=0');?>
								 
							</div>
		
 
		
							<div class="control-group">
								<button class="btn btn-primary js-ajax-submit span4" type="submit" data-wait="1500" style="margin-left: 0px;">确定注册</button>
							</div>
						</form>
	</div>

<div class="footer">
<div class="w1200 clear">
<div class="footer-logo">
<img src="/images/footer-logo.png">
</div>
<div class="footer-middle">
<ul>
	<li><a href="<?php echo U('index/main');?>">玫瑰里·婚礼</a></li>
	<li><a href="<?php echo U('index/swmain');?>">玫瑰里·商务</a></li>
	<li><a href="/index.php?m=page&a=index&id=1">关于我们</a></li>
	<li><a href="/index.php?m=list&a=index&id=5">最新活动</a></li>
	<li><a href="/index.php?m=list&a=index&id=6">预约咨询</a></li>
</ul>
<p class="url">
	www.lavin.com.cn
</p>
<p class="tel">
	4006-111-521
</p>
<p>
©2012—2018 玫瑰里文化集团有限公司版权所有 ICP备案：京ICP备1401359号
</p>
	
</div>
<div class="footer-r">
<ul>
	<!-- <li><img src="/images/gf-weibo.png"><p>官方微博</p></li> -->
	<li><img src="/images/gf-weixin.png"><p>官方微信</p></li>
</ul>

</div>
</div>
</div>
 
<script type="text/javascript">
//全局变量
var GV = {
    DIMAUB: "/",
    JS_ROOT: "public/js/",
    TOKEN: ""
};
</script>
<!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/public/js/jquery.js"></script>
    <script src="/public/js/wind.js"></script>
    <script src="/themes/simplebootx/Public/simpleboot/bootstrap/js/bootstrap.min.js"></script>
    <script src="/public/js/frontend.js"></script>
     <script src="/js/jquery.SuperSlide.2.1.2.js"></script>	 
     <script src="/themes/simplebootx/Public/js/slippry.min.js"></script>
	<script>
	$(function(){
		 $(function () {
        var demo1 = $("#homeslider").slippry({
            transition: 'fade',
            useCSS: true,
            captions: false,
            speed: 1000,
            pause: 3000,
            auto: true,
            preload: 'visible'
        });
    });
		$('body').on('touchstart.dropdown', '.dropdown-menu', function (e) { e.stopPropagation(); });
		
		$("#main-menu li.dropdown").hover(function(){
			$(this).addClass("open");
		},function(){
			$(this).removeClass("open");
		});
		$("#main-menu a").each(function() {
	   		 if ($(this)[0].href == String(window.location)) {
	        	$(this).parentsUntil("#main-menu>ul>li").addClass("active");
	    	}
		});
		$("#navaddress").change(function(){
			$.post("<?php echo U('index/getaddsession');?>",{address:$(this).val()},function(data){
			if(data.status==1){
				var indexhref= $('#main-menu li a').eq(0).attr('href');
				 
				if(indexhref){
					window.location.href=indexhref;
				}
				 
				
				// var mainnav='<?php echo ($_SESSION["mainnav"]); ?>';
			 
				// if(mainnav==1){
				// 	window.location.href='/index.php?g=&m=index&a=swmain';
				// }else{
				// 	window.location.href='/index.php?g=&m=index&a=main';
				// }
				 
			}			 
			
		});	
			 
  
        });
        $.get("<?php echo U('index/updatenum');?>",{ },function(data){});	
		
		$.post("<?php echo U('user/index/is_login');?>",{},function(data){
			if(data.status==1){
				if(data.user.avatar){
					$("#main-menu-user .headicon").attr("src",data.user.avatar.indexOf("http")==0?data.user.avatar:"/data/upload/avatar/"+data.user.avatar);
				}
				
				$("#main-menu-user .user-nicename").text(data.user.user_nicename!=""?data.user.user_nicename:data.user.user_login);
				$("#center-login span.login").show();
				
			}
			if(data.status==0){
				$("#center-login span.offline").show();
			}
			
		});	
		;(function($){
			$.fn.totop=function(opt){
				var scrolling=false;
				return this.each(function(){
					var $this=$(this);
					$(window).scroll(function(){
						if(!scrolling){
							var sd=$(window).scrollTop();
							if(sd>100){
								$this.fadeIn();
							}else{
								$this.fadeOut();
							}
						}
					});
					
					$this.click(function(){
						scrolling=true;
						$('html, body').animate({
							scrollTop : 0
						}, 500,function(){
							scrolling=false;
							$this.fadeOut();
						});
					});
				});
			};
		})(jQuery); 
		
		$("#backtotop").totop();
		
		
	});
	</script>

 
 
</body>
</html>
<script type="text/javascript">
	 function getcode(){
 	var phone=$('input[name=mobile]').val();
 	if (!(/^1[3-9][0-9]\d{8}$/.test(phone))) {
                alert("请输入正确的手机号");
                return false;               
    }else{
    	$.post("<?php echo U('user/register/mobilecodeSend');?>", {'tel':phone},function(res){
        if (res) {
          alert('发送成功');
        } else {
          alert('发送失败');
        }
      });

    } 

 }


					 

</script>