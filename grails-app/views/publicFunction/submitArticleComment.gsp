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
					<time class="date" datetime="<g:utcDate date="${new Date()}"></g:utcDate>"></time>
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