<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="home"/>
	</head>
	<body>
		<g:render template="/home/homeHeader" model="[isNewsActive:false,isTopTenActive:false,isPollActive:false,isQuestionActive:false,isLinkActive:false]"></g:render>
		<g:render template="/home/latestNews" model="[allLatestNews:allLatestNews,newsArticles:newsArticles,user:user]"></g:render>
		<script type="text/javascript">
			var isNewsFeed = false;
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
				$(window).scroll(function(){					
					if($(window).scrollTop() > $(document).height() - $(window).height() - 500){						
						loadMoreNewsArticles();       
					}
				});
			});
		</script>
	</body>
</html>

 
