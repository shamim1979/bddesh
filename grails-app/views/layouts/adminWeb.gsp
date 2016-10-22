<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title><g:layoutTitle default="Bddesh24 the foremost social portal in Bangladesh" /></title>
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="bddesh.css"/>
		<asset:javascript src="bddesh.js"/>
		<asset:javascript src="adminUser.js"/>
		<asset:javascript src="public.js"/>
		<script type="text/javascript">
			var rootDirectoy = "${createLink(uri: '/')}";
			var loginUrl = "<g:createLink uri="/login/auth"/>";
		</script>
		<g:layoutHead />
	</head>
	<body>	
		<g:layoutBody />
		<div id="fb-root"></div>	
		<script>		    
			window.fbAsyncInit = function() {
		    	FB.init({
		        	appId      : '1072979889379772',
		          	xfbml      : true,
		          	version    : 'v2.0'
		        });
		    };
	
		    (function(d, s, id){
		    	var js, fjs = d.getElementsByTagName(s)[0];
		        if (d.getElementById(id)) {return;}
		        js = d.createElement(s); js.id = id;
		        js.src = "//connect.facebook.net/en_US/sdk.js";
		        fjs.parentNode.insertBefore(js, fjs);
		 	}(document, 'script', 'facebook-jssdk'));
		
		</script>
		<div id="lloading" class="hidden">
			<img src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod"/>
		</div>
		<script>
			!function(d,s,id){
				var js,fjs=d.getElementsByTagName(s)[0];
				if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";
					fjs.parentNode.insertBefore(js,fjs);
				}
			}(document,"script","twitter-wjs");
	 	</script>
	 	<script src="https://apis.google.com/js/platform.js" async defer></script>
	 	<div id="errMsgSec" class="brd3 flushMsg">
			<span class="glyphicon glyphicon-exclamation-sign scd" aria-hidden="true"></span> <span id="errMsgCode"></span>
		</div>
	</body>
</html>

