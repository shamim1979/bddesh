<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="newspaperWeb"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:false,isTopTenActive:false,isPollActive:false,isQuestionActive:false,isLinkActive:true]"></g:render>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-8 cbpd">
					<div class="conbor wbg">
						<div class="cbx">
							<div id="userLinkzPostSec">								
							</div>
							<div id="userLinkzList" class="conbor wbg inbx pt5">								
							</div>
							<div id="linkzFeedList">												
								<g:render template="/newspaper/newsSourceSection" model="[]"></g:render>
							</div>
						</div>
						<div id="feedMoreLoader" class="moreLoader hidden">
							<img src="<g:createLink uri="/images/newscss/loader2.gif"/>">
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
					<div id="rightSec" class="">
						<div class="conbor wbg">
							<g:render template="/home/shareBox" model="[metaData:metaData]"></g:render>
							<g:render template="/home/popularLinkzHashword" model="[usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags]"></g:render>
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

 
