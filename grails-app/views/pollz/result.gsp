<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="pollWeb"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:false,isTopTenActive:false,isPollActive:false,isQuestionActive:false,isLinkActive:false]"></g:render>
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-8 cbpd">
					<g:if test="${user && user.isAdmin}">
						<div class="mtb5" style="float: right;">
							<div class="g-plus" data-action="share" data-annotation="none" data-height="24" data-href="${metaData['url']}"></div>
							<a class="brd3 hswa" target="_blank" href="<g:createLink uri="/poll/edit/${pollView.id}"/>">Edit</a>
					     </div>
					     <div style="clear: both;"></div>
					</g:if>
					<g:if test="${pollView.dateCreated + 60 > new Date()}"><g:set var="pollDate" value="${pollView.dateCreated + 60}"></g:set><g:set var="voteEnable" value="${true}"></g:set></g:if><g:else><g:set var="pollDate" value="${pollView.dateCreated}"></g:set><g:set var="voteEnable" value="${false}"></g:set></g:else>
					<g:set var="pollOwner" value="${pollView.pollOwner}"></g:set>
					<g:each var="pollItemMap" in="${pollItemOpinionMap}">
						<g:set var="pollTmpItem" value="${pollItemMap.key}"></g:set>
						<g:if test="${pollTmpItem.isPositive}"><g:set var="positiveItem" value="${pollTmpItem}"></g:set><g:set var="positiveItemOpinions" value="${pollItemMap.value}"></g:set></g:if>
						<g:else><g:set var="oppositeItem" value="${pollTmpItem}"></g:set><g:set var="oppositeItemOpinions" value="${pollItemMap.value}"></g:set></g:else>
					</g:each>					
					<div class="conbor wbg">
						<g:if test="${flash}">
							<div class="alert alert-success" role="alert"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> ${flash.message}</div>
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
						<div class="cbx">
							<div class="media">
								<div class="media-left">							    
								    <a href="<g:createLink uri="/profile/of/${pollOwner.id}/${pollOwner.username}"/>"><g:if test="${pollOwner && pollOwner.profileImage}">
										<img src="<g:createLink uri="/newsImages/d50/${pollOwner.profileImage}"/>" class="media-object s40 fulRndImg">
									</g:if>
									<g:else>
										<g:if test="${pollOwner && pollOwner.gender}">
											<img src="<g:createLink uri="/images/bddeshdefault/femaleProfileSmall.jpeg"/>" class="media-object s40 fulRndImg">
										</g:if>
										<g:else>
											<img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="media-object s40 fulRndImg">
										</g:else>
									</g:else></a>
								</div>
								<div class="media-body">
									<div class="usr">
										<a href="<g:createLink uri="/profile/of/${pollOwner.id}/${pollOwner.username}"/>"><g:if test="${pollOwner.displayName}">${pollOwner.displayName}</g:if><g:else>${pollOwner.username}</g:else></a>
									</div>
									<div class="dt nldt">
										<span aria-hidden="true" class="glyphicon glyphicon-time"></span>
										<time class="date" datetime="<g:utcDate date="${pollView.dateCreated}"></g:utcDate>"></time>
									</div>
								</div>
								<div class="media-right">	
									<a class="pstType cat3" href="<g:createLink uri="/pollz"/>">&nbsp;</a>
								</div>
							</div>
							<g:if test="${user && user.isAdmin}">
								<div id="pollAnsImgSave${pollView.id}">
									<a class="sbbtn brd3 psbtnw" style="width: 100%" href="javascript:void(0)" onclick="javascript:addPhoto('dpoll',${pollView.id})">Add Photo</a>
								</div>
							</g:if>
							<div class="pqttl">
								<h1>${pollView.question}</h1>
							</div>
							<div class="media">
								<div class="media-left">												    
								    <div class="dt">
										<span aria-hidden="true" class="glyphicon glyphicon-time"></span>
										<g:if test="${voteEnable}"><time class="date" datetime="<g:utcDate date="${pollDate}"></g:utcDate>"></time></g:if><g:else>Vote date expired</g:else>
										
									</div>
								</div>
								<div class="media-body">
								</div>
								<div class="media-right">	
									<div class="dt text-right">
										<span aria-hidden="true" class="glyphicon glyphicon-ok-sign"></span> <span id="ptVotes${pollView.id}">${positiveItem.totalVote+oppositeItem.totalVote}</span>
										<span aria-hidden="true" class="glyphicon glyphicon-comment"></span> <span id="ptOpinions${pollView.id}">${positiveItem.totalOpinion+oppositeItem.totalOpinion}</span>
									</div>
								</div>
							</div>
							<ul class="nav nav-tabs hidden">
								<li class="active"><a data-toggle="tab" href="#default${pollView.id}">default</a></li>
						  		<li><a data-toggle="tab" href="#positive${pollView.id}">Positive</a></li>
						  		<li><a data-toggle="tab" href="#opposite${pollView.id}">Opposite</a></li>
						  	</ul>
						  	<div class="tab-content">
						  		<div id="default${pollView.id}" class="tab-pane fade in active">
						  			<g:if test="${user && user.isAdmin}">
										<div class="mtb5">
											<a class="brd3 hswa" target="_blank" href="<g:createLink uri="/pollItem/edit/${positiveItem.id}"/>">Edit</a>
									     </div>
									</g:if>
						  			<a class="phbg" href="javascript:void(0)" onclick="javascript:likePoll('${pollView.id}','1','${positiveItem.id}',${voteEnable})">
										<div class="phbgc">
											<div class="vbtn brd3">
												${positiveItem.title}
											</div>
											<div class="vbtnp">
												<div id="fpvp${pollView.id}" class="vbtnp">
													<span class="pvp <g:if test="${voteEnable}">hidden</g:if>"><g:if test="${positiveItem.totalVote+oppositeItem.totalVote == 0}">0%</g:if><g:else>${Math.round((positiveItem.totalVote/(positiveItem.totalVote+oppositeItem.totalVote))*100)}%</g:else></span><span class="pvc hidden">${positiveItem.totalVote}</span><span class="ovc hidden">${oppositeItem.totalVote}</span>
												</div>
											</div>
											<div class="vdefr">
												${positiveItem.deffence}
											</div>
											<div class="vcmts">
												<span aria-hidden="true" class="glyphicon glyphicon-comment"></span> ${positiveItem.totalOpinion} comment<g:if test="${positiveItem.totalOpinion>1}">s</g:if>
											</div>
										</div>
									</a>
									<div class="polst">
										<g:render template="/publicFunction/pollItemOpinionSection" model="[pollItemOpinions:positiveItemOpinions]"></g:render>					
									</div>
									<g:if test="${user && user.isAdmin}">
										<div class="mtb5">
											<a class="brd3 hswa" target="_blank" href="<g:createLink uri="/pollItem/edit/${oppositeItem.id}"/>">Edit</a>
									     </div>
									</g:if>
									<a class="phbg" href="javascript:void(0)" onclick="javascript:likePoll('${pollView.id}','2','${oppositeItem.id}',${voteEnable})">
										<div class="phbgc">
											<div class="vbtn btnopp brd3">
												${oppositeItem.title}
											</div>
											<div class="vbtnp">
												<div id="fovp${pollView.id}" class="vbtnp">
													<span class="pvp <g:if test="${voteEnable}">hidden</g:if>"><g:if test="${positiveItem.totalVote+oppositeItem.totalVote == 0}">0%</g:if><g:else>${Math.round((oppositeItem.totalVote/(positiveItem.totalVote+oppositeItem.totalVote))*100)}%</g:else></span><span class="pvc hidden">${positiveItem.totalVote}</span><span class="ovc hidden">${oppositeItem.totalVote}</span>
												</div>
											</div>
											<div class="vdefr">
												${oppositeItem.deffence}
											</div>
											<div class="vcmts opcmts">
												<span aria-hidden="true" class="glyphicon glyphicon-comment"></span> ${oppositeItem.totalOpinion} comment<g:if test="${oppositeItem.totalOpinion>1}">s</g:if>
											</div>
										</div>
									</a>
									<div class="polst">
										<g:render template="/publicFunction/pollItemOpinionSection" model="[pollItemOpinions:oppositeItemOpinions]"></g:render>					
									</div>
						  		</div>
						  		<div id="positive${pollView.id}" class="tab-pane">
									<div class="media">
										<div class="media-left media-middle">
											<a href="javascript:void(0)" onclick="javascript:likePoll('${pollView.id}','0')">												    
											    <div class="pFh lftArr brd3">
													<span aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span>
												</div>
											</a>
										</div>
										<div class="media-body">
											<div class="pFh">
												<div class="pc5">
													<div id="pavt${pollView.id}" class="avoted hidden">You have already voted!</div>
													<div class="vbtn brd3">
														${positiveItem.title}
													</div>
													<div class="vbtnp">
														<div id="npvp${pollView.id}" class="vbtnp">
															<span class="pvp <g:if test="${voteEnable}">hidden</g:if>"><g:if test="${positiveItem.totalVote+oppositeItem.totalVote == 0}">0%</g:if><g:else>${Math.round((positiveItem.totalVote/(positiveItem.totalVote+oppositeItem.totalVote))*100)}%</g:else></span><span class="pvc hidden">${positiveItem.totalVote}</span><span class="ovc hidden">${oppositeItem.totalVote}</span>
														</div>
													</div>
													<div id="po${pollView.id}${positiveItem.id}" class="popnm"></div>
													<div id="spo${pollView.id}${positiveItem.id}" class="spopnm"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div id="opposite${pollView.id}" class="tab-pane">
									<div class="media">
										<div class="media-left media-middle">
											<a href="javascript:void(0)" onclick="javascript:likePoll('${pollView.id}','0')">												    
											    <div class="pFh lftArr brd3">
													<span aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span>
												</div>
											</a>
										</div>
										<div class="media-body">
											<div class="pFh">
												<div class="pc5">
													<div id="oavt${pollView.id}" class="avoted hidden">You have already voted!</div>
													<div class="vbtn btnopp brd3">
														${oppositeItem.title}
													</div>
													<div class="vbtnp">
														<div id="novp${pollView.id}" class="vbtnp">
															<span class="pvp <g:if test="${voteEnable}">hidden</g:if>"><g:if test="${positiveItem.totalVote+oppositeItem.totalVote == 0}">0%</g:if><g:else>${Math.round((oppositeItem.totalVote/(positiveItem.totalVote+oppositeItem.totalVote))*100)}%</g:else></span><span class="pvc hidden">${positiveItem.totalVote}</span><span class="ovc hidden">${oppositeItem.totalVote}</span>
														</div>
													</div>
													<div id="po${pollView.id}${oppositeItem.id}" class="popnm"></div>
													<div id="spo${pollView.id}${oppositeItem.id}" class="spopnm"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
						  	</div>
						</div>
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
				<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
					<div id="rightSec" class="">
						<div class="conbor wbg">
							<g:render template="/home/shareBox" model="[metaData:metaData,tTag:'Poll']"></g:render>							
					 		<div class="gAds">
								<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
								<!-- Right Side Ads -->
								<ins class="adsbygoogle"
								     style="display:block"
								     data-ad-client="ca-pub-6843494013222478"
								     data-ad-slot="4911537141"
								     data-ad-format="auto"></ins>
								<script>
								(adsbygoogle = window.adsbygoogle || []).push({});
								</script>
							</div>
					 	</div>
					</div>
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
				
			});			
		</script>
		<div class="hidden">
			<input type="file" id="uploadImageFile" name="uploadImageFile">
			<div class="canvas-containter">
	        	<canvas id="dst-pica" class="img-responsive"></canvas>
	        </div>
			<div class="canvas-containter">
	        	<canvas id="src" class="img-responsive"></canvas>
	        </div>
		</div>
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

 
