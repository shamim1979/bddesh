<g:set var="topTenItem" value="${newTopTenItem}"></g:set>
<div class="titibx">
	<div class="row">
		<div class="col-sm-4 col-md-3 col-lg-3 cbpd">
			<div id="cpTTIImg${topTenItem.id}" class="mt5">
				<g:if test="${topTenItem.imageName}">
					<img src="<g:createLink uri="/newsImages/d170/${topTenItem.imageName}"/>" class="covphCen rndImg">
				</g:if>
				<g:else>
					<img src="<g:createLink uri="/images/bddeshdefault/defaultTopTenItem.jpeg"/>" class="covphCen rndImg">
				</g:else>
			</div>			
			<div id="TTIImgSave${topTenItem.id}">
				<a class="sbbtn brd3 psbtnw" href="javascript:void(0)" onclick="javascript:addPhoto('topItem',${topTenItem.id})">Add Photo</a>
			</div>
		</div>
		<div class="col-sm-8 col-md-9 col-lg-9 cbpd">
			<div class="tbx tnbb mt5">
				<div class="media">
					<div class="media-left">												    
					    <div class="tCon tNum text-center t${topTen.totalTopTenItem}">${topTen.totalTopTenItem}</div>
					</div>
					<div class="media-body">
						<div class="ttTtl"><h3>${topTenItem.title}</h3></div>
					</div>
					<div class="media-right">
						<a href="javascript:void(0)" onclick="javascript:voteShowOpinion('${topTenItem.id}');"><div id="tItmVLk${topTenItem.id}" class="vtl mtm5"><img src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="tiLdr llod hidden"/><span class="vfcol itemVote">Vote</span><span class="vfcol itemPercent hidden"></span><span class="vfcol itemTotVote hidden">${topTenItem.totalVote}</span> <span aria-hidden="true" class="glyphicon glyphicon-ok-circle"></span></div></a>
					</div>
				</div>
				<div id="itemOpinionList${topTenItem.id}">					
				</div>
			</div>
		</div>
	</div>
	<div id="tItemOpinion${topTenItem.id}" class="tiopn topirc">
	</div>
</div>