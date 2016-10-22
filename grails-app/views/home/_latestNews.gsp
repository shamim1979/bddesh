<div class="container">
	<div class="row">
		<div class="col-sm-8 col-md-8 col-lg-8 cbpd">
			<g:render template="/home/userPostSection" model="[isNewsActive:true,isTopTenActive:false,isPollActive:false,isQuestionActive:false]"></g:render>
			<g:if test="${user}">
				<div class="conbor wbg">
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
					<div class="tntbg lrbrd3">
						<span aria-hidden="true" class="glyphicon glyphicon-star-empty sLNs"></span> Social News
					</div>
					<div id="newsFeedList">							
						<g:render template="/publicFunction/newsSection" model="[user:user,newsArticles:newsArticles,isHome:isHome]"></g:render>
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
					<div id="feedMoreLoader" class="moreLoader hidden">
						<img src="<g:createLink uri="/images/newscss/loader2.gif"/>">
					</div>
				</div>
			</g:if>
			<g:else>
				<div class="row">
					<div class="col-sm-6 col-md-6 col-lg-6 cbpd">
						<div class="conbor wbg">
							<g:set var="tlNews" value="${allLatestNews[1]}"></g:set>
							<g:each var="tLatestNews" in="${tlNews}">							
								<div class="tNews">
									<div class="tNewsT">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>">${tLatestNews.title}</a>
									</div>
									<g:if test="${tLatestNews.imageName}">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>"><img src="<g:createLink uri="/newsImages/d160/${tLatestNews.imageName}"/>" class="covphCen m2"></a>
									</g:if>
								</div>
							</g:each>
						</div>
					</div>
					<div class="col-sm-6 col-md-6 col-lg-6 cbpd">
						<div class="conbor wbg bdlnh">
							<div class="tntbg lrbrd3">
								<span aria-hidden="true" class="glyphicon glyphicon-star-empty sLNs"></span> <a href="<g:createLink uri="/hashword/article/LatestNews"/>">Latest News</a>
							</div>
							<g:set var="tlNews" value="${allLatestNews[2]}"></g:set>
							<div class="lnlnb">
								<g:each var="tLatestNews" in="${tlNews}">
									<div class="tNewsT tnsb">
										<span aria-hidden="true" class="glyphicon glyphicon-star-empty sLNs"></span> <a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>">${tLatestNews.title}</a>
									</div>					
								</g:each>
							</div>
						</div>
					</div>
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
				<div class="row">
					<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
						<div class="conbor wbg">
							<div class="tntbg lrbrd3">
								<span aria-hidden="true" class="glyphicon glyphicon-star-empty sLNs"></span> <a href="<g:createLink uri="/hashword/article/national"/>">National</a>
							</div>
							<g:set var="tlNews" value="${allLatestNews[11]}"></g:set>
							<g:each var="tLatestNews" in="${tlNews}">							
								<div class="tNews">
									<div class="tNewsT">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>">${tLatestNews.title}</a>
									</div>
									<g:if test="${tLatestNews.imageName}">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>"><img src="<g:createLink uri="/newsImages/d160/${tLatestNews.imageName}"/>" class="covphCen m2"></a>
									</g:if>
								</div>
							</g:each>
						</div>
					</div>
					<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
						<div class="conbor wbg">
							<div class="tntbg lrbrd3">
								<span aria-hidden="true" class="glyphicon glyphicon-star-empty sLNs"></span> <a href="<g:createLink uri="/hashword/article/world"/>">World</a>
							</div>
							<g:set var="tlNews" value="${allLatestNews[3]}"></g:set>
							<g:each var="tLatestNews" in="${tlNews}">							
								<div class="tNews">
									<div class="tNewsT">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>">${tLatestNews.title}</a>
									</div>
									<g:if test="${tLatestNews.imageName}">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>"><img src="<g:createLink uri="/newsImages/d160/${tLatestNews.imageName}"/>" class="covphCen m2"></a>
									</g:if>
								</div>
							</g:each>
						</div>
					</div>
					<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
						<div class="conbor wbg">
							<div class="tntbg lrbrd3">
								<span aria-hidden="true" class="glyphicon glyphicon-star-empty sLNs"></span> <a href="<g:createLink uri="/hashword/article/business"/>">Business</a>
							</div>
							<g:set var="tlNews" value="${allLatestNews[4]}"></g:set>
							<g:each var="tLatestNews" in="${tlNews}">							
								<div class="tNews">
									<div class="tNewsT">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>">${tLatestNews.title}</a>
									</div>
									<g:if test="${tLatestNews.imageName}">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>"><img src="<g:createLink uri="/newsImages/d160/${tLatestNews.imageName}"/>" class="covphCen m2"></a>
									</g:if>
								</div>
							</g:each>
						</div>
					</div>								
				</div>
				<div class="row">
					<div class="col-sm-6 col-md-6 col-lg-6 cbpd">
						<div class="conbor wbg">
							<div class="tntbg lrbrd3">
								<span aria-hidden="true" class="glyphicon glyphicon-star-empty sLNs"></span> <a href="<g:createLink uri="/hashword/article/cricket"/>">Cricket</a>
							</div>
							<g:set var="tlNews" value="${allLatestNews[5]}"></g:set>
							<g:each var="tLatestNews" in="${tlNews}">							
								<div class="tNews">
									<div class="tNewsT">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>">${tLatestNews.title}</a>
									</div>
									<g:if test="${tLatestNews.imageName}">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>"><img src="<g:createLink uri="/newsImages/d160/${tLatestNews.imageName}"/>" class="covphCen m2"></a>
									</g:if>
								</div>
							</g:each>
						</div>
					</div>
					<div class="col-sm-6 col-md-6 col-lg-6 cbpd">
						<div class="conbor wbg">
							<div class="tntbg lrbrd3">
								<span aria-hidden="true" class="glyphicon glyphicon-star-empty sLNs"></span> <a href="<g:createLink uri="/hashword/article/football"/>">Football</a>
							</div>
							<g:set var="tlNews" value="${allLatestNews[12]}"></g:set>
							<g:each var="tLatestNews" in="${tlNews}">							
								<div class="tNews">
									<div class="tNewsT">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>">${tLatestNews.title}</a>
									</div>
									<g:if test="${tLatestNews.imageName}">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>"><img src="<g:createLink uri="/newsImages/d160/${tLatestNews.imageName}"/>" class="covphCen m2"></a>
									</g:if>
								</div>
							</g:each>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
						<div class="conbor wbg">
							<div class="tntbg lrbrd3">
								<span aria-hidden="true" class="glyphicon glyphicon-star-empty sLNs"></span> <a href="<g:createLink uri="/hashword/article/food"/>">Food</a>
							</div>
							<g:set var="tlNews" value="${allLatestNews[6]}"></g:set>
							<g:each var="tLatestNews" in="${tlNews}">							
								<div class="tNews">
									<div class="tNewsT">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>">${tLatestNews.title}</a>
									</div>
									<g:if test="${tLatestNews.imageName}">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>"><img src="<g:createLink uri="/newsImages/d160/${tLatestNews.imageName}"/>" class="covphCen m2"></a>
									</g:if>
								</div>
							</g:each>
						</div>
					</div>
					<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
						<div class="conbor wbg">
							<div class="tntbg lrbrd3">
								<span aria-hidden="true" class="glyphicon glyphicon-star-empty sLNs"></span> <a href="<g:createLink uri="/hashword/article/health"/>">Health</a>
							</div>
							<g:set var="tlNews" value="${allLatestNews[7]}"></g:set>
							<g:each var="tLatestNews" in="${tlNews}">							
								<div class="tNews">
									<div class="tNewsT">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>">${tLatestNews.title}</a>
									</div>
									<g:if test="${tLatestNews.imageName}">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>"><img src="<g:createLink uri="/newsImages/d160/${tLatestNews.imageName}"/>" class="covphCen m2"></a>
									</g:if>
								</div>
							</g:each>
						</div>
					</div>				
					<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
						<div class="conbor wbg">
							<div class="tntbg lrbrd3">
								<span aria-hidden="true" class="glyphicon glyphicon-star-empty sLNs"></span> <a href="<g:createLink uri="/hashword/article/entertainment"/>">Entertainment</a>
							</div>
							<g:set var="tlNews" value="${allLatestNews[10]}"></g:set>
							<g:each var="tLatestNews" in="${tlNews}">							
								<div class="tNews">
									<div class="tNewsT">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>">${tLatestNews.title}</a>
									</div>
									<g:if test="${tLatestNews.imageName}">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>"><img src="<g:createLink uri="/newsImages/d160/${tLatestNews.imageName}"/>" class="covphCen m2"></a>
									</g:if>
								</div>
							</g:each>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-md-6 col-lg-6 cbpd">
						<div class="conbor wbg">
							<div class="tntbg lrbrd3">
								<span aria-hidden="true" class="glyphicon glyphicon-star-empty sLNs"></span> <a href="<g:createLink uri="/hashword/article/education"/>">Education</a>
							</div>
							<g:set var="tlNews" value="${allLatestNews[8]}"></g:set>
							<g:each var="tLatestNews" in="${tlNews}">							
								<div class="tNews">
									<div class="tNewsT">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>">${tLatestNews.title}</a>
									</div>
									<g:if test="${tLatestNews.imageName}">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>"><img src="<g:createLink uri="/newsImages/d160/${tLatestNews.imageName}"/>" class="covphCen m2"></a>
									</g:if>
								</div>
							</g:each>
						</div>
					</div>
					<div class="col-sm-6 col-md-6 col-lg-6 cbpd">
						<div class="conbor wbg">
							<div class="tntbg lrbrd3">
								<span aria-hidden="true" class="glyphicon glyphicon-star-empty sLNs"></span> <a href="<g:createLink uri="/hashword/article/technology"/>">Technology</a>
							</div>
							<g:set var="tlNews" value="${allLatestNews[9]}"></g:set>
							<g:each var="tLatestNews" in="${tlNews}">							
								<div class="tNews">
									<div class="tNewsT">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>">${tLatestNews.title}</a>
									</div>
									<g:if test="${tLatestNews.imageName}">
										<a href="<g:createLink uri="/news/article/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>"><img src="<g:createLink uri="/newsImages/d160/${tLatestNews.imageName}"/>" class="covphCen m2"></a>
									</g:if>
								</div>
							</g:each>
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
				<div class="conbor wbg">
					<div class="tntbg lrbrd3">
						<span aria-hidden="true" class="glyphicon glyphicon-star-empty sLNs"></span> Social News
					</div>
					<div id="newsFeedList">							
						
					</div>
					<div id="feedMoreLoader" class="moreLoader hidden">
						<img src="<g:createLink uri="/images/newscss/loader2.gif"/>">
					</div>
				</div>
				<script type="text/javascript">
			 		lastFeedDate = "${nowFeedDate}";
			 	</script>
			</g:else>	
		</div>
		<div class="col-sm-4 col-md-4 col-lg-4 cbpd">
			<div id="rightSec" class="">
				<div class="conbor wbg">
					<div class="tntbg lrbrd3">
						<span aria-hidden="true" class="glyphicon glyphicon-eye-open sLNs"></span> <a href="<g:createLink uri="/topTenz"/>">Top Ten</a>
					</div>
					<g:set var="tlNews" value="${allLatestNews[30]}"></g:set>
					<div class="lnlnb">	
						<g:each var="tLatestNews" in="${tlNews}">
							<div class="lNews">
								<span aria-hidden="true" class="glyphicon glyphicon-list-alt sLNs"></span> <a href="<g:createLink uri="/topTenz/topList/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>">${tLatestNews.title}</a>
							</div>
						</g:each>
					</div>
					<div class="tntbg lrbrd3">
						<span aria-hidden="true" class="glyphicon glyphicon-eye-open sLNs"></span> <a href="<g:createLink uri="/pollz"/>">Poll</a>
					</div>
					<g:set var="tlNews" value="${allLatestNews[31]}"></g:set>
					<div class="lnlnb">	
						<g:each var="tLatestNews" in="${tlNews}">							
							<div class="lNews">
								<span aria-hidden="true" class="glyphicon glyphicon-ok-circle sLNs"></span> <a href="<g:createLink uri="/pollz/result/${tLatestNews.postId}/${seoCovert(title:tLatestNews.shortDescription)}"/>">${tLatestNews.shortDescription}</a>
							</div>
						</g:each>
					</div>
					<div class="gAds">
						<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
						<!-- Right Side Ads -->
						<ins class="adsbygoogle"
						     style="display:block"
						     data-ad-client="ca-pub-6843494013222478"
						     data-ad-slot="4911537141"
						     data-ad-format="auto"></ins>
						<script>
						(adsbygoogle = window.adsbygoogle || []).push({});
						</script>
					</div>
					<div class="tntbg lrbrd3">
						<span aria-hidden="true" class="glyphicon glyphicon-eye-open sLNs"></span> <a href="<g:createLink uri="/ask"/>">Ask</a>
					</div>
					<g:set var="tlNews" value="${allLatestNews[32]}"></g:set>
					<div class="lnlnb">	
						<g:each var="tLatestNews" in="${tlNews}">							
							<div class="lNews">
								<span aria-hidden="true" class="glyphicon glyphicon-question-sign sLNs"></span> <a href="<g:createLink uri="/ask/answer/${tLatestNews.postId}/${seoCovert(title:tLatestNews.title)}"/>">${tLatestNews.title}</a>
							</div>
						</g:each>
					</div>
					<div class="tntbg lrbrd3">
						<span aria-hidden="true" class="glyphicon glyphicon-eye-open sLNs"></span> <a href="<g:createLink uri="/quoteDay"/>">Quote</a>
					</div>
					<g:set var="tlNews" value="${allLatestNews[33]}"></g:set>
					<div class="lnlnb">	
						<g:each var="tLatestNews" in="${tlNews}">							
							<div class="lNews">
								<span aria-hidden="true" class="glyphicon glyphicon-heart-empty sLNs"></span> <a href="<g:createLink uri="/quoteDay/quote/${tLatestNews.postId}/${seoCovert(title:tLatestNews.shortDescription)}"/>">${tLatestNews.shortDescription}</a>
							</div>
						</g:each>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>