<g:set var="lastFeedId" value=""></g:set>
<g:each var="newsSourceMap" in="${newsSourcesMap}">
	<g:set var="newsSource" value="${newsSourceMap.key}"></g:set>
	<g:set var="newsSourceItems" value="${newsSourceMap.value}"></g:set>
	<g:set var="lastFeedId" value="${newsSource.id}"></g:set>
	<div class="nsttl">
		<a href="<g:createLink uri="/newspapers/newsSource/${newsSource.id}/${seoCovert(title:newsSource.title)}-newspaper"/>">${newsSource.title}</a>
	</div>
	<div class="nssdes">
		${newsSource.shortDescription}
	</div>
	<g:each var="newsSourceNItem" in="${newsSourceItems}">
		<g:set var="newsSourceItem" value="${newsSourceNItem[1]}"></g:set>
		<div class="mt10">
			<div class="media">
				<div class="media-left">												    
				    <div class="nsilst"><span aria-hidden="true" class="glyphicon glyphicon-th-list nsLtp"></span></div>
				</div>
				<div class="media-body">
					<div class="nsTtl"><a href="<g:createLink uri="/newspapers/newsSourceList/${newsSourceItem.id}/${seoCovert(title:newsSourceItem.title)}-newspaper"/>">${newsSourceItem.title}</a></div>
					<div class="nsisdes">${newsSourceItem.shortDescription}</div>
					<div class="nsilnk">${raw(newsSourceItem.newsLinks)}</div>
				</div>
				<div class="media-right">	
					<div class="vtl nsvbtn"><a id="nsilike${newsSourceItem.id}" onclick="javascript:likeNewsSourceItem(${newsSourceItem.id})" href="javascript:void(0)"><span aria-hidden="true" class="glyphicon glyphicon-ok-circle"></span><span class="cmlld">${newsSourceItem.totalVote}</span></a></div>
				</div>
			</div>
		</div>
	</g:each>	
	<div class="usrBox">
     	<div aria-label="button group" role="group" class="btn-group">					        			
   			<a id="nslike${newsSource.id}" onclick="javascript:likeNewsSource(${newsSource.id})" role="button" class="btn btn-default" href="javascript:void(0)">
   				<span aria-hidden="true" class="glyphicon glyphicon-thumbs-up"></span><span class="cmlld">${newsSource.totalVote}</span>
   			</a>
   			<a id="nsShCmt${newsSource.id}" onclick="javascript:showNewsSourceComments('${newsSource.id}')" role="button" class="btn btn-default" href="javascript:void(0)">
   				<span aria-hidden="true" class="glyphicon glyphicon-comment"></span><span class="cmlld">${newsSource.totalComment}</span>
   			</a>			        			
     	</div>
	</div>
    <div id="nsCmtLst${newsSource.id}">							        												
	</div>
	<div class="comSub">
		<div class="media">
			<div class="media-left">
				<g:if test="${user}">												    
				    <g:if test="${user.profileImage}">
						<img src="<g:createLink uri="/newsImages/d50/${user.profileImage}"/>" class="media-object s30 fulRndImg">
					</g:if>
					<g:else>
						<g:if test="${user.gender}">
							<img src="<g:createLink uri="/images/bddeshdefault/femaleProfileSmall.jpeg"/>" class="media-object s30 fulRndImg">
						</g:if>
						<g:else>
							<img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="media-object s30 fulRndImg">
						</g:else>
					</g:else>
				</g:if>
				<g:else>
					<img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="media-object s30 fulRndImg">
				</g:else>
			</div>
			<div class="media-body">
				<textarea autocomplete="off" id="nsCmtTx${newsSource.id}" onfocus="javascript:hasUser();" onkeyup="javascript:submitNSComment('${newsSource.id}',this,event)" class="form-control cusTxtBx comBox" placeholder="<g:message code="newsSourceComment"/>" title="Please enter news source comment" rows="1"></textarea>
			</div>
		</div>
	</div>
</g:each>
<script type="text/javascript">
	lastFeedId = "${lastFeedId}";
</script>
