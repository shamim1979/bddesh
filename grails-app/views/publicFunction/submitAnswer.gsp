<div class="mb5">
	<div class="ansBdr">
		<div class="media">
			<div class="media-left">												    
			    <a href="<g:createLink uri="/profile/of/${answerOwner.id}/${answerOwner.username}"/>"><g:if test="${answerOwner && answerOwner.profileImage}">
					<img src="<g:createLink uri="/newsImages/d50/${answerOwner.profileImage}"/>" class="media-object s30 fulRndImg">
				</g:if>
				<g:else>
					<g:if test="${answerOwner && answerOwner.gender}">
						<img src="<g:createLink uri="/images/bddeshdefault/femaleProfileSmall.jpeg"/>" class="media-object s30 fulRndImg">
					</g:if>
					<g:else>
						<img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="media-object s30 fulRndImg">
					</g:else>
				</g:else></a>
			</div>
			<div class="media-body">
				<div class="usr ucmt">
					<a href="<g:createLink uri="/profile/of/${answerOwner.id}/${answerOwner.username}"/>"><g:if test="${answerOwner.displayName}">${answerOwner.displayName}</g:if><g:else>${answerOwner.username}</g:else></a>
				</div>
				<div class="dt nldt nlcdt">
					<span aria-hidden="true" class="glyphicon glyphicon-time"></span>
					<time class="date" datetime="<g:utcDate date="${new Date()}"></g:utcDate>"></time>
				</div>
				<div class="aCmt linkingText">
					${newAnswer.detailsDescription}
				</div>
				<div class="usrBox cmtBx">
		       		<div aria-label="button group" role="group" class="btn-group">					        			
		       			<a id="qAnsLike${newAnswer.id}" onclick="javascript:likeAnswer(${newAnswer.id})" role="button" class="btn btn-default" href="javascript:void(0)">
		       				<span aria-hidden="true" class="glyphicon glyphicon-thumbs-up"></span><span class="cmlld">${newAnswer.totalVote}</span>
		       			</a>	
		       			<a id="qAnsBest${newAnswer.id}" onclick="javascript:bestAnswer(<g:if test="${(user && user.isAdmin) || (user == answerOwner)}">'yes'</g:if><g:else>'no'</g:else>,${newAnswer.id})" role="button" class="btn btn-default" href="javascript:void(0)">
		       				<span aria-hidden="true" class="glyphicon glyphicon-star"></span><span class="cmlld">Best</span>
		       			</a>	        			
		       		</div>
		       	</div>
			</div>
		</div>
	</div>
</div>