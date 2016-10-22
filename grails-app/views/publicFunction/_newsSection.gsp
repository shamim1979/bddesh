<g:set var="lastFeedDate" value=""></g:set>
<g:each var="newsArticle" in="${newsArticles}">	
	<g:set var="articleOwner" value="${newsArticle[0]}"></g:set>
	<g:set var="article" value="${newsArticle[1]}"></g:set>
	<g:set var="lastFeedDate" value="${article.dateCreated}"></g:set>
	<g:set var="hasMore" value="${false}"></g:set>
	<g:set var="readMoreText" value="Read More..."></g:set>
	<g:if test="${isHome}"><g:set var="readMoreUrl"><g:createLink uri="/news"/></g:set></g:if><g:else><g:set var="readMoreUrl">javascript:void(0)</g:set></g:else>
	<g:set var="imageUrl"><g:createLink uri="/images/bddeshdefault/defaultArticle.jpg"/></g:set>
	<g:if test="${article.title}"><g:set var="fbTtitle">${article.title}</g:set></g:if><g:else><g:set var="fbTtitle">Bddesh24 news</g:set></g:else>
	<g:if test="${article.hasDetails}">
		<g:set var="hasMore" value="${true}"></g:set>
		<g:set var="readMoreUrl"><g:createLink uri="/news/article/${article.id}/${seoCovert(title:article.title)}"/></g:set>
	</g:if>
	<g:if test="${article.postType == 2}">
		<g:set var="readMoreUrl"><g:createLink uri="/topTenz/topList/${article.postId}/${seoCovert(title:article.title)}"/></g:set>
		<g:set var="hasMore" value="${true}"></g:set>
		<g:set var="readMoreText" value="List Details..."></g:set>
		<g:set var="imageUrl"><g:createLink uri="/images/bddeshdefault/defaultTopTen.jpg"/></g:set>
		<g:if test="${article.title}"><g:set var="fbTtitle">${article.title}</g:set></g:if><g:else><g:set var="fbTtitle">Bddesh24 top ten list</g:set></g:else>
	</g:if>
	<g:elseif test="${article.postType == 3}">
		<g:set var="readMoreUrl"><g:createLink uri="/pollz/result/${article.postId}/${seoCovert(title:article.title)}"/></g:set>
		<g:set var="hasMore" value="${true}"></g:set>
		<g:set var="readMoreText" value="Poll Details..."></g:set>
		<g:set var="imageUrl"><g:createLink uri="/images/bddeshdefault/defaultPoll.jpg"/></g:set>
		<g:if test="${article.title}"><g:set var="fbTtitle">${article.title}</g:set></g:if><g:else><g:set var="fbTtitle">Bddesh24 poll</g:set></g:else>
	</g:elseif>
	<g:elseif test="${article.postType == 4}">
		<g:set var="readMoreUrl"><g:createLink uri="/ask/answer/${article.postId}/${seoCovert(title:article.title)}"/></g:set>
		<g:set var="hasMore" value="${true}"></g:set>
		<g:set var="readMoreText" value="Answer Details..."></g:set>
		<g:set var="imageUrl"><g:createLink uri="/images/bddeshdefault/defaultQuestion.jpg"/></g:set>
		<g:if test="${article.title}"><g:set var="fbTtitle">${article.title}</g:set></g:if><g:else><g:set var="fbTtitle">${article.detailsDescription}</g:set></g:else>
	</g:elseif>
	<g:elseif test="${article.postType == 5}">
		<g:set var="readMoreUrl"><g:createLink uri="/quoteDay/quote/${article.postId}/${seoCovert(title:article.title)}"/></g:set>
		<g:set var="hasMore" value="${true}"></g:set>
		<g:set var="readMoreText" value="Quote Details..."></g:set>
		<g:set var="imageUrl"><g:createLink uri="/images/bddeshdefault/defaultQuote.jpg"/></g:set>
		<g:if test="${article.title}"><g:set var="fbTtitle">${article.title}</g:set></g:if><g:else><g:set var="fbTtitle">${article.detailsDescription}</g:set></g:else>
	</g:elseif>
	<div class="wbg cmtb bpt${article.postType}">
		<div id="fbInfo${article.id}" class="hidden">
			<g:if test="${article.imageName}"><i class="fbImage" fbdata="<g:createLink uri="/newsImages/d490/${article.imageName}"/>"></i></g:if>
			<g:else><i class="fbImage" fbdata="${imageUrl}"></i></g:else>
			<i class="fbTitle" fbdata="${fbTtitle}"></i>
			<i class="fbDescription" fbdata="${article.shortDescription}"></i>
			<i class="fbLink" fbdata="${readMoreUrl}"></i>
		</div>
		<div class="tbx nbb">
			<div class="media">
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
						<g:message code="postcode${article.postType}"/>
					</div>
					<div class="dt nldt">
						<span aria-hidden="true" class="glyphicon glyphicon-time"></span>
						<time class="date" datetime="<g:utcDate date="${article.dateCreated}"></g:utcDate>"></time>
					</div>
				</div>
				<div class="media-right">	
					<a class="pstType cat${article.postType}" href="${readMoreUrl}" <g:if test="${isHome}">target="_blank"</g:if>>&nbsp;</a>
				</div> 
			</div>
		</div>
		<div class="cbx">
			<g:if test="${article.imageName}">
				<g:if test="${article.title}">
					<div class="pstTtl linkingText">
						${article.title}
					</div>
				</g:if>
				<g:if test="${hasMore}">
					<a href="${readMoreUrl}" <g:if test="${isHome}">target="_blank"</g:if>>
						<div class="imgPst">
							<div class="row">
								<div class="col-sm-6 col-md-6 col-lg-6 cbpd">	
									<g:if test="${article.postType == 5}">	
										<img src="<g:createLink uri="/newsImages/d220/${article.imageName}"/>" class="covphCen m2">
									</g:if>
									<g:else>
										<img src="<g:createLink uri="/newsImages/d160/${article.imageName}"/>" class="covphCen m2">
									</g:else>
								</div>
								<div class="col-sm-6 col-md-6 col-lg-6 cbpd">
									<div class="pstDes">
										<div class="pDsc linkingText">${article.shortDescription}</div><span class="conbor rdMr">${readMoreText}</span>
									</div>
								</div>
							</div>
						</div>
					</a>
				</g:if>
				<g:else>
					<div class="imgPst">
						<div class="row">
							<div class="col-sm-6 col-md-6 col-lg-6 cbpd">
								<img src="<g:createLink uri="/newsImages/d160/${article.imageName}"/>" class="covphCen m2">
							</div>
							<div class="col-sm-6 col-md-6 col-lg-6 cbpd">
								<div class="pstDes linkingText">
									${article.detailsDescription}
								</div>
							</div>
						</div>
					</div>
				</g:else>
				<g:if test="${article.newsLink}">
					<div class="pstDes">
						${raw(article.newsLink)}
					</div>
				</g:if>
				<g:if test="${article.hashWords}">
					<g:set var="hashwdList" value="${article.hashWords.split(' ')}"></g:set>	
					<div class="qoteHash">
						<g:each var="hashwd" in="${hashwdList}"> 
							<g:if test="${hashwd && hashwd.length() > 0}">
								<a href="<g:createLink uri="/hashword/article/${hashwd.substring(1)}"/>" class="brd3 hswa">${hashwd}</a>
							</g:if>					
						</g:each>
					</div>
				</g:if>
				<div class="usrBox">
	        		<div aria-label="button group" role="group" class="btn-group">					        			
	        			<a id="arLike${article.id}" onclick="javascript:likeArticle(${article.id})" role="button" class="btn btn-default" href="javascript:void(0)">
	        				<span aria-hidden="true" class="glyphicon glyphicon-thumbs-up"></span><span class="cmlld">${article.totalLike}</span>
	        			</a>
	        			<a id="arTotalComment${article.id}" onclick="javascript:showArticleComments('${article.id}')" role="button" class="btn btn-default" href="javascript:void(0)">
	        				<span aria-hidden="true" class="glyphicon glyphicon-comment"></span><span class="cmlld">${article.totalComment}</span>
	        			</a>				        			
	        			<a role="button" class="fb btn btn-default" onclick="javascript:shareFacebook(${article.id})" href="javascript:void(0)">
	        				<span aria-hidden="true" class="fbShare brd3"></span><span class="cmlld"></span>
	        			</a>			        			
	        		</div>
		        </div>
	        	<div id="articleComments${article.id}">							
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
							<textarea autocomplete="off" id="articleComment${article.id}" onkeyup="javascript:submitArticleComment('${article.id}',this,event)" class="form-control cusTxtBx comBox" placeholder="<g:message code="commentEnter"/>" title="Please enter comment" rows="1"></textarea>
						</div>
					</div>
				</div>
			</g:if>
			<g:else>
				<g:if test="${article.title}">
					<div class="pstTtl linkingText">
						${article.title}
					</div>
				</g:if>
				<g:if test="${hasMore}">
					<a href="${readMoreUrl}" <g:if test="${isHome}">target="_blank"</g:if>>
						<g:if test="${article.postType == 5}">
							<div class="brd3 qote hmeq">
								<div>"${article.shortDescription}"</div><span class="conbor rdMr">${readMoreText}</span>
							</div>
						</g:if>
						<g:else>
							<div class="pstDes">
								<div class="pDsc">${article.shortDescription}</div><span class="conbor rdMr">${readMoreText}</span>
							</div>
						</g:else>						
					</a>
					</g:if>
				<g:else>
					<div class="pstDes">
						<div class="pDsc linkingText">${article.detailsDescription}</div>
					</div>
				</g:else>
				<g:if test="${article.newsLink}">
					<div class="pstDes">
						${raw(article.newsLink)}
					</div>
				</g:if>
				<g:if test="${article.hashWords}">
					<g:set var="hashwdList" value="${article.hashWords.split(' ')}"></g:set>	
					<div class="qoteHash">
						<g:each var="hashwd" in="${hashwdList}"> 
							<g:if test="${hashwd && hashwd.length() > 0}">
								<a href="<g:createLink uri="/hashword/article/${hashwd.substring(1)}"/>" class="brd3 hswa">${hashwd}</a>
							</g:if>					
						</g:each>
					</div>
				</g:if>
				<div class="usrBox">
		        	<div aria-label="button group" role="group" class="btn-group">					        			
	        			<a id="arLike${article.id}" onclick="javascript:likeArticle(${article.id})" role="button" class="btn btn-default" href="javascript:void(0)">
	        				<span aria-hidden="true" class="glyphicon glyphicon-thumbs-up"></span><span class="cmlld">${article.totalLike}</span>
	        			</a>
	        			<a id="arTotalComment${article.id}" onclick="javascript:showArticleComments('${article.id}')" role="button" class="btn btn-default" href="javascript:void(0)">
	        				<span aria-hidden="true" class="glyphicon glyphicon-comment"></span><span class="cmlld">${article.totalComment}</span>
	        			</a>				        			
	        			<a role="button" class="fb btn btn-default" onclick="javascript:shareFacebook(${article.id})" href="javascript:void(0)">
	        				<span aria-hidden="true" class="fbShare brd3"></span><span class="cmlld"></span>
	        			</a>			        			
		        	</div>
		        </div>
	        	<div id="articleComments${article.id}">								        												
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
							<textarea autocomplete="off" id="articleComment${article.id}" onkeyup="javascript:submitArticleComment('${article.id}',this,event)" class="form-control cusTxtBx comBox" placeholder="<g:message code="commentEnter"/>" title="Please enter comment" rows="1"></textarea>
						</div>
					</div>
				</div>
			</g:else>
		</div>
	</div>
</g:each>
<script type="text/javascript">
	lastFeedDate = "${lastFeedDate}";
</script>


						  		