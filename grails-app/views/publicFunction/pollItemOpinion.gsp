<div class="mb5">
	<div class="piopinion">
		<div class="media">
			<div class="media-left">												    
			    <a href="<g:createLink uri="/profile/of/${pollItemOpnUser.id}/${pollItemOpnUser.username}"/>"><g:if test="${pollItemOpnUser && pollItemOpnUser.profileImage}">
					<img src="<g:createLink uri="/newsImages/d50/${pollItemOpnUser.profileImage}"/>" class="media-object s30 fulRndImg">
				</g:if>
				<g:else>
					<g:if test="${pollItemOpnUser && pollItemOpnUser.gender}">
						<img src="<g:createLink uri="/images/bddeshdefault/femaleProfileSmall.jpeg"/>" class="media-object s30 fulRndImg">
					</g:if>
					<g:else>
						<img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="media-object s30 fulRndImg">
					</g:else>
				</g:else></a>
			</div>
			<div class="media-body">
				<div class="usr ucmt">
					<a href="<g:createLink uri="/profile/of/${pollItemOpnUser.id}/${pollItemOpnUser.username}"/>"><g:if test="${pollItemOpnUser.displayName}">${pollItemOpnUser.displayName}</g:if><g:else>${pollItemOpnUser.username}</g:else></a>
				</div>
				<div class="dt nldt nlcdt">
					<span aria-hidden="true" class="glyphicon glyphicon-time"></span>
					<time class="date" datetime="<g:utcDate date="${new Date()}"></g:utcDate>"></time>
				</div>
				<div class="aCmt linkingText">
					${newPollItemOpinion.opinion}
				</div>
				<div class="usrBox cmtBx">
		       		<div aria-label="button group" role="group" class="btn-group">					        			
		       			<a id="pOpnLike${newPollItemOpinion.id}" onclick="javascript:likePollOpinion(${newPollItemOpinion.id})" role="button" class="btn btn-default" href="javascript:void(0)">
		       				<span aria-hidden="true" class="glyphicon glyphicon-thumbs-up"></span><span class="cmlld">${newPollItemOpinion.totalLike}</span>
		       			</a>		        			
		       		</div>
		       	</div>
			</div>
		</div>
	</div>
</div>