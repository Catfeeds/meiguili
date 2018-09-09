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
		<link rel="stylesheet" href="/css/swiper.min.css">
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
 
<link href="/themes/simplebootx/Public/css/slippry/slippry.css" rel="stylesheet">        	
	 
       
 <div class="clear"></div>
<?php $home_slides=sp_getslide("mgl-banner",$limit=5); ?>

<ul id="homeslider" class="unstyled">
    <?php if(is_array($home_slides)): foreach($home_slides as $key=>$vo): ?><li>
            <a href="<?php echo ($vo["slide_url"]); ?>"><img src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" alt=""></a>
        </li><?php endforeach; endif; ?>
</ul>

<div class="clear"></div>
<div class="w1200 mtb50 clear">
<div class="anli-title clear"><?php echo ($post_title); ?></div>
<div class="anli-arc-left">
<div class="anli-arc-des">
	<?php echo ($post_excerpt); ?>
</div>
<div class="anli-arc-pic">
 <?php $photo = $smeta[photo]; ?>
<?php if($photo): ?><div class="pc-slide">
	<div class="view">
		<div class="swiper-container">
			<a class="arrow-left" href="#"></a>
			<a class="arrow-right" href="#"></a>
			<div class="swiper-wrapper">
			<?php if(is_array($photo)): foreach($photo as $key=>$vo): ?><div class="swiper-slide">
				<img src="<?php echo sp_get_asset_upload_path($vo['url']);?>" alt="<?php echo ($vo["alt"]); ?>"> 
				</div><?php endforeach; endif; ?>
 				 
			</div>
		</div>
	</div>
	<div class="preview">
		<a class="arrow-left" href="#"></a>
		<a class="arrow-right" href="#"></a>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<?php if(is_array($photo)): foreach($photo as $key=>$vo): ?><div class="swiper-slide  <?php if( $key == 0): ?>active-nav<?php endif; ?> " >
				<img src="<?php echo sp_get_asset_upload_path($vo['url']);?>" alt="<?php echo ($vo["alt"]); ?>"> 
				</div><?php endforeach; endif; ?>
			</div>
		</div>
	</div>
</div><?php endif; ?>
 
	 
</div>

</div>
<div class="anli-arc-right">
<div class="tit">案例介绍</div>
<?php echo ($post_content); ?>
</div>
<div class="clear"></div>
	<div class="comeback"><a href="/index.php?m=list&a=index&id=<?php echo ($term_id); ?>">返回列表</a></div>
 	<div class="clear"></div>
 
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
 <script src="/js/swiper.js"></script>
<script>
var viewSwiper = new Swiper('.view .swiper-container', {
	on:{
		slideChangeTransitionStart: function() {
		    updateNavPosition()
	    }
	}
})

$('.view .arrow-left,.preview .arrow-left').on('click', function(e) {
	e.preventDefault()
	if (viewSwiper.activeIndex == 0) {
		viewSwiper.slideTo(viewSwiper.slides.length - 1, 1000);
		return
	}
	viewSwiper.slidePrev()
})
$('.view .arrow-right,.preview .arrow-right').on('click', function(e) {
	e.preventDefault()
	if (viewSwiper.activeIndex == viewSwiper.slides.length - 1) {
		viewSwiper.slideTo(0, 1000);
		return
	}
	viewSwiper.slideNext()
})

var previewSwiper = new Swiper('.preview .swiper-container', {
	//visibilityFullFit: true,
	slidesPerView: 'auto',
	allowTouchMove: false,
	on:{
		tap: function() {
		    viewSwiper.slideTo(previewSwiper.clickedIndex)
	  }
	}
})

function updateNavPosition() {
		$('.preview .active-nav').removeClass('active-nav')
		var activeNav = $('.preview .swiper-slide').eq(viewSwiper.activeIndex).addClass('active-nav')
		if (!activeNav.hasClass('swiper-slide-visible')) {
			if (activeNav.index() > previewSwiper.activeIndex) {
				var thumbsPerNav = Math.floor(previewSwiper.width / activeNav.width()) - 1
				previewSwiper.slideTo(activeNav.index() - thumbsPerNav)
			} else {
				previewSwiper.slideTo(activeNav.index())
			}
		}
	}
</script>