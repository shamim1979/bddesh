<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="adminWeb"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:true,isTopTenActive:false,isPollActive:false,isQuestionActive:false,isLinkActive:false]"></g:render>
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-8 col-md-8 col-lg-8 cbpd">
					<g:render template="/admin/quoteSection" model="[]"></g:render>
				</div>
				<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
					<div class="conbor wbg">
						<div class="tbx text-center">
							Admin Url Links
						</div>
						<div class="cbx">
							<g:render template="/admin/adminUrlSection" model="[]"></g:render>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

 
