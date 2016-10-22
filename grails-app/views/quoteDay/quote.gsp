<!DOCTYPE html>
<%@page import="java.lang.Math"%>
<html>
	<head>
		<meta name="layout" content="quoteWeb"/>
		<style>
			.navbar-default.navbar-fixed-top{background: transparent;}
			body{margin-top: 0px;}
		</style>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:false,isTopTenActive:false,isPollActive:false,isQuestionActive:false,isLinkActive:false,isQuoteActive:false]"></g:render>
		<div class="page0">
			<div class="qcont qote qfz${Math.round(quoteView.quote.length()/100)}">
				${quoteView.quote}								
				<a href="<g:createLink uri="/quoteDay/author/${quoteView.quoteAuthor}"/>"><span class="qaut tpgq">${quoteView.quoteAuthorName}</span></a>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-8 cbpd">	
					<g:if test="${user && user.isAdmin}">
						<div class="mtb5" style="float: right;">
							<div class="g-plus" data-action="share" data-annotation="none" data-height="24" data-href="${metaData['url']}"></div>
							<a class="brd3 hswa" target="_blank" href="<g:createLink uri="/quote/edit/${quoteView.id}"/>">Edit</a>
					     </div>
					     <div style="clear: both;"></div>
					</g:if>				
					<div class="conbor wbg">
						<g:if test="${flash}">
							<div class="alert alert-success" role="alert"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> ${flash.message}</div>
						</g:if>						
						<g:set var="quoteOwner" value="${quoteView.quoteOwner}"></g:set>
						<g:set var="readMoreUrl"><g:createLink uri="/quoteDay/quote/${quoteView.id}/${seoCovert(title:quoteView.quote)}"/></g:set>
						<div id="fbInfo${quoteView.id}" class="hidden">
							<g:if test="${quoteView.imageName}"><i class="fbImage" fbdata="<g:createLink uri="/newsImages/d490/${quoteView.imageName}"/>"></i></g:if>
							<g:else><i class="fbImage" fbdata="<g:createLink uri="/images/bddeshdefault/defaultQuote.jpg"/>"></i></g:else>
							<i class="fbTitle" fbdata="${quoteView.quote}"></i>
							<i class="fbDescription" fbdata="${quoteView.quoteAuthorName}"></i>
							<i class="fbLink" fbdata="${readMoreUrl}"></i>
						</div>
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
							<div class="mmb5 media">
								<div class="media-left">							    
								    <div class="usr">
										<a href="<g:createLink uri="/profile/of/${quoteOwner.id}/${quoteOwner.username}"/>"><g:if test="${quoteOwner.displayName}">${quoteOwner.displayName}</g:if><g:else>${quoteOwner.username}</g:else></a>
										<g:message code="postcode5"/>
									</div>
									<div class="dt nldt">
										<span aria-hidden="true" class="glyphicon glyphicon-time"></span>
										<time class="date" datetime="<g:utcDate date="${quoteView.dateCreated}"></g:utcDate>"></time>
									</div>
								</div>
								<div class="media-body"></div>
								<div class="media-right">	
									<a class="pstType cat5" href="<g:createLink uri="/quoteDay"/>">&nbsp;</a>
								</div>  
							</div>
							<div class="brd3 qote qcc${quoteView.id%10}">
								${quoteView.quote}								
								<a href="<g:createLink uri="/quoteDay/author/${quoteView.quoteAuthor}"/>"><span class="qaut">${quoteView.quoteAuthorName}</span></a>
							</div>
							<div class="qoteAuth">
								Author: <a href="<g:createLink uri="/quoteDay/author/${quoteView.quoteAuthor}"/>">${quoteView.quoteAuthorName}</a>
							</div>
							<g:if test="${quoteView.topicHashword}">							
								<g:set var="hashwdList" value="${quoteView.topicHashword.split(' ')}"></g:set>	
								<div class="qoteHash">
									<g:each var="hashwd" in="${hashwdList}"> 
										<g:if test="${hashwd && hashwd.length() > 0}">
											<a href="<g:createLink uri="/quoteDay/hashword/${hashwd.substring(1)}"/>" class="brd3 hswa">${hashwd}</a>
										</g:if>					
									</g:each>
								</div>
							</g:if>
							<div class="usrBox">
				        		<div aria-label="button group" role="group" class="btn-group">					        			
				        			<a id="quLike${quoteView.id}" onclick="javascript:likeQuote(${quoteView.id})" role="button" class="btn btn-default" href="javascript:void(0)">
				        				<span aria-hidden="true" class="glyphicon glyphicon-thumbs-up"></span><span class="cmlld">${quoteView.totalLike}</span>
				        			</a>
				        			<a id="quTotalComment${quoteView.id}" role="button" class="btn btn-default" href="<g:createLink uri="/quoteDay/quote/${quoteView.id}/${seoCovert(title:quoteView.quote)}"/>">
				        				<span aria-hidden="true" class="glyphicon glyphicon-comment"></span><span class="cmlld">${quoteView.totalComment}</span>
				        			</a>				        			
				        			<a role="button" class="fb btn btn-default" onclick="javascript:shareFacebook(${quoteView.id})" href="javascript:void(0)">
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
										<textarea autocomplete="off" id="quoteComment${quoteView.id}" onkeyup="javascript:submitQuoteComment('${quoteView.id}',this,event)" class="form-control cusTxtBx comBox" placeholder="<g:message code="commentEnter"/>" title="Please enter comment" rows="1"></textarea>
									</div>
								</div>
							</div>
							<div id="quoteComments${quoteView.id}" class="artCmts">
								<g:each var="quoteCommentUser" in="${quoteComments}">
									<g:set var="quoteComment" value="${quoteCommentUser[0]}"></g:set>
									<g:set var="commentOwner" value="${quoteCommentUser[1]}"></g:set>
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
														<time class="date" datetime="<g:utcDate date="${quoteComment.dateCreated}"></g:utcDate>"></time>
													</div>
													<div class="aCmt linkingText">
														${quoteComment.comment}
													</div>
													<div class="usrBox cmtBx">
											       		<div aria-label="button group" role="group" class="btn-group">					        			
											       			<a id="quCmtLike${quoteComment.id}" onclick="javascript:likeQuoteComment(${quoteComment.id})" role="button" class="btn btn-default" href="javascript:void(0)">
											       				<span aria-hidden="true" class="glyphicon glyphicon-thumbs-up"></span><span class="cmlld">${quoteComment.totalLike}</span>
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
						<g:render template="/publicFunction/quoteSectionNoImage" model="[user:user,quotes:authorQuotes]"></g:render>
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
							<g:render template="/home/shareBox" model="[metaData:metaData,tTag:'Quote']"></g:render>
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
			var isNewsFeed = true;
			$(function(){
				$('#rightSec').css({'width':$('#rightSec').width()+'px'});				
				if($('#rightSec').height() > $(window).innerHeight()-50)
					$('#rightSec').addClass('bFixed');
				else
					$('#rightSec').addClass('tFixed');					
				var topOffset = $('#rightSec').offset().top;				
				$('#rightSec').affix({
					offset: {
						top: topOffset,
					    bottom: 5,
					}
				});	
				$(window).scroll(function(){
					if($(window).scrollTop() > 60)
				    	$('.navbar-default.navbar-fixed-top').css({'background':'#f8f8f8'});
				    else
				    	$('.navbar-default.navbar-fixed-top').css({'background':'transparent'});
								           
				});			
			});
		</script>
	</body>
</html>

 
