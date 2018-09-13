<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <title><?php echo ($site_seo_title); ?> <?php echo ($site_name); ?></title>
    <meta name="keywords" content="<?php echo ($site_seo_keywords); ?>"/>
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
<div class="logo-wap-top">
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
 
<?php if ($_SESSION["mainnav"] == 2) { if ($_SESSION['address'] == '北京·太阳公元') { $biao = "sw-mgl-banner"; } elseif ($_SESSION['address'] == '上海·外滩') { $biao = "sw-sh-banner"; } elseif ($_SESSION['address'] == '天津·爱琴海') { $biao = "sw-tj-banner"; } elseif ($_SESSION['address'] == '南京·外秦淮') { $biao = "sw-njwq-banner"; } elseif ($_SESSION['address'] == '南京·1865') { $biao = "sw-nj-banner"; } else { $biao = "sw-mgl-banner"; } } else { if ($_SESSION['address'] == '北京·太阳公元') { $biao = "mgl-banner"; } elseif ($_SESSION['address'] == '上海·外滩') { $biao = "sh-banner"; } elseif ($_SESSION['address'] == '天津·爱琴海') { $biao = "tj-banner"; } elseif ($_SESSION['address'] == '南京·外秦淮') { $biao = "njwq-banner"; } elseif ($_SESSION['address'] == '南京·1865') { $biao = "nj-banner"; } else { $biao = "mgl-banner"; } } $home_slides=sp_getslide($biao,$limit=5,$order = "listorder ASC"); ?>
<div class="main-banner">
    <link rel="stylesheet" href="/css/swiper.min.css">
    <style>
        .swiper-container {
            width: 100%;
            height: 100%;
        }
        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;

            /* Center slide text vertically */
            display: -webkit-box;
            display: -ms-flexbox;
            display: -webkit-flex;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            -webkit-align-items: center;
            align-items: center;
        }
    </style>
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <?php if(is_array($home_slides)): foreach($home_slides as $key=>$vo): ?><div class="swiper-slide"><a href="<?php echo ($vo["slide_url"]); ?>"><img src="<?php echo sp_get_asset_upload_path($vo['slide_pic']);?>" alt=""></a></div><?php endforeach; endif; ?>
        </div>
    </div>
    <!-- Swiper JS -->
    <script src="/js/swiper.min.js"></script>
    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper('.swiper-container');
    </script>
</div>

<div class=" mtb50 clear">
    <div class="about-left">
        <h2><span>关于我们</span>About LAVIN</h2>
        <ul class="sublist_title">
            <?php $_result=findsnav(8);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li
                <?php if($vo["label"] == $post_title): ?>class="active"<?php endif; ?>
                ><a href="<?php echo ($vo["href"]); ?>"><?php echo ($vo["label"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
    </div>
    <div class="about-right">
        <h2>
            <?php if ($id ==4 or $id == 137) { echo substr($post_title,10); } else { echo $post_title; } ?>
        </h2>

        <div id="article_content">
            <?php if ($id == 4) { if ($_SESSION['mainnav'] == 1) { $pages = sp_sql_page(4); } else { $pages = sp_sql_page(137); } echo $pages['post_content']; } else { echo $post_content; } ?>
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
<script src="/js/jquery.SuperSlide.2.1.2.js"></script>
<script src="/themes/simplebootx/Public/js/slippry.min.js"></script>
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