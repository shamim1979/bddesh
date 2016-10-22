<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="newsWeb"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:false,isTopTenActive:false,isPollActive:false,isQuestionActive:false,isLinkActive:false]"></g:render>
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-8 cbpd">
					<div class="conbor wbg">
						<g:if test="${flash}">
							<div class="alert alert-success" role="alert"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> ${flash.message}</div>
						</g:if>
						<g:if test="${user && user.isAdmin}">
							<div class="mtb5" style="float: right;">
								<div class="g-plus" data-action="share" data-annotation="none" data-height="24" data-href="${metaData['url']}"></div>
								<a class="brd3 hswa" target="_blank" href="<g:createLink uri="/newsArticle/edit/${newsArticleView.id}"/>">Edit</a>
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
						<g:set var="articleOwner" value="${newsArticleView.articleOwner}"></g:set>
						<div class="cbx">
							<div class="mmb5 media">
								<div class="media-left">							    
								    <a href="<g:createLink uri="/profile/of/${articleOwner.id}/${articleOwner.username}"/>"><g:if test="${articleOwner && articleOwner.profileImage}">
										<img src="<g:createLink uri="/newsImages/d50/${articleOwner.profileImage}"/>" class="media-object s40 rndImg">
									</g:if>
									<g:else>
										<g:if test="${articleOwner && articleOwner.gender}">
											<img src="<g:createLink uri="/images/bddeshdefault/femaleProfileSmall.jpeg"/>" class="media-object s40 rndImg">
										</g:if>
										<g:else>
											<img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="media-object s40 rndImg">
										</g:else>
									</g:else></a>
								</div>
								<div class="media-body">
									<div class="usr">
										<a href="<g:createLink uri="/profile/of/${articleOwner.id}/${articleOwner.username}"/>"><g:if test="${articleOwner.displayName}">${articleOwner.displayName}</g:if><g:else>${articleOwner.username}</g:else></a>
										<g:message code="postcode${newsArticleView.postType}"/>
									</div>
									<div class="dt nldt">
										<span aria-hidden="true" class="glyphicon glyphicon-time"></span>
										<time class="date" datetime="<g:utcDate date="${newsArticleView.dateCreated}"></g:utcDate>"></time>
									</div>
								</div>
								<div class="media-right">	
									<a class="pstType cat${newsArticleView.postType}" href="javascript:void(0)">&nbsp;</a>
								</div> 
							</div>
							<g:if test="${newsArticleView.title}">
								<div class="pstTtl linkingText">
									<h2>${newsArticleView.title}</h2>
								</div>
							</g:if>
							<g:if test="${newsArticleView.imageName}">
								<div class="artImg">
									<img src="<g:createLink uri="/newsImages/d490/${newsArticleView.imageName}"/>" class="covphCen">
								</div>
							</g:if>
							<div class="pstDes">
								<div class="pDsc linkingText">${newsArticleView.detailsDescription}</div>
							</div>
							<g:if test="${newsArticleView.newsLink}">
								<div class="pstDes">
									${raw(newsArticleView.newsLink)}
								</div>
							</g:if>
							<div class="usrBox">
				        		<div aria-label="button group" role="group" class="btn-group">					        			
				        			<a id="arLike${newsArticleView.id}" onclick="javascript:likeArticle(${newsArticleView.id})" role="button" class="btn btn-default" href="javascript:void(0)">
				        				<span aria-hidden="true" class="glyphicon glyphicon-thumbs-up"></span><span class="cmlld">${newsArticleView.totalLike}</span>
				        			</a>
				        			<a id="arTotalComment${newsArticleView.id}" onclick="javascript:void(0)" role="button" class="btn btn-default" href="javascript:void(0)">
				        				<span aria-hidden="true" class="glyphicon glyphicon-comment"></span><span class="cmlld">${newsArticleView.totalComment}</span>
				        			</a>				        			
				        			<a role="button" class="fb btn btn-default" onclick="javascript:shareFacebook(${newsArticleView.id})" href="javascript:void(0)">
				        				<span aria-hidden="true" class="fbShare brd3"></span><span class="cmlld"></span>
				        			</a>			        			
				        		</div>
					        </div>
					        <div class="comSub">
								<div class="media">
									<div class="media-left">
										<g:if test="${user}">												    
										    <g:if test="${user.profileImage}">
												<img src="<g:createLink uri="/newsImages/d50/${user.profileImage}"/>" class="media-object s30 rndImg">
											</g:if>
											<g:else>
												<g:if test="${user.gender}">
													<img src="<g:createLink uri="/images/bddeshdefault/femaleProfileSmall.jpeg"/>" class="media-object s30 rndImg">
												</g:if>
												<g:else>
													<img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="media-object s30 rndImg">
												</g:else>
											</g:else>
										</g:if>
										<g:else>
											<img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="media-object s30 rndImg">
										</g:else>
									</div>
									<div class="media-body">
										<textarea autocomplete="off" id="articleComment${newsArticleView.id}" onkeyup="javascript:submitArticleComment('${newsArticleView.id}',this,event)" class="form-control cusTxtBx comBox" placeholder="<g:message code="commentEnter"/>" title="Please enter comment" rows="1"></textarea>
									</div>
								</div>
							</div>
							<div id="articleComments${newsArticleView.id}" class="artCmts">
								<g:each var="articleCommentUser" in="${articleComments}">
									<g:set var="articleComment" value="${articleCommentUser[0]}"></g:set>
									<g:set var="commentOwner" value="${articleCommentUser[1]}"></g:set>
									<div class="mb5">
										<div class="cmBrb">
											<div class="media">
												<div class="media-left">												    
												    <a href="<g:createLink uri="/profile/of/${commentOwner.id}/${commentOwner.username}"/>"><g:if test="${commentOwner && commentOwner.profileImage}">
														<img src="<g:createLink uri="/newsImages/d50/${commentOwner.profileImage}"/>" class="media-object s30 rndImg">
													</g:if>
													<g:else>
														<g:if test="${commentOwner && commentOwner.gender}">
															<img src="<g:createLink uri="/images/bddeshdefault/femaleProfileSmall.jpeg"/>" class="media-object s30 rndImg">
														</g:if>
														<g:else>
															<img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="media-object s30 rndImg">
														</g:else>
													</g:else></a>
												</div>
												<div class="media-body">
													<div class="usr ucmt">
														<a href="<g:createLink uri="/profile/of/${commentOwner.id}/${commentOwner.username}"/>"><g:if test="${commentOwner.displayName}">${commentOwner.displayName}</g:if><g:else>${commentOwner.username}</g:else></a>
													</div>
													<div class="dt nldt nlcdt">
														<span aria-hidden="true" class="glyphicon glyphicon-time"></span>
														<time class="date" datetime="<g:utcDate date="${articleComment.dateCreated}"></g:utcDate>"></time>
													</div>
													<div class="aCmt linkingText">
														${articleComment.comment}
													</div>
													<div class="usrBox cmtBx">
											       		<div aria-label="button group" role="group" class="btn-group">					        			
											       			<a id="arCmtLike${articleComment.id}" onclick="javascript:likeArticleComment(${articleComment.id})" role="button" class="btn btn-default" href="javascript:void(0)">
											       				<span aria-hidden="true" class="glyphicon glyphicon-thumbs-up"></span><span class="cmlld">${articleComment.totalLike}</span>
											       			</a>		        			
											       		</div>
											       	</div>
												</div>
											</div>
										</div>
									</div>
								</g:each>							
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
						<g:render template="/publicFunction/newsSection" model="[user:user,newsArticles:newsArticles,isHome:isHome]"></g:render>						
					</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
					<div id="rightSec" class="">
						<div class="conbor wbg">
							<g:render template="/home/shareBox" model="[metaData:metaData,tTag:'News']"></g:render>
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
	</body>
</html>

 
