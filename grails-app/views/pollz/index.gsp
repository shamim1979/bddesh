<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pollWeb"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:false,isTopTenActive:false,isPollActive:true,isQuestionActive:false,isLinkActive:false]"></g:render>
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-8 cbpd">
					<g:if test="${user}">
						<g:render template="/home/userPostSection" model="[isNewsActive:false,isTopTenActive:false,isPollActive:true,isQuestionActive:false]"></g:render>
					</g:if>
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
					<div id="pollFeedList" class="row">
						<g:render template="/publicFunction/pollSection" model="[user:user,pollItemsMap:pollItemsMap]"></g:render>
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
						loadMorePoll();        
				});
			});			
		</script>
		<div id="pollOpinionForm" class="hidden">									
			<div class="cibb">
				<textarea autocomplete="off" name="newPollOpinion" id="newPollOpinion" class="form-control cusTxtBx" placeholder="<g:message code="newPollOpinion"/>" title="Please enter your opinion" rows="3"></textarea>
			</div>
			<div class="sbmt">
				<img id="pOpinionSubmit" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
				<button id="pOpinionSubmitForm" onclick="javascript:submitPollOpinion();" class="conbor sbbtn cmb0 lbtnw" type="button">Opinion</button>
			</div>
			<div style="clear: both;"></div>
  		</div>
	</body>
</html>

 
