<g:each var="answerUserLst" in="${answers}">
	<g:set var="answerOwner" value="${answerUserLst[0]}"></g:set>
	<g:set var="answer" value="${answerUserLst[1]}"></g:set>
	<g:if test="${!(answer.isBest)}">
		<g:if test="${user && user.isAdmin}">
			<div class="mtb5">
				<a class="brd3 hswa" target="_blank" href="<g:createLink uri="/answer/edit/${answer.id}"/>">Edit</a>
		     </div>
		</g:if>
		<div class="mb5">
			<div class="ansBdr">
				<div class="media">
					<div class="media-left">												    
					    <a href="<g:createLink uri="/profile/of/${answerOwner.id}/${answerOwner.username}"/>"><g:if test="${answerOwner && answerOwner.profileImage}">
							<img src="<g:createLink uri="/newsImages/d50/${answerOwner.profileImage}"/>" class="media-object s40 fulRndImg">
						</g:if>
						<g:else>
							<g:if test="${answerOwner && answerOwner.gender}">
								<img src="<g:createLink uri="/images/bddeshdefault/femaleProfileSmall.jpeg"/>" class="media-object s40 fulRndImg">
							</g:if>
							<g:else>
								<img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="media-object s40 fulRndImg">
							</g:else>
						</g:else></a>
					</div>
					<div class="media-body">
						<div class="usr">
							<a href="<g:createLink uri="/profile/of/${answerOwner.id}/${answerOwner.username}"/>"><g:if test="${answerOwner.displayName}">${answerOwner.displayName}</g:if><g:else>${answerOwner.username}</g:else></a>
						</div>
						<div class="dt nldt">
							<span aria-hidden="true" class="glyphicon glyphicon-time"></span>
							<time class="date" datetime="<g:utcDate date="${answer.dateCreated}"></g:utcDate>"></time>
						</div>
						<g:if test="${user && user.isAdmin}">
							<div id="pollAnsImgSave${answer.id}">
								<a class="sbbtn brd3 psbtnw"  style="width: 100%" href="javascript:void(0)" onclick="javascript:addPhoto('danswer',${answer.id})">Add Photo</a>
							</div>
						</g:if>
						<g:if test="${answer.imageName}">
							<div class="mt5">
								<img src="<g:createLink uri="/newsImages/d490/${answer.imageName}"/>" class="covphCen m2">
							</div>
						</g:if>						
						<div class="aTxt linkingText">
							${answer.detailsDescription}
						</div>
						<div class="usrBox cmtBx">
				       		<div aria-label="button group" role="group" class="btn-group">					        			
				       			<a id="qAnsLike${answer.id}" onclick="javascript:likeAnswer(${answer.id})" role="button" class="btn btn-default" href="javascript:void(0)">
				       				<span aria-hidden="true" class="glyphicon glyphicon-thumbs-up"></span><span class="cmlld">${answer.totalVote}</span>
				       			</a>
				       			<g:if test="${(user && user.isAdmin) || (user == answerOwner)}">	
					       			<a id="qAnsBest${answer.id}" onclick="javascript:bestAnswer(${answer.id})" role="button" class="btn btn-default" href="javascript:void(0)">
					       				<span aria-hidden="true" class="glyphicon glyphicon-star"></span><span class="cmlld">Best</span>
					       			</a>
				       			</g:if>	       				        			
				       		</div>
				       	</div>
					</div>
				</div>
			</div>
		</div>
	</g:if>
</g:each>