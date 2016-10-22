<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="newsWeb"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:true,isTopTenActive:false,isPollActive:false,isQuestionActive:false,isLinkActive:false]"></g:render>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-8 cbpd">
					<g:render template="/home/userPostSection" model="[isNewsActive:true,isTopTenActive:false,isPollActive:false,isQuestionActive:false]"></g:render>
					<div class="conbor wbg">
						<div id="newsFeedList">
							An error has occurred
						</div>
						<div id="feedMoreLoader" class="moreLoader hidden">
							<img src="<g:createLink uri="/images/newscss/loader2.gif"/>">
						</div>
					</div>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
					<div id="rightSec" class="">
						<div class="conbor wbg">
							<g:render template="/home/popularNewsHashword" model="[questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags]"></g:render>
					 	</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			
		</script>
	</body>
</html>

 

