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
								<g:if test="${quoteAuthor.coverImage}">
									<img title="${quoteAuthor.displayName}" src="<g:createLink uri="/newsImages/d690/${quoteAuthor.coverImage}"/>" class="covphCen brd3">
								</g:if>
								<g:else>
									<img src="<g:createLink uri="/images/bddeshdefault/newDefaultCoverImage.jpg"/>" class="covphCen brd3">
								</g:else>
							</div>
							<g:if test="${canChange}">
								<div class="abs pciUp text-center">
									<a class="ihbx" href="javascript:void(0)" onclick="javascript:addPhoto('apCover')">
										<span aria-hidden="true" class="glyphicon glyphicon-camera"></span>
									</a>
								</div>
								<img id="pImageLoader" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="abs absLdr hidden"/>
								<div id="pCSvbtn" class="abs pcsbtnp"></div>
							</g:if>							
							<div class="abs fqote">"${quotes[0][0].quote}"</div>
							<div class="abs hwTag">${quoteAuthor.displayName}</div>
						</div>
					</div>
					<div class="conbor wbg">
						<g:if test="${user && user.isAdmin}">
							<div class="mtb5" style="float: right;">
								<div class="g-plus" data-action="share" data-annotation="none" data-height="24" data-href="${metaData['url']}"></div>
								<a class="brd3 hswa" target="_blank" href="<g:createLink uri="/quoteAuthor/edit/${quoteAuthor.id}"/>">Edit</a>
						     </div>
						     <div style="clear: both;"></div>
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
			var pUser = '${quoteAuthor.id}';
			var quoteLocation = 'author';
			var tagAuthor = '${quoteAuthor.authorName}';
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

 
