<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="newsWeb"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:false,isTopTenActive:false,isPollActive:false,isQuestionActive:false,isLinkActive:false]"></g:render>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-12 col-md-12 col-lg-12 cbpd">
					<div class="conbor wbg">
						<div id="newsFeedList">
							<g:renderException exception="${exception}" />
						</div>
						<div id="feedMoreLoader" class="moreLoader hidden">
							<img src="<g:createLink uri="/images/newscss/loader2.gif"/>">
						</div>
					</div>
				</div>				
			</div>
		</div>
	</body>
</html>