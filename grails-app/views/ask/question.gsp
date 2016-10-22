<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="questionWeb"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:false,isTopTenActive:false,isPollActive:false,isQuestionActive:false,isLinkActive:false]"></g:render>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-8 cbpd">
					<div class="conbor wbg">
						<div class="cbx">
							<g:set var="questionOwner" value="${question.questionOwner}"></g:set>
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
										<time class="date" datetime="${question.dateCreated}"></time>
									</div>
									<div class="qSec qtfs">
										<h2>${question.title}</h2>
									</div>
									<div class="qSSec">
										${question.shortDescription}
									</div>
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
						        			<a id="qShA${question.id}" href="javascript:void(0)" onclick="javascript:showAnswer(${question.id})" class="conbor rdMr qvbtn qdvt">
						        				<span class="vTxt">Answer</span> <span class="vTxt aNum">${question.totalAnswer}</span><span class="cmlld"></span>
						        			</a>
						        		</div>
						        		<div style="clear: both;"></div>
								    </div>
								    <div id= "ansLst${question.id}" class="qSSec">
								    	<g:render template="/publicFunction/loadAnswerList" model="[user:user,answers:answers]"></g:render>	
									</div>
								    <div id= "ansFrm${question.id}" class="qSSec">					
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
					<div id="rightSec" class="">
						<div class="conbor wbg">
							<g:render template="/home/popularQuestionHashword" model="[questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags]"></g:render>
					 	</div>
					</div>
				</div>
			</div>
		</div>
		<div id="qAnsForm" class="hidden">
			<div class="cibb">
				<textarea autocomplete="off" onfocus="javascript:hasUser();" name="newAnswer" id="newAnswer" class="form-control cusTxtBx" placeholder="<g:message code="Enter Answer"/>" title="Please enter question answer" rows="3"></textarea>
			</div>
			<div class="sbmt">
				<img id="submitAns" src="<g:createLink uri="/images/newscss/loader1.gif"/>" class="llod hidden"/>
				<button id="regSubmitAns" name="regSubmitAns" onclick="javascript:submitAnswer();" value="<g:message code="createAnswer"/>" class="conbor sbbtn" type="button"><g:message code="createAnswer"/></button>
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
				$('#rightSec').css({'width':$('#rightSec').width()+'px'});
				var topOffset = 50;	
				if($('#rightSec').height() > $(window).innerHeight()-50){	
					$('#rightSec').addClass('bFixed');
					topOffset = $('#rightSec').height()-$(window).innerHeight()-50
				}
				else{
					$('#rightSec').addClass('tFixed');	
				}					
				$('#rightSec').affix({
					offset: {
						top: topOffset,
					    bottom: 5,
					}
				});
			});			
		</script>
	</body>
</html>

 
