<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
		<script>
		  (adsbygoogle = window.adsbygoogle || []).push({
		    google_ad_client: "ca-pub-6843494013222478",
		    enable_page_level_ads: true
		  });
		</script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<g:if test="${newsSourceItem}"><meta name="keywords" content="${keyWords} bddesh24"/>
			<g:if test="${newsSourceItem.shortDescription}"><g:set var="articleDescription" value="${newsSourceItem.shortDescription}"></g:set></g:if><g:else><g:set var="articleDescription" value="Best news sources and news links in the world"></g:set></g:else>
			<g:if test="${newsSourceItem.title}"><g:set var="articleTitle" value="bddesh24 - ${newsSourceItem.title}"></g:set></g:if><g:else><g:set var="articleTitle" value="bddesh24 - Top all newspapers in the world"></g:set></g:else>
			<meta name="description" content="Bddesh24 ${articleDescription}" />
			<meta name="author" content="bddesh24.com" />
			<meta property="og:title" content="${articleTitle}"/>
			<meta property="og:site_name" content="bddesh24"/>
			<meta property="og:description" content="${articleDescription}"/>
			<meta property="og:type" content="article"/>
			<meta property="og:url" content="http://www.bddesh24.com/linkz/newsSourceItem/${newsSourceItem.id}"/>
			<meta property="og:image" content="http://www.bddesh24.com/images/bddeshdefault/defaultLinkz.jpg"/>
			<meta name="twitter:card" content="summary_large_image">
			<meta name="twitter:site" content="@bddesh24">
			<meta name="twitter:creator" content="bddesh24">
			<meta name="twitter:title" content="${articleTitle}">
			<meta name="twitter:description" content="${articleDescription}">
			<meta name="twitter:image" content="http://www.bddesh24.com/images/bddeshdefault/defaultLinkz.jpg"/>
			<title><g:layoutTitle default="${articleTitle}" /></title></g:if><g:else><meta name="keywords" content="bddesh24, newspaper, newspapers, all newspapers, top newspapers, bangladesh newspaper, bangladesh newspapers, top bangladesh newspapers, indian newspapers, usa newspapers, world newspapers"/>
			<meta name="description" content="bddesh24 - all best national and local newspapers in the world" />
			<meta name="author" content="bddesh24.com" />
			<title><g:layoutTitle default="Bddesh24 | all top newspapers in the world" /></title></g:else>
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="bddesh.css"/>
		<asset:javascript src="bddesh.js"/>
		<asset:javascript src="user.js"/>
		<asset:javascript src="linkzLinker.js"/>
		<asset:javascript src="public.js"/>
		<script type="text/javascript">
			var rootDirectoy = "${createLink(uri: '/')}";
			var isLogged = "<g:if test="${user}">yes</g:if><g:else>no</g:else>";
			var lastFeedDate = "";
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
			  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
			  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
			  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
			
			  ga('create', 'UA-72808906-1', 'auto');
			  ga('send', 'pageview');
		</script>
		<script>
			!function(d,s,id){
				var js,fjs=d.getElementsByTagName(s)[0];
				if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";
					fjs.parentNode.insertBefore(js,fjs);
				}
			}(document,"script","twitter-wjs");
	 	</script>
	 	<script src="https://apis.google.com/js/platform.js" async defer></script>
		<div id="bcModal" class="modal fade" role="dialog">
  			<div class="modal-dialog">
  				<div class="modal-content brd4">
      				<div class="modal-header pcHad">
        				<button type="button" class="close" data-dismiss="modal">&times;</button>
        				<h4 id="mHeader" class="modal-title"></h4>
					</div>
      				<div class="modal-body p0">
      					<div class="nano">
    						<div class="nano-content">
    							<div id="mContent" class="pcCon">
		        				</div>
    						</div>
						</div>
      				</div>
      				<div id="mFooter" class="modal-footer pcFot">
      				</div>
    			</div>
  			</div>
  		</div>  		
  		<div id= "tmpContainer" class="hidden">
  		</div>
  		<div id="errMsgSec" class="brd3 flushMsg">
			<span class="glyphicon glyphicon-exclamation-sign scd" aria-hidden="true"></span> <span id="errMsgCode"></span>
		</div>
		<div id="linkzPostSec">
			<div class="conbor wbg inbx">
				<div class="cbx">
					<div class="cibb">
						<textarea autocomplete="off" name="cLink" id="cLink" class="form-control cusTxtBx" placeholder="<g:message code="cUserLink"/>" title="Please enter article title" rows="1"></textarea>
					</div>
					<div class="sbmt">
						<img id="linksubmit" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
						<button id="regSubmitLinkz" name="regSubmitLinkz" onclick="javascript:submitLink();" class="conbor sbbtn" type="button">Save Linkz</button>
					</div>
					<div style="clear: both;"></div>
				</div>
			</div>
		</div>
	</body>
</html>

