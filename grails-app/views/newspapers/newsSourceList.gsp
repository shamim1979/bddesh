<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="newspaperWeb"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:false,isTopTenActive:false,isPollActive:false,isQuestionActive:false,isLinkActive:false]"></g:render>
		<div class="container">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-8 cbpd">
					<div class="conbor wbg">
						<div class="cbx">
							<div id="userLinkzPostSec">								
							</div>
							<div id="userLinkzList" class="conbor wbg inbx pt5">								
							</div>
							<div class="gAds">
								<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
								<!-- Top Banner Ads -->
								<ins class="adsbygoogle"
								     style="display:block"
								     data-ad-client="ca-pub-6843494013222478"
								     data-ad-slot="9923362344"
								     data-ad-format="auto"></ins>
								<script>
								(adsbygoogle = window.adsbygoogle || []).push({});
								</script>
							</div>
							<div class="nsttl">
								<h2>${newsSourceItem.title}</h2>
							</div>
							<div class="nssdes">
								${newsSourceItem.shortDescription}
							</div>
							<div class="nsilnk">
								${raw(newsSourceItem.newsLinks)}
							</div>													
							<div class="usrBox">
				        		<div aria-label="button group" role="group" class="btn-group">					        			
				        			<a id="nsilike${newsSourceItem.id}" onclick="javascript:likeNewsSourceItem(${newsSourceItem.id})" role="button" class="btn btn-default" href="javascript:void(0)">
				        				<span aria-hidden="true" class="glyphicon glyphicon-thumbs-up"></span><span class="cmlld">${newsSourceItem.totalVote}</span>
				        			</a>
				        			<a id="nsiShCmt${newsSourceItem.id}" onclick="javascript:showNewsSourceItemComments('${newsSourceItem.id}')" role="button" class="btn btn-default" href="javascript:void(0)">
				        				<span aria-hidden="true" class="glyphicon glyphicon-comment"></span><span class="cmlld">${newsSourceItem.totalComment}</span>
				        			</a>			        			
				        		</div>
				        	</div>
				        	<div id="nsiCmtLst${newsSourceItem.id}">	
				        		<g:render template="/publicFunction/newsSourceItemComments" model="[user:user,comments:comments]"></g:render>			        						        												
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
										<textarea autocomplete="off" id="nsCmtTx${newsSourceItem.id}" onfocus="javascript:hasUser();" onkeyup="javascript:submitNSIComment('${newsSourceItem.id}',this,event)" class="form-control cusTxtBx comBox" placeholder="<g:message code="newsSourceComment"/>" title="Please enter news source item comment" rows="1"></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="gAds">
							<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
							<!-- Bottom Text Ads -->
							<ins class="adsbygoogle"
							     style="display:block"
							     data-ad-client="ca-pub-6843494013222478"
							     data-ad-slot="2899623145"
							     data-ad-format="auto"></ins>
							<script>
							(adsbygoogle = window.adsbygoogle || []).push({});
							</script>
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
					<div id="rightSec">
						<div class="conbor wbg">
							<g:render template="/home/shareBox" model="[metaData:metaData,tTag:'Newspapers']"></g:render>
							<g:render template="/home/newspapersRightSec" model="[]"></g:render>
					 	</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(function(){
				if(typeof(Storage) !== "undefined") {
					$("#userLinkzPostSec").html($("#linkzPostSec").html());
					$("#linkzPostSec").html('');
					showUserLinks();
				}	
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

 
