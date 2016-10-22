<g:set var="lastFeedDate" value=""></g:set>
<g:each var="questionAndUser" in="${questions}">
	<g:set var="question" value="${questionAndUser[0]}"></g:set>
	<g:set var="questionOwner" value="${questionAndUser[1]}"></g:set>
	<g:set var="lastFeedDate" value="${question.dateCreated}"></g:set>
	<div class="tbx qbr">
		<div class="media">
			<div class="media-left">												    
			    <a href="<g:createLink uri="/profile/of/${questionOwner.id}/${questionOwner.username}"/>"><g:if test="${questionOwner && questionOwner.profileImage}">
					<img src="<g:createLink uri="/newsImages/d50/${questionOwner.profileImage}"/>" class="media-object s40 fulRndImg">
				</g:if>
				<g:else>
					<g:if test="${questionOwner && questionOwner.gender}">
						<img src="<g:createLink uri="/images/bddeshdefault/femaleProfileSmall.jpeg"/>" class="media-object s40 fulRndImg">
					</g:if>
					<g:else>
						<img src="<g:createLink uri="/images/bddeshdefault/maleProfileSmall.jpeg"/>" class="media-object s40 fulRndImg">
					</g:else>
				</g:else></a>
			</div>
			<div class="media-body">
				<div class="usr">
					<a href="<g:createLink uri="/profile/of/${questionOwner.id}/${questionOwner.username}"/>"><g:if test="${questionOwner.displayName}">${questionOwner.displayName}</g:if><g:else>${questionOwner.username}</g:else></a>
				</div>
				<div class="dt nldt">
					<span aria-hidden="true" class="glyphicon glyphicon-time"></span>
					<time class="date" datetime="<g:utcDate date="${question.dateCreated}"></g:utcDate>"></time>
				</div>
				<div class="qSec">
					<a href="<g:createLink uri="/ask/answer/${question.id}/${seoCovert(title:question.title)}"/>">${question.title}</a>
				</div>	
				<g:if test="${question.imageName}">
					<div class="mt5">
						<img src="<g:createLink uri="/newsImages/d490/${question.imageName}"/>" class="covphCen m2">
					</div>
				</g:if>			
				<g:if test="${question.shortDescription}">
					<div class="qSSec">
						<span aria-hidden="true" class="glyphicon glyphicon-star qsAns"></span> <a class="qsAns" href="<g:createLink uri="/ask/answer/${question.id}/${seoCovert(title:question.title)}"/>">${question.shortDescription} ...</a>
					</div>
				</g:if>				
				<div class="qUsrBox">
	        		<div class="fl mr5">
	        			<a id="qLkU${question.id}" href="javascript:void(0)" onclick="javascript:likeQuestion(${question.id},'up')" class="conbor rdMr upv qvbtn">
	        				<span class="vTxt">Up Vote</span>
	        				<span class="vNum">${question.totalVote}</span> <span class="cmlld"></span>
	        			</a>
	        		</div>
	        		<div class="fl mr5">
	        			<a id="qLkD${question.id}" href="javascript:void(0)" onclick="javascript:likeQuestion(${question.id},'down')" class="conbor rdMr qvbtn qdvt">
	        				<span class="vTxt">Down Vote</span> <span class="cmlld"></span>
	        			</a>
	        		</div>
	        		<div class="fl">
	        			<a id="qShA${question.id}" href="<g:createLink uri="/ask/answer/${question.id}/${seoCovert(title:question.title)}"/>" class="conbor rdMr qvbtn qdvt">
	        				<span class="vTxt">Answer</span> <span class="vTxt aNum">${question.totalAnswer}</span><span class="cmlld"></span>
	        			</a>
	        		</div>
	        		<div style="clear: both;"></div>
			    </div>
			    <div id= "ansLst${question.id}" class="qSSec">					
				</div>
			    <div id= "ansFrm${question.id}" class="qSSec">					
				</div>
			</div>
			<div class="media-right">	
				<a class="pstType cat4" href="<g:createLink uri="/ask/answer/${question.id}/${seoCovert(title:question.title)}"/>">&nbsp;</a>
			</div> 
		</div>
	</div>
</g:each>
<script type="text/javascript">
	lastFeedDate = "${lastFeedDate}";
</script>


					