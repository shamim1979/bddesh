<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="newspaperHashWeb"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:false,isTopTenActive:false,isPollActive:false,isQuestionActive:false,isLinkActive:false]"></g:render>
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-8 cbpd">
					<div class="brd3 wbg mmt10">
						<div class="prel">
							<div id="profileCoverImage">
								<g:if test="${newsSourceTag.coverImage}">
									<img src="<g:createLink uri="/newsImages/d690/${newsSourceTag.coverImage}"/>" class="covphCen brd3">
								</g:if>
								<g:else>
									<img src="<g:createLink uri="/images/bddeshdefault/newDefaultCoverImage.jpg"/>" class="covphCen brd3">
								</g:else>
							</div>
							<g:if test="${user && user.isAdmin}">
								<div class="abs pciUp text-center">
									<a class="ihbx" href="javascript:void(0)" onclick="javascript:addPhoto('hwlinkz')">
										<span aria-hidden="true" class="glyphicon glyphicon-camera"></span>
									</a>
								</div>
								<img id="pImageLoader" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="abs absLdr hidden"/>
								<div id="pCSvbtn" class="abs pcsbtnp"></div>
							</g:if>
							<div class="abs hwTag">#${newsSourceTag.newsSourceTag}</div>
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
									<button id="hwDescriptionSubmitForm" onclick="javascript:submitHWDescription('hwlinkz');" class="conbor sbbtn cmb0 lbtnw" type="button">Post</button>
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
				  		<g:if test="${newsSourceTag.tagDescription}">
				  			<div class="cbx hwTtle"><h2>${newsSourceTag.tagDescription}</h2></div>
				  		</g:if>
						<div class="cbx">
							<g:render template="/hashword/newsSourceSection" model="[]"></g:render>
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
					</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4 cbpd">					
					<div id="rightSec" class="mmt10">
						<div class="conbor wbg">
							<g:render template="/home/shareBox" model="[metaData:metaData,tTag:tTag]"></g:render>
							<g:render template="/home/newspapersRightSec" model="[]"></g:render>
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
			var tag = '${newsSourceTag.id}';
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
			});
		</script>
	</body>
</html>

 
