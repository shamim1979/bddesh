<g:set var="lastFeedDate" value=""></g:set>
<g:each var="topTens" in="${topTenList}">
	<g:set var="topTenOwner" value="${topTens[0]}"></g:set>
	<g:set var="topTen" value="${topTens[1]}"></g:set>
	<g:set var="lastFeedDate" value="${topTen.dateCreated}"></g:set>
	<div class="tbx mt5">
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
				</g:else>
				</a>
			</div>
			<div class="media-body">
				<div class="usr">
					<a href="<g:createLink uri="/profile/of/${topTenOwner.id}/${topTenOwner.username}"/>"><g:if test="${topTenOwner.displayName}">${topTenOwner.displayName}</g:if><g:else>${topTenOwner.username}</g:else></a>
				</div>
				<div class="dt nldt">
					<span aria-hidden="true" class="glyphicon glyphicon-time"></span>
					<time class="date" datetime="<g:utcDate date="${topTen.dateCreated}"></g:utcDate>"></time>
				</div>
				<div class="ttsd">
					<a href="<g:createLink uri="/topTenz/topList/${topTen.id}/${seoCovert(title:topTen.title)}"/>">${topTen.title}</a>
				</div>
				<g:if test="${topTen.shortDescription}">
					<div class="qSSec">
						<a href="<g:createLink uri="/topTenz/topList/${topTen.id}/${seoCovert(title:topTen.title)}"/>">${topTen.shortDescription} ...</a>
					</div>
				</g:if>
			</div>
			<div class="media-right">	
				<a class="pstType cat2" href="<g:createLink uri="/topTenz/topList/${topTen.id}/${seoCovert(title:topTen.title)}"/>">&nbsp;</a>
			</div>
		</div>
	</div>
</g:each>
<script type="text/javascript">
	lastFeedDate = "${lastFeedDate}";
</script>
