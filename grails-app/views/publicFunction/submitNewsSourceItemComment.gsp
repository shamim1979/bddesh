<div class="mb5">
	<div class="ansBdr">
		<div class="media">
			<div class="media-left">												    
			    <a href="<g:createLink uri="/profile/of/${commentOwner.id}/${commentOwner.username}"/>"><g:if test="${commentOwner && commentOwner.profileImage}">
					<img src="<g:createLink uri="/newsImages/d50/${commentOwner.profileImage}"/>" class="media-object s30 fulRndImg">
				</g:if>
				<g:else>
					<g:if test="${commentOwner && commentOwner.gender}">
						<img src="<g:createLink uri="/images/bddeshdefault/femaleProfileSmall.jpeg"/>" class="media-object s30 fulRndImg">
					</g:if>
					<g:else>
						<img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="media-object s30 fulRndImg">
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
					${newsSourceItemComment.comment}
				</div>
			</div>
		</div>
	</div>
</div>