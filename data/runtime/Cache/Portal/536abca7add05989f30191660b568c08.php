<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
	<html>
	<head>
		<title><?php echo ($post_title); ?> <?php echo ($site_name); ?></title>
		<meta name="keywords" content="<?php echo ($site_seo_keywords); ?>" />
		<meta name="description" content="<?php echo ($site_seo_description); ?>">
			<?php  function _sp_helloworld(){ echo "hello 玫瑰里!"; } function _sp_helloworld2(){ echo "hello 玫瑰里2!"; } function _sp_helloworld3(){ echo "hello 玫瑰里3!"; } ?>
	<?php $portal_index_lastnews="2"; $portal_hot_articles="1,2"; $portal_last_post="1,2"; $tmpl=sp_get_theme_path(); $default_home_slides=array( array( "slide_name"=>"玫瑰里X2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/1.jpg", "slide_url"=>"", ), array( "slide_name"=>"玫瑰里X2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/2.jpg", "slide_url"=>"", ), array( "slide_name"=>"玫瑰里X2.1.0发布啦！", "slide_pic"=>$tmpl."Public/images/demo/3.jpg", "slide_url"=>"", ), ); ?>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"> 
    <!-- Set render engine for 360 browser -->
    <!-- <meta name="renderer" content="webkit"> -->
   	<!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!-- HTML5 shim for IE8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <![endif]-->
	<link rel="icon" href="/themes/simplebootx_mobile/Public/images/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="/themes/simplebootx_mobile/Public/images/favicon.ico" type="image/x-icon">
    <link href="/themes/simplebootx_mobile/Public/simpleboot/font-awesome/4.4.0/css/font-awesome.min.css"  rel="stylesheet" type="text/css">
	<!--[if IE 7]>
	<link rel="stylesheet" href="/themes/simplebootx_mobile/Public/simpleboot/font-awesome/4.4.0/css/font-awesome-ie7.min.css">
	<![endif]-->
	<link href="/css/mcommon.css" rel="stylesheet">
	<link href="/css/mmain.css" rel="stylesheet">
	</head>
<body>
<div class="logo-wap">
	<a href="/"><img src="/images/logo.png"></a>
</div>
<div  id="center-login">
	<?php $getaddress=sp_getaddress(); if(isset($_SESSION['address'])){ $address=$_SESSION['address']; }else{ $address=$getaddress[0]['address']; } ?>
<select name="navaddress" id="navaddress">
<?php if(is_array($getaddress)): foreach($getaddress as $key=>$vo): if($vo["address"] == $address): ?><option value="<?php echo ($vo["address"]); ?>" selected=""><?php echo ($vo["address"]); ?></option>
				<?php else: ?><option value="<?php echo ($vo["address"]); ?>" ><?php echo ($vo["address"]); ?></option><?php endif; endforeach; endif; ?>
 </select>
<span class="login"><a href="<?php echo U('user/center/index');?>">个人中心</a><a href="<?php echo U('user/index/logout');?>">退出</a> </span>
<span class="offline"><a href="<?php echo leuu('user/login/index');?>">登录</a>|<a href="<?php echo leuu('user/register/index');?>">注册</a></span>
<span>
<?php  if($_SESSION["mainnav"]==1){ echo '<a href="/index.php?g=&m=index&a=swmain">玫瑰里·商务</a>'; }else{ echo '<a href="/index.php?g=&m=index&a=main">玫瑰里·婚礼</a>'; } ?>
		</span>
</div>
<div class="nav-header">
	<?php
 $effected_id="main-menu"; $filetpl="<a href='\$href' target='\$target'  data-cid='\$cid'>\$label</a>"; $foldertpl="<a href='\$href' target='\$target'  data-cid='\$cid'>\$label </a>"; $ul_class="dropdown-menu" ; $li_class="" ; $style="nav"; $showlevel=6; $dropdown='dropdown'; if($_SESSION["mainnav"]==2){ echo sp_get_menu(2,$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); }else{ echo sp_get_menu("main",$effected_id,$filetpl,$foldertpl,$ul_class,$li_class,$style,$showlevel,$dropdown); } ?>
</div>
 
<div class="w1200 clear">
 <div class="list-title"><?php echo ($post_title); ?></div>
 <div class="act-tips">
 <p><img src="/images/act-icons_01.png">活动时间:<?php echo date('Y/m/d',strtotime($actstarttime));?>-<?php echo date('Y/m/d',strtotime($actendtime));?></p>
<p><img src="/images/act-icons_03.png">报名人数:<span class="red"><?php echo ($countno); ?></span>人</p>
<p><img src="/images/act-icons_05.png">人气指数:<span class="red"><?php echo ($post_hits); ?></span>次</p>
</div>
<div id="article_content">
<?php echo ($post_content); ?>
</div>
<div class="act-from">

<div class="form">
<h2>报名参加</h2>
<input type="text" name="uname" placeholder="请输入您的姓名">
<input type="text" name="utel" placeholder="请输入您的手机号">
<p class="red" id="yy-errormessage"></p>
<button  onclick="addpost()">提交</button>
</div>
	
</div>
</div>
<div class="footer clear">

<ul>
	<li><a href="<?php echo U('index/main');?>">玫瑰里·婚礼</a></li>
	<li><a href="<?php echo U('index/swmain');?>">玫瑰里·商务</a></li>
	<li><a href="/index.php?m=page&a=index&id=1">关于我们</a></li>
</ul>
<p class="url">
	www.lavin.com.cn
</p>
<p class="tel">
	4006-111-521
</p>
<p>
©2012玫瑰里文化集团有限公司版权所有
</p>
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
    <script src="/themes/simplebootx_mobile/Public/simpleboot/bootstrap/js/bootstrap.min.js"></script>
    <script src="/public/js/frontend.js"></script>
	<script>
	$(function(){
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
	 function addpost(){
 	$('#yy-errormessage').text('');
 	var uname= $('input[name=uname]').val();
 	var utel= $('input[name=uname]').val();
 	if(!uname){
 		$('#yy-errormessage').text('姓名不能为空!');
		return false;
 	}
 	if(!utel){
 		$('#yy-errormessage').text('手机号不能为空!');
		return false;
 	}
 	var  data={
 		uname:uname,
 		utel:utel,
 		arcid:<?php echo($article_id); ?>,
 		arctitle:'<?php echo($post_title); ?>'
 	}
    $.ajax({
            url:"<?php echo U('article/yyadd');?>",
            type:"POST",
            data:data,
            dataType:"json",
            success:function(data){
                if(data.status == 1){ 
                alert('提交成功!');                                                            
                }else{
                    alert(data.info);
                }
                 location.reload();

            },
        }); 

 }
</script>