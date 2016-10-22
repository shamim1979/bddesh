<g:each var="pollItemOpinionLst" in="${pollItemOpinions}">
	<g:set var="itemOpinion" value="${pollItemOpinionLst[0]}"></g:set>
	<g:set var="pollItemOpnUser" value="${pollItemOpinionLst[1]}"></g:set>
	<div class="mb5">
		<div class="opnSec">
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
						<time class="date" datetime="<g:utcDate date="${itemOpinion.dateCreated}"></g:utcDate>"></time>
					</div>
					<div class="aCmt linkingText">
						${itemOpinion.opinion}
					</div>
					<div class="usrBox cmtBx">
			       		<div aria-label="button group" role="group" class="btn-group">					        			
			       			<a id="pOpnLike${itemOpinion.id}" onclick="javascript:likePollOpinion(${itemOpinion.id})" role="button" class="btn btn-default" href="javascript:void(0)">
			       				<span aria-hidden="true" class="glyphicon glyphicon-thumbs-up"></span><span class="cmlld">${itemOpinion.totalLike}</span>
			       			</a>		        			
			       		</div>
			       	</div>
				</div>
			</div>
		</div>
	</div>
</g:each>