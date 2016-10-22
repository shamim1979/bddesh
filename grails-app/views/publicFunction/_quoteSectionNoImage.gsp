<g:set var="lastFeedDate" value=""></g:set>
<g:each var="quoteNuser" in="${quotes}" status="k">	
	<g:set var="quote" value="${quoteNuser[0]}"></g:set>
	<g:set var="quoteOwner" value="${quoteNuser[1]}"></g:set>
	<g:set var="lastFeedDate" value="${quote.dateCreated}"></g:set>
	<g:set var="readMoreUrl"><g:createLink uri="/quoteDay/quote/${quote.id}/${seoCovert(title:quote.quoteAuthorName)}"/></g:set>
	<div class="quoteLst">
		<div id="fbInfo${quote.id}" class="hidden">
			<g:if test="${quote.imageName}"><i class="fbImage" fbdata="<g:createLink uri="/newsImages/d490/${quote.imageName}"/>"></i></g:if>
			<g:else><i class="fbImage" fbdata="<g:createLink uri="/images/bddeshdefault/defaultQuote.jpg"/>"></i></g:else>
			<i class="fbTitle" fbdata="${quote.quote}"></i>
			<i class="fbDescription" fbdata="${quote.quoteAuthorName}"></i>
			<i class="fbLink" fbdata="${readMoreUrl}"></i>
		</div>
		<div class="tbx nbb cuqh">
			<div class="media">
				<div class="media-left">							    
				    <div class="usr">
						<a href="<g:createLink uri="/profile/of/${quoteOwner.id}/${quoteOwner.username}"/>"><g:if test="${quoteOwner.displayName}">${quoteOwner.displayName}</g:if><g:else>${quoteOwner.username}</g:else></a>
						<g:message code="postcode5"/>
					</div>
					<div class="dt nldt">
						<span aria-hidden="true" class="glyphicon glyphicon-time"></span>
						<time class="date" datetime="<g:utcDate date="${quote.dateCreated}"></g:utcDate>"></time>
					</div>
				</div>
				<div class="media-body"></div>
				<div class="media-right">	
					<a class="pstType cat5" href="${readMoreUrl}">&nbsp;</a>
				</div> 
			</div>
		</div>
		<div class="cbx">			
			<div class="brd3 qote qcc${k%10}">
				<a href="<g:createLink uri="/quoteDay/quote/${quote.id}/${seoCovert(title:quote.quoteAuthorName)}"/>">"${quote.quote}"</a>
				<span class="qaut">${quote.quoteAuthorName}</span>
			</div>
			<g:if test="${quote.topicHashword}">	
				<g:set var="hashwdList" value="${quote.topicHashword.split(' ')}"></g:set>	
				<div class="qoteHash">
					<g:each var="hashwd" in="${hashwdList}"> 
						<g:if test="${hashwd && hashwd.length() > 0}">
							<a href="<g:createLink uri="/quoteDay/hashword/${hashwd.substring(1)}"/>" class="brd3 hswa">${hashwd}</a>
						</g:if>					
					</g:each>
				</div>
			</g:if>
			<div class="usrBox">
        		<div aria-label="button group" role="group" class="btn-group">					        			
        			<a id="quLike${quote.id}" onclick="javascript:likeQuote(${quote.id})" role="button" class="btn btn-default" href="javascript:void(0)">
        				<span aria-hidden="true" class="glyphicon glyphicon-thumbs-up"></span><span class="cmlld">${quote.totalLike}</span>
        			</a>
        			<a id="quTotalComment${quote.id}" role="button" class="btn btn-default" href="<g:createLink uri="/quoteDay/quote/${quote.id}/${seoCovert(title:quote.quote)}"/>">
        				<span aria-hidden="true" class="glyphicon glyphicon-comment"></span><span class="cmlld">${quote.totalComment}</span>
        			</a>				        			
        			<a role="button" class="fb btn btn-default" onclick="javascript:shareFacebook(${quote.id})" href="javascript:void(0)">
        				<span aria-hidden="true" class="fbShare brd3"></span><span class="cmlld"></span>
        			</a>			        			
        		</div>
	        </div>
	        <div id="quoteComments${quote.id}">							
			</div>
	        <div class="comSub">
				<div class="media">
					<div class="media-left">
						<g:if test="${user}">												    
						    <g:if test="${user.profileImage}">
								<img src="<g:createLink uri="/newsImages/d50/${user.profileImage}"/>" class="media-object s30 rndImg">
							</g:if>
							<g:else>
								<g:if test="${user.gender}">
									<img src="<g:createLink uri="/images/bddeshdefault/femaleProfileSmall.jpeg"/>" class="media-object s30 rndImg">
								</g:if>
								<g:else>
									<img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="media-object s30 rndImg">
								</g:else>
							</g:else>
						</g:if>
						<g:else>
							<img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="media-object s30 rndImg">
						</g:else>
					</div>
					<div class="media-body">
						<textarea autocomplete="off" id="quoteComment${quote.id}" onkeyup="javascript:submitQuoteComment('${quote.id}',this,event)" class="form-control cusTxtBx comBox" placeholder="<g:message code="commentEnter"/>" title="Please enter comment" rows="1"></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
</g:each>



						  		