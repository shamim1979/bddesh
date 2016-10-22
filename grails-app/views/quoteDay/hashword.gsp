<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="quoteWeb"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:false,isTopTenActive:false,isPollActive:false,isQuestionActive:false,isLinkActive:false,isQuoteActive:false]"></g:render>
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-8 cbpd">
					<div class="brd3 wbg mmt10">
						<div class="prel">
							<div id="profileCoverImage">
								<g:if test="${quoteTag.coverImage}">
									<img src="<g:createLink uri="/newsImages/d690/${quoteTag.coverImage}"/>" class="covphCen brd3">
								</g:if>
								<g:else>
									<img src="<g:createLink uri="/images/bddeshdefault/newDefaultCoverImage.jpg"/>" class="covphCen brd3">
								</g:else>
							</div>
							<g:if test="${user && user.isAdmin}">
								<div class="abs pciUp text-center">
									<a class="ihbx" href="javascript:void(0)" onclick="javascript:addPhoto('hwquote')">
										<span aria-hidden="true" class="glyphicon glyphicon-camera"></span>
									</a>
								</div>
								<img id="pImageLoader" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="abs absLdr hidden"/>
								<div id="pCSvbtn" class="abs pcsbtnp"></div>
							</g:if>							
							<div class="abs fqote">"${quotes[0][0].quote}"</div>
							<div class="abs hwTag">#${quoteTag.topic}</div>
						</div>
					</div>
					<div class="conbor wbg">
						<g:if test="${user && user.isAdmin}">
							<div class="hwDes p5">									
								<div class="cibb">
									<textarea autocomplete="off" name="hwDescription" id="hwDescription" class="form-control cusTxtBx" placeholder="<g:message code="hwDescription"/>" title="Please enter your opinion" rows="3"></textarea>
								</div>
								<div class="sbmt">
									<img id="hwSubmit" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
									<button id="hwDescriptionSubmitForm" onclick="javascript:submitHWDescription('hwquote');" class="conbor sbbtn cmb0 lbtnw" type="button">Post</button>
								</div>
								<div style="clear: both;"></div>
					  		</div>
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
				  		<g:if test="${quoteTag.topicDescription}">
				  			<div class="cbx hwTtle"><h2>${quoteTag.topicDescription}</h2></div>
				  		</g:if>
						<div id="quoteFeedList">
							<g:render template="/publicFunction/quoteSectionNoImage" model="[user:user,quotes:quotes]"></g:render>
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
					<div id="rightSec" class="mmt10">
						<div class="conbor wbg">
							<g:render template="/home/shareBox" model="[metaData:metaData,tTag:tTag]"></g:render>
							<g:render template="/quoteDay/authorList" model="[]"></g:render>
					 	</div>
					</div>
				</div>
			</div>
		</div>
		<div class="hidden">
			<input type="file" id="uploadImageFile" name="uploadImageFile">
			<div class="canvas-containter">
	        	<canvas id="dst-pica" class="img-responsive"></canvas>
	        </div>
			<div class="canvas-containter">
	        	<canvas id="src" class="img-responsive"></canvas>
	        </div>
		</div>
		<script type="text/javascript">
			var tag = '${quoteTag.id}';
			var quoteLocation = 'hashword';
			var tagAuthor = '${quoteTag.topic}';
			$(function(){
				$('#rightSec').css({'width':$('#rightSec').width()+'px'});
				var topOffset = 50;	
				if($('#rightSec').height() > $(window).innerHeight()-50){
					$('#rightSec').addClass('bFixed');
					topOffset = $('#rightSec').height()-$(window).innerHeight()-50;
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
						loadMoreQuotes();        
				});				
			});
		</script>
	</body>
</html>

 
