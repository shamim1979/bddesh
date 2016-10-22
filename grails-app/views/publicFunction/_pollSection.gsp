<g:set var="lastFeedDate" value=""></g:set>
<g:each var="pollMap" in="${pollItemsMap}" status="p">
	<g:set var="poll" value="${pollMap.key}"></g:set>
	<g:set var="lastFeedDate" value="${poll.dateCreated}"></g:set>
	<g:if test="${poll.dateCreated + 60 > new Date()}"><g:set var="pollDate" value="${poll.dateCreated + 60}"></g:set><g:set var="voteEnable" value="${true}"></g:set></g:if><g:else><g:set var="pollDate" value="${poll.dateCreated}"></g:set><g:set var="voteEnable" value="${false}"></g:set></g:else>
	<g:set var="pollItems" value="${pollMap.value}"></g:set>
	<g:if test="${pollItems[0][1].isPositive}">
		<g:set var="positiveItem" value="${pollItems[0][1]}"></g:set>
		<g:set var="oppositeItem" value="${pollItems[1][1]}"></g:set>
	</g:if>
	<g:else>
		<g:set var="positiveItem" value="${pollItems[1][1]}"></g:set>
		<g:set var="oppositeItem" value="${pollItems[0][1]}"></g:set>
	</g:else>
	<div class="col-sm-12 col-md-12 col-lg-12 cbpd">
		<ul class="nav nav-tabs hidden">
			<li class="active"><a data-toggle="tab" href="#default${poll.id}">default</a></li>
	  		<li><a data-toggle="tab" href="#positive${poll.id}">Positive</a></li>
	  		<li><a data-toggle="tab" href="#opposite${poll.id}">Opposite</a></li>
	  	</ul>
		<div class="tab-content conbor wbg">
			<div id="default${poll.id}" class="tab-pane fade in active">
				<div class="pFh">
					<div class="p5">
						<div class="media">
							<div class="media-left">												    
							    <div class="dt">
									<span aria-hidden="true" class="glyphicon glyphicon-time"></span>
									<time class="date" datetime="<g:utcDate date="${pollDate}"></g:utcDate>"></time>
								</div>
							</div>
							<div class="media-body">
							</div>
							<div class="media-right">	
								<div class="dt text-right">
									<span aria-hidden="true" class="glyphicon glyphicon-ok-sign"></span> <span id="ptVotes${poll.id}">${positiveItem.totalVote+oppositeItem.totalVote}</span>
									<span aria-hidden="true" class="glyphicon glyphicon-comment"></span> <span id="ptOpinions${poll.id}">${positiveItem.totalOpinion+oppositeItem.totalOpinion}</span>
								</div>
							</div>
						</div>
						<div class="svDes"><g:if test="${voteEnable}">Click on either side to vote</g:if><g:else>Vote date expired</g:else> </div>
						<a class="plHvr" href="<g:createLink uri="/pollz/result/${poll.id}/${seoCovert(title:poll.question)}"/>">
							<div class="pqt">
								<h3>${poll.question}</h3>
							</div>
						</a>
						<div class="row">
							<div class="col-sm-6 col-md-6 col-lg-6 cbpd">
								<a class="phbg" href="javascript:void(0)" onclick="javascript:likePoll('${poll.id}','1','${positiveItem.id}',${voteEnable})">
									<div class="phbgc">
										<div class="vbtn brd3 cp${p}">
											${positiveItem.title}
										</div>
										<div class="vbtnp">
											<div id="fpvp${poll.id}" class="vbtnp">
												<span class="pvp <g:if test="${voteEnable}">hidden</g:if>"><g:if test="${positiveItem.totalVote+oppositeItem.totalVote == 0}">0%</g:if><g:else>${Math.round((positiveItem.totalVote/(positiveItem.totalVote+oppositeItem.totalVote))*100)}%</g:else></span><span class="pvc hidden">${positiveItem.totalVote}</span><span class="ovc hidden">${oppositeItem.totalVote}</span>
											</div>
										</div>
										<div class="vdef">
											${positiveItem.deffence}
										</div>
										<div class="vcmts cp${p}">
											<span aria-hidden="true" class="glyphicon glyphicon-comment"></span> ${positiveItem.totalOpinion} comment<g:if test="${positiveItem.totalOpinion>1}">s</g:if>
										</div>
									</div>
								</a>
							</div>
							<div class="col-sm-6 col-md-6 col-lg-6 cbpd">
								<a class="phbg" href="javascript:void(0)" onclick="javascript:likePoll('${poll.id}','2','${oppositeItem.id}',${voteEnable})">
									<div class="phbgc">
										<div class="vbtn btnopp brd3 cn${p}">
											${oppositeItem.title}
										</div>
										<div class="vbtnp">
											<div id="fovp${poll.id}" class="vbtnp">
												<span class="pvp <g:if test="${voteEnable}">hidden</g:if>"><g:if test="${positiveItem.totalVote+oppositeItem.totalVote == 0}">0%</g:if><g:else>${Math.round((oppositeItem.totalVote/(positiveItem.totalVote+oppositeItem.totalVote))*100)}%</g:else></span><span class="pvc hidden">${positiveItem.totalVote}</span><span class="ovc hidden">${oppositeItem.totalVote}</span>
											</div>
										</div>
										<div class="vdef">
											${oppositeItem.deffence}
										</div>
										<div class="vcmts opcmts cn${p}">
											<span aria-hidden="true" class="glyphicon glyphicon-comment"></span> ${oppositeItem.totalOpinion} comment<g:if test="${oppositeItem.totalOpinion>1}">s</g:if>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="positive${poll.id}" class="tab-pane">
				<div class="media">
					<div class="media-left media-middle">
						<a href="javascript:void(0)" onclick="javascript:likePoll('${poll.id}','0')">												    
						    <div class="pFh lftArr brd3">
								<span aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span>
							</div>
						</a>
					</div>
					<div class="media-body">
						<div class="pFh">
							<div class="pc5">
								<div id="pavt${poll.id}" class="avoted hidden">You have already voted!</div>
								<div class="vbtn brd3 cp${p}">
									${positiveItem.title}
								</div>
								<div class="vbtnp">
									<div id="npvp${poll.id}" class="vbtnp">
										<span class="pvp <g:if test="${voteEnable}">hidden</g:if>"><g:if test="${positiveItem.totalVote+oppositeItem.totalVote == 0}">0%</g:if><g:else>${Math.round((positiveItem.totalVote/(positiveItem.totalVote+oppositeItem.totalVote))*100)}%</g:else></span><span class="pvc hidden">${positiveItem.totalVote}</span><span class="ovc hidden">${oppositeItem.totalVote}</span>
									</div>
								</div>
								<div id="po${poll.id}${positiveItem.id}" class="popnm"></div>
								<div id="spo${poll.id}${positiveItem.id}" class="spopnm"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="opposite${poll.id}" class="tab-pane">
				<div class="media">
					<div class="media-left media-middle">
						<a href="javascript:void(0)" onclick="javascript:likePoll('${poll.id}','0')">												    
						    <div class="pFh lftArr brd3">
								<span aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span>
							</div>
						</a>
					</div>
					<div class="media-body">
						<div class="pFh">
							<div class="pc5">
								<div id="oavt${poll.id}" class="avoted hidden">You have already voted!</div>
								<div class="vbtn btnopp brd3 cn${p}">
									${oppositeItem.title}
								</div>
								<div class="vbtnp">
									<div id="novp${poll.id}" class="vbtnp">
										<span class="pvp <g:if test="${voteEnable}">hidden</g:if>"><g:if test="${positiveItem.totalVote+oppositeItem.totalVote == 0}">0%</g:if><g:else>${Math.round((oppositeItem.totalVote/(positiveItem.totalVote+oppositeItem.totalVote))*100)}%</g:else></span><span class="pvc hidden">${positiveItem.totalVote}</span><span class="ovc hidden">${oppositeItem.totalVote}</span>
									</div>
								</div>
								<div id="po${poll.id}${oppositeItem.id}" class="popnm"></div>
								<div id="spo${poll.id}${oppositeItem.id}" class="spopnm"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</g:each>
<script type="text/javascript">
	lastFeedDate = "${lastFeedDate}";
</script>
																																																																																																																																																																																	 								