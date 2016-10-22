<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="topTenWeb"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:false,isTopTenActive:false,isPollActive:false,isQuestionActive:false,isLinkActive:false]"></g:render>
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-8 cbpd">
					<g:if test="${user && user.isAdmin}">
						<div class="mtb5" style="float: right;">
							<div class="g-plus" data-action="share" data-annotation="none" data-height="24" data-href="${metaData['url']}"></div>
							<a class="brd3 hswa" target="_blank" href="<g:createLink uri="/topTen/edit/${topTenView.id}"/>">Edit</a>
					     </div>
					     <div style="clear: both;"></div>
					</g:if>
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
							<g:set var="topTenOwner" value="${topTenView.topTenOwner}"></g:set>
							<g:if test="${user &&((topTenOwner == user) || user.isAdmin) }"><g:set var="canChange" value="${true}"></g:set></g:if>
							<div class="ttqbr">
								<div class="media">
									<div class="media-left">												    
									     <a href="<g:createLink uri="/profile/of/${topTenOwner.id}/${topTenOwner.username}"/>"><g:if test="${topTenOwner && topTenOwner.profileImage}">
											<img src="<g:createLink uri="/newsImages/d50/${topTenOwner.profileImage}"/>" class="media-object s40 fulRndImg">
										</g:if>
										<g:else>
											<g:if test="${topTenOwner && topTenOwner.gender}">
												<img src="<g:createLink uri="/images/bddeshdefault/femaleProfileSmall.jpeg"/>" class="media-object s40 fulRndImg">
											</g:if>
											<g:else>
												<img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="media-object s40 fulRndImg">
											</g:else>
										</g:else></a>
									</div>
									<div class="media-body">
										<div class="usr">
											<a href="<g:createLink uri="/profile/of/${topTenOwner.id}/${topTenOwner.username}"/>"><g:if test="${topTenOwner.displayName}">${topTenOwner.displayName}</g:if><g:else>${topTenOwner.username}</g:else></a>
										</div>
										<div class="dt nldt">
											<span aria-hidden="true" class="glyphicon glyphicon-time"></span>
											<time class="date" datetime="<g:utcDate date="${topTenView.dateCreated}"></g:utcDate>"></time>
										</div>
									</div>
									<div class="media-right">	
										<a class="pstType cat2" href="<g:createLink uri="/topTenz"/>">&nbsp;</a>
									</div>
								</div>								
								<div class="ttTtl ttv">
									<h2>${topTenView.title}</h2>
								</div>
								<g:if test="${topTenView.imageName}">
									<div class="ttImg">
										<img src="<g:createLink uri="/newsImages/d490/${topTenView.imageName}"/>" class="covphCen rndImg">
									</div>
								</g:if>
								<div class="ttDes">
									${topTenView.detailsDescription}
								</div>
							</div>
							<div class="aditm">									
								<div class="cibb">
									<textarea onfocus="javascript:hasUser();" autocomplete="off" name="newTopTenItem" id="newTopTenItem" class="form-control cusTxtBx" placeholder="<g:message code="newTopTenItem"/>" title="Please enter new item" rows="1"></textarea>
								</div>
								<div class="sbmt">
									<img id="itSubmit" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
	        						<button id="ntiSubmitForm" onclick="javascript:submitNewItem(${topTenView.id});" class="conbor sbbtn cmb0" type="button">Add Item</button>
								</div>
								<div style="clear: both;"></div>
	      					</div>
							<div id="ttiList">
								<g:each var="topTenItemOpinionMap" in="${topTenItemsOpinionMap}" status="i">
									<g:set var="topTenItem" value="${topTenItemOpinionMap.key}"></g:set>
									<g:set var="itemOpinions" value="${topTenItemOpinionMap.value}"></g:set>
									<div class="titibx">
										<div class="row">
											<div class="col-sm-12 col-md-12 col-lg-12 cbpd">
												<g:if test="${user && user.isAdmin}">
													<div class="mtb5">
														<a class="brd3 hswa" target="_blank" href="<g:createLink uri="/topTenItem/edit/${topTenItem.id}"/>">Edit</a>
												     </div>
												</g:if>												
												<div class="tbx tnbb mt5">
													<div class="media">
														<div class="media-left">												    
														    <div class="tCon tNum text-center t${i+1}">${i+1}</div>
														</div>
														<div class="media-body">
															<div class="ttTtl"><h3>${topTenItem.title}</h3></div>
														</div>
														<div class="media-right">
															<a href="javascript:void(0)" onclick="javascript:voteShowOpinion('${topTenItem.id}');"><div id="tItmVLk${topTenItem.id}" class="vtl mtm5"><img src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="tiLdr llod hidden"/><span class="vfcol itemVote">Vote</span><span class="vfcol itemPercent hidden"></span><span class="vfcol itemTotVote hidden">${topTenItem.totalVote}</span> <span aria-hidden="true" class="glyphicon glyphicon-ok-circle"></span></div></a>
														</div>
													</div>
													<div id="itemOpinionList${topTenItem.id}">
														<g:each var="itemOpinion" in="${itemOpinions}">
															<g:if test="${user && user.isAdmin}">
																<div class="mtb5">
																	<a class="brd3 hswa" target="_blank" href="<g:createLink uri="/topTenOpinion/edit/${itemOpinion.id}"/>">Edit</a>
															     </div>
															</g:if>
															<div class="media tcmt">
																<div class="media-left">												    
																    <span class="cmtq">&quot;</span>
																</div>
																<div class="media-body">
																	<span class="cmtc">${itemOpinion.opinion}</span>
																</div>
																<div class="media-right">	
																	<div class="cmtv"><a href="javascript:void(0)" onclick="javascript:likeIOpinion('${itemOpinion.id}','up')"><span aria-hidden="true" class="glyphicon glyphicon-triangle-top tvbtn tCon"></span></a><span id="tov${itemOpinion.id}" class="tov">${itemOpinion.totalLike}</span><a href="javascript:void(0)" onclick="javascript:likeIOpinion('${itemOpinion.id}','down')"><span aria-hidden="true" class="glyphicon glyphicon-triangle-bottom tvbtn tCon"></span></a></div>
																</div>
															</div>
														</g:each>
													</div>
												</div>
											</div>
										</div>
										<div id="tItemOpinion${topTenItem.id}" class="tiopn topirc">
										</div>
									</div>
								</g:each>
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
							<div id="totalTenVote" class="hidden">${topTenView.totalVote}</div>
							<div id="itemOpinionForm" class="hidden">									
								<div class="cibb">
									<textarea autocomplete="off" name="newTopTenItemOpinion" id="newTopTenItemOpinion" class="form-control cusTxtBx" placeholder="<g:message code="newTopTenItemOpinion"/>" title="Please enter your opinion" rows="3"></textarea>
								</div>
								<div class="sbmt">
									<img id="tOpinionSubmit" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
									<button onclick="javascript:removeOpinionForm();" class="conbor sbbtn clsbtn cmb0 lbtnw" type="button">Pass</button>
	        						<button id="tOpinionSubmitForm" onclick="javascript:submitItemOpinion();" class="conbor sbbtn cmb0 lbtnw" type="button">Opinion</button>
								</div>
								<div style="clear: both;"></div>
	      					</div> 
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
					<div id="rightSec" class="">
						<div class="conbor wbg">
							<g:render template="/home/shareBox" model="[metaData:metaData,tTag:'TopTen']"></g:render>
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

 
