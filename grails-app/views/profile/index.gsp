<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="homeWeb"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:false,isTopTenActive:false,isPollActive:false,isQuestionActive:false,isLinkActive:false]"></g:render>
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-8 cbpd">
					<g:render template="/home/userPostSection" model="[isNewsActive:true,isTopTenActive:false,isPollActive:false,isQuestionActive:false]"></g:render>
					<div class="conbor wbg">
						<div id="newsFeedList">
							<g:render template="/publicFunction/newsSection" model="[user:user,newsArticles:newsArticles,isHome:isHome]"></g:render>
						</div>
						<div id="feedMoreLoader" class="moreLoader hidden">
							<img src="<g:createLink uri="/images/newscss/loader2.gif"/>">
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
					<div id="rightSec" class="rSecFix">
						<div class="conbor wbg">
					 		<p>Hello there test</p>
					 		<p>Hello there test</p>
					 		<p>Hello there test</p>
					 		<p>Hello there test</p>
					 	</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			var isNewsFeed = false;
			$(function(){
				$('#rightSec').css({'width':$('#rightSec').width()+'px'})
				$(".linkingText").linker();
				$(".linkingText").removeClass('linkingText');
				$(window).scroll(function(){
					if($('#rightSec').height() > $(window).innerHeight()){
						if(($(window).scrollTop() > $('#rightSec').height() - $(window).innerHeight()) && !$('#rightSec').hasClass('botFixed') && $('#newsFeedList').height() > $('#rightSec').height()){
							$('#rightSec').addClass('botFixed');
						}
						else{
							if(($(window).scrollTop() < $(window).innerHeight()) && $('#rightSec').hasClass('botFixed'))
								$('#rightSec').removeClass('botFixed');
						}
					}
					else{
						if(!$('#rightSec').hasClass('topFixed'))
							$('#rightSec').addClass('topFixed');
					}
					if($(window).scrollTop() > $(document).height() - $(window).height() - 500)						
						loadMoreNewsArticles();        
				});
			});
		</script>
	</body>
</html>

 
