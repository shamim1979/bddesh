<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pollHashWeb"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:false,isTopTenActive:false,isPollActive:false,isQuestionActive:false,isLinkActive:false]"></g:render>
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-8 cbpd">
					<div class="brd3 wbg mmt10">
						<div class="prel">
							<div id="profileCoverImage">
								<g:if test="${pollTag.coverImage}">
									<img src="<g:createLink uri="/newsImages/d690/${pollTag.coverImage}"/>" class="covphCen brd3">
								</g:if>
								<g:else>
									<img src="<g:createLink uri="/images/bddeshdefault/newDefaultCoverImage.jpg"/>" class="covphCen brd3">
								</g:else>
							</div>
							<g:if test="${user && user.isAdmin}">
								<div class="abs pciUp text-center">
									<a class="ihbx" href="javascript:void(0)" onclick="javascript:addPhoto('hwpollz')">
										<span aria-hidden="true" class="glyphicon glyphicon-camera"></span>
									</a>
								</div>
								<img id="pImageLoader" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="abs absLdr hidden"/>
								<div id="pCSvbtn" class="abs pcsbtnp"></div>
							</g:if>
							<div class="abs hwTag">#${pollTag.pollTag}</div>
						</div>
					</div>
					<div id="hashFeedList" class="row">
						<g:if test="${user && user.isAdmin}">
							<div class="hwDes p5">									
								<div class="cibb">
									<textarea autocomplete="off" name="hwDescription" id="hwDescription" class="form-control cusTxtBx" placeholder="<g:message code="hwDescription"/>" title="Please enter your opinion" rows="3"></textarea>
								</div>
								<div class="sbmt">
									<img id="hwSubmit" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
									<button id="hwDescriptionSubmitForm" onclick="javascript:submitHWDescription('hwpollz');" class="conbor sbbtn cmb0 lbtnw" type="button">Post</button>
								</div>
								<div style="clear: both;"></div>
					  		</div>
				  		</g:if>
				  		<g:if test="${pollTag.tagDescription}">
				  			<div class="col-sm-12 col-md-12 col-lg-12 cbpd">
				  				<div class="conbor wbg"><div class="cbx hwTtle"><h2>${pollTag.tagDescription}</h2></div></div>
				  			</div>
				  		</g:if>
						<g:render template="/publicFunction/pollSection" model="[user:user,pollItemsMap:pollItemsMap]"></g:render>
					</div>
					<div id="feedMoreLoader" class="moreLoader hidden">
						<img src="<g:createLink uri="/images/newscss/loader2.gif"/>">
					</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
					<div id="rightSec" class="mmt10">
						<div class="conbor wbg">
							<g:render template="/home/shareBox" model="[metaData:metaData,tTag:tTag]"></g:render>
							<g:render template="/home/popularPollHashword" model="[usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags]"></g:render>
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
			var tag = '${pollTag.id}';
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
						loadMoreHashNews('pollz');       
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

 
