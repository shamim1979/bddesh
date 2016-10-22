<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="topTenWeb"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:false,isTopTenActive:true,isPollActive:false,isQuestionActive:false,isLinkActive:false]"></g:render>
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-8 cbpd">
					<g:if test="${user}">
						<g:render template="/home/userPostSection" model="[isNewsActive:false,isTopTenActive:true,isPollActive:false,isQuestionActive:false]"></g:render>
					</g:if>
					<div class="conbor wbg">
						<div class="gAds">
							<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
							<!-- Top Banner Ads -->
							<ins class="adsbygoogle"
							     style="display:block"
							     data-ad-client="ca-pub-6843494013222478"
							     data-ad-slot="9923362344"
							     data-ad-format="auto"></ins>
							<script>
							(adsbygoogle = window.adsbygoogle || []).push({});
							</script>
						</div>
						<div id="topTenFeedList">
							<g:render template="/publicFunction/topTenSection" model="[topTenList:topTenList,user:user]"></g:render>
							<div class="gAds">
								<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
								<!-- Bottom Text Ads -->
								<ins class="adsbygoogle"
								     style="display:block"
								     data-ad-client="ca-pub-6843494013222478"
								     data-ad-slot="2899623145"
								     data-ad-format="auto"></ins>
								<script>
								(adsbygoogle = window.adsbygoogle || []).push({});
								</script>
							</div>
						</div>
						<div id="feedMoreLoader" class="moreLoader hidden">
							<img src="<g:createLink uri="/images/newscss/loader2.gif"/>">
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
					<g:render template="/home/newspapersRightSec" model="[]"></g:render>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
				$('#rightSec').css({'width':$('#rightSec').width()+'px'});
				var topOffset = 50;	
				if($('#rightSec').height() > $(window).innerHeight()-50){	
					$('#rightSec').addClass('bFixed');
					topOffset = $('#rightSec').height()-$(window).innerHeight()-50
				}
				else{
					$('#rightSec').addClass('tFixed');	
				}					
				$('#rightSec').affix({
					offset: {
						top: topOffset,
					    bottom: 5,
					}
				});
				$(window).scroll(function(){					
					if($(window).scrollTop() > $(document).height() - $(window).height() - 500)						
						loadMoreToptenz();        
				});
			});			
		</script>
	</body>
</html>

 
