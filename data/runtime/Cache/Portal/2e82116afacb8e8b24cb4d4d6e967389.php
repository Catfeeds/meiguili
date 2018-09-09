<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
	<html>
	<head>
		<title><?php echo ($name); ?> <?php echo ($site_seo_title); ?> <?php echo ($site_name); ?></title>
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
 
<div class="w1200 mtb50 clear">
<div class="mgl-hlbj">
	<ul>
		<?php $_result=SidTypes(5);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li <?php if($vo["label"] == $name): ?>class="active"<?php endif; ?>><a href="<?php echo ($vo["href"]); ?>" ><?php echo ($vo["label"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>

	</ul>
</div>
<div class="anlist-con clear">
<ul>
<?php $lists = sp_sql_posts_paged("cid:$cat_id;order:post_date DESC;where:postadderss='$address'",5); ?>
<?php if(is_array($lists['posts'])): $i = 0; $__LIST__ = $lists['posts'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i; $smeta=json_decode($vo['smeta'], true); $photo = $smeta[photo]; ?>
				<li>
					<div class="allist-l">
						<h1><?php echo ($vo["post_title"]); ?></h1>
							<div class="list-anli-img">
				 <?php if(!empty($smeta['thumb'])): ?><a href="<?php echo leuu('article/index',array('id'=>$vo['tid'],'cid'=>$vo['term_id']));?>"><img src="<?php echo sp_get_asset_upload_path($smeta['thumb']);?>" alt="<?php echo ($vo["post_title"]); ?>">
					</a>
					<?php else: endif; ?>
				</div>
				<p><?php echo ($vo["post_excerpt"]); ?></p>
				<div class="anli-btngroups">
					<button class="yuyueclick">预约看馆</button>
					<button class="yuyueclick">免费咨询</button>
				</div>
					</div>
					<div class="allist-r">
						<h1>
							现场照片 
						</h1>
						<?php if($photo): if(is_array($photo)): foreach($photo as $key=>$vo): ?><div class="photopic" >
				<img src="<?php echo sp_get_asset_upload_path($vo['url']);?>" alt="<?php echo ($vo["alt"]); ?>"> 
				</div><?php endforeach; endif; ?>
			<?php else: endif; ?>
					</div>
				</li><?php endforeach; endif; else: echo "" ;endif; ?>	
</ul>

</div>
 <div class="pagination"><ul><?php echo ($lists['page']); ?></ul></div>
			
 
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

 
 
﻿<div id="index-bg-fixed">
</div>
<!-- 快速预约 -->
<div class="fixed-wapper" id="index-yuyue">
<div class="fixed-content">
<div class="fixed-logo"><img src="/images/index-fixed-logo.png"></div>
<div class="fixed-close">
	<img src="/images/index-fixed-close.png">
</div>
<div class="form">
<h1>快速预约</h1>
	<p class="form-p">您选择的条件如下:</p>
	<p class="select-p">选择地点
<?php $getaddress=sp_getaddress(); if(isset($_SESSION['address'])){ $address=$_SESSION['address']; }else{ $address=$getaddress[0]['address']; } ?>
<select  name="address" >
<?php if(is_array($getaddress)): foreach($getaddress as $key=>$vo): if($vo["address"] == $address): ?><option value="<?php echo ($vo["address"]); ?>" selected=""><?php echo ($vo["address"]); ?></option>
				<?php else: ?><option value="<?php echo ($vo["address"]); ?>" ><?php echo ($vo["address"]); ?></option><?php endif; endforeach; endif; ?>
 </select>
		<!-- <select  name="address"><option>北京·太阳公元</option>
	<option>上海·外滩</option>
	<option>天津·爱琴海</option>
	<option>南京·外秦淮</option>
	<option>南京·1865</option>
	</select>  -->
	选择桌数<select name="number"><option>10桌以内</option>
	<option>10-16桌</option>
	<option>16桌以上</option>
	</select>
	</p>
	<input type="text" name="uname" placeholder="请输入您的姓名">
<input type="text" name="utel" placeholder="请输入您的手机号">
<p class="red" id="yy-errormessage"></p>
<button onclick="addpost('预约')">提交预约</button>
</div>

</div>
</div>
<!-- 发送地址 -->
<div class="fixed-wapper" id="index-address">
<div class="fixed-content">
<div class="fixed-logo"><img src="/images/index-fixed-logo.png"></div>
<div class="fixed-close">
	<img src="/images/index-fixed-close.png">
</div>
<div class="form">
	<p class="form-p">请选择门店</p>
	<p class="select-big-p">
	<?php $getaddress=sp_getaddress(); if(isset($_SESSION['address'])){ $address=$_SESSION['address']; }else{ $address=$getaddress[0]['address']; } ?>
<select  name="address" >
<?php if(is_array($getaddress)): foreach($getaddress as $key=>$vo): if($vo["address"] == $address): ?><option value="<?php echo ($vo["address"]); ?>" selected=""><?php echo ($vo["address"]); ?></option>
				<?php else: ?><option value="<?php echo ($vo["address"]); ?>" ><?php echo ($vo["address"]); ?></option><?php endif; endforeach; endif; ?></select> <!--  <select name="address"><option>北京·太阳公元</option>
	<option>上海·外滩</option>
	<option>天津·爱琴海</option>
	<option>南京·外秦淮</option>
	<option>南京·1865</option>
	</select> 	 -->
	</p>
	<p class="form-p">请输入您的手机号</p>
<input type="text" name="phone" placeholder="请输入您的手机号">
<p class="red" id="address-errormessage"></p>
<button onclick="addpost('地址')">发送地址</button>
</div>

</div>
</div>
<!-- 查询档期 -->
<div class="fixed-wapper" id="index-dangqi">
<div class="fixed-content">
<div class="fixed-logo"><img src="/images/index-fixed-logo.png"></div>
<div class="fixed-close">
	<img src="/images/index-fixed-close.png">
</div>
<div class="form">
<h1>查询档期</h1>
	
	<p class="select-p-big">请选择门店
		<?php $getaddress=sp_getaddress(); if(isset($_SESSION['address'])){ $address=$_SESSION['address']; }else{ $address=$getaddress[0]['address']; } ?>
<select  name="address" >
<?php if(is_array($getaddress)): foreach($getaddress as $key=>$vo): if($vo["address"] == $address): ?><option value="<?php echo ($vo["address"]); ?>" selected=""><?php echo ($vo["address"]); ?></option>
				<?php else: ?><option value="<?php echo ($vo["address"]); ?>" ><?php echo ($vo["address"]); ?></option><?php endif; endforeach; endif; ?></select> <!-- <select name="address"><option>北京·太阳公元</option>
	<option>上海·外滩</option>
	<option>天津·爱琴海</option>
	<option>南京·外秦淮</option>
	<option>南京·1865</option>
	</select>  -->
	</p>
	<p class="form-p">请选择日期</p>
	<input type="text" name="datetime" placeholder="请选择日期" readonly="" id="checkdatetime">
	<p class="form-p">请输入您的手机号</p>
<input type="text" name="utel" placeholder="请输入您的手机号">
<p class="red" id="date-errormessage"></p>
<button onclick="addpost('日期')">提交预约</button>
</div>

</div>
</div>
 
</body>
</html>
<script type="text/javascript">
	$('.yuyueclick').click(function(){
 	 $('#index-bg-fixed').show();
 	 $('#index-yuyue').show();
 });
    $('.fixed-close').click(function(){
 	$(this).parents('.fixed-wapper').hide();
    $('#index-bg-fixed').hide();
  });
  function addpost(postname){   
	  switch(postname)
		{
		case 'yuyue':
		$('#yy-errormessage').text('');
		if(!$('#index-yuyue input[name=uname]').val()){
			$('#yy-errormessage').text('姓名不能为空!');
			return false;
		}
		if(!$('#index-yuyue input[name=utel]').val()){
			$('#yy-errormessage').text('手机号不能为空!');
			return false;
		}
		var postdata={
			full_name:$('#index-yuyue input[name=uname]').val(),
			address:$('#index-yuyue select[name=address]').val(),
			number:$('#index-yuyue select[name=number]').val(),
			tel:$('#index-yuyue input[name=utel]').val(),
			from:postname

		}
		ajaxpost(postdata);		   
		break;
		case 'address':
		$('#address-errormessage').text('');
		if(!$('#index-address input[name=phone]').val()){
			$('#address-errormessage').text('手机号不能为空!');
			return false;
		}	
		var postdata={
			address:$('#index-address select[name=address]').val(),
			tel:$('#index-address input[name=phone]').val(),
			from:postname

		}
		ajaxpost(postdata);		
		  break;
		  case 'date':
		  $('#date-errormessage').text('');
		  if(!$('#index-dangqi input[name=utel]').val()){
			$('#date-errormessage').text('手机号不能为空!');
			return false;
		}
		if(!$('#index-dangqi input[name=datetime]').val()){
			$('#date-errormessage').text('请选择日期!');
			return false;
		}
		var postdata={
			address:$('#index-dangqi select[name=address]').val(),
			datetime:$('#index-dangqi input[name=datetime]').val(),
			tel:$('#index-dangqi input[name=utel]').val(),
			from:postname

		}
		ajaxpost(postdata);	
		   break;
		default:
		  break;
		}    
          
 }
 function ajaxpost(data){
 	  $.ajax({
            url:"<?php echo U('user/center/indexformadd');?>",
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