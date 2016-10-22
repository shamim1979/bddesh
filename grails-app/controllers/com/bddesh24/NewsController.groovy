package com.bddesh24

import org.apache.commons.lang.WordUtils
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

class NewsController {

    def springSecurityService
	def NewsService
	def HashwordService
	
	@Secured(['permitAll'])
    def index() { 
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def newsArticles = NewsService.getLatestOnlyNewsArticles(new Date())	
		
		def metaData = [:]
		metaData.put("keyword", "bddesh24, news, bangladesh, bangladesh news, science, technology, sports, cricket, culture, lifestyle, education, entertainment, health, world, asia, europe, africa, usa, middle east, india, UK, south america, north america")
		metaData.put("title", "Bddesh24 | the leading social portal in Bangladesh")
		metaData.put("description", "Bddesh24 latest news, social news, Bangladesh news and world news")
		metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultArticle.jpg")
		metaData.put("url", "http://www.bddesh24.com/news")
		[metaData:metaData,user:user,newsArticles:newsArticles,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl,isHome:false]
	}
	
	@Secured(['permitAll'])
	def article() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def newsArticleView
		try {
			newsArticleView = NewsArticle.get(Integer.parseInt(params.id))
		}
		catch(Exception e) {
		}
		
		if(newsArticleView){
			def articleComments = NewsArticle.executeQuery("select NAC,NACU from NewsArticle as NA inner join NA.articleComments as NAC inner join NAC.commentOwner as NACU where NA=:newsArticle and NAC.enabled=true order by NAC.totalLike desc",[newsArticle:newsArticleView,max:30])
			def nwsTagWords = newsArticleView.hashWords
			def newsArticles
			if(nwsTagWords){
				nwsTagWords = nwsTagWords.replaceAll("#", "")
				nwsTagWords = nwsTagWords.split(" ")
				def articleHashWord = ArticleHashWord.findByHashWord(nwsTagWords[0])
				newsArticles = HashwordService.getHashwordNewsArticles(articleHashWord,new Date(),6)
			}
			for(userNewsArticle in newsArticles){
				if(userNewsArticle[1] == newsArticleView){
					newsArticles.remove(userNewsArticle)
					break
				}
			}
			def keyWords = "news,"
			if(newsArticleView.title){
				def tmpKeyWords = newsArticleView.title.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						keyWords = keyWords + " " + word + ", "
					}
				}
			}
			def metaData = [:]
			metaData.put("keyword", keyWords+"bddesh24")			
			if(newsArticleView.title)
				metaData.put("title", newsArticleView.title)
			else
				metaData.put("title", "Bddesh24 | the leading social portal in Bangladesh")
			if(newsArticleView.shortDescription)
				metaData.put("description", newsArticleView.shortDescription)
			else
				metaData.put("description", newsArticleView.detailsDescription)
			if(newsArticleView.imageName)
				metaData.put("image", "http://www.bddesh24.com/newsImages/d490/"+newsArticleView.imageName)
			else
				metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultArticle.jpg")
			metaData.put("url", "http://www.bddesh24.com/news/article/"+newsArticleView.id+"/"+seoCovert(title:newsArticleView.title))
			[metaData:metaData,newsArticles:newsArticles,articleComments:articleComments,newsArticleView:newsArticleView,keyWords:keyWords,user:user,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]
		}
		else{
			redirect(uri:"/newspapers",permanent: true)
			return
		}
	}
	
	@Secured(['ROLE_USER'])
	def createArticle(){
		def user = springSecurityService.currentUser
		withForm{
			def postType = 0
			def newsCategory = params.newsCategory
			def title = params.articleTitle
			def detailsDescription = params.articleDescription
			def imageName = params.newsImageName
			def articleHashtags = params.articleHashtags
			def shortDescription  = params.articleShortDescription
			def newsLink  = params.newsLink
			def hashWords
			def hasDetails = false
			Random random = new Random()
			def author
			def adminSize
			def adminUsers
			if(user.isAdmin){
				adminUsers = User.executeQuery("from User as U where U.enabled=true and U.isAdmin=true")
				adminSize = adminUsers.size()
				author = adminUsers[random.nextInt(adminSize)]
			}
			else{
				author = user
			}			
			if(articleHashtags){
				def words = articleHashtags.split(" ");
				for(word in words){
					if(word.length() > 2){
						if(word.substring(0,1) == "#"){
							if(hashWords)
								hashWords = hashWords + " " + word
							else
								hashWords = word
						}
						else{
							if(hashWords)
								hashWords = hashWords + " #" + word
							else
								hashWords = "#" + word
						}
					}
				}
			}
			
			if(detailsDescription){
				if(detailsDescription.length() > 500)
					hasDetails = true
				if(detailsDescription.length() > 3500)
					detailsDescription = detailsDescription.substring(0,3500)
				def words = detailsDescription.split(" ");
				for(word in words){
					if(word.length() > 2 && word.substring(0,1) == "#"){
						if(hashWords)
							hashWords = hashWords + " " + word
						else
							hashWords = word
					}
				}
				detailsDescription = detailsDescription.replaceAll("#", "")
			}
			
			if(shortDescription){
				if(shortDescription.length() > 400)
					shortDescription = shortDescription.substring(0,400)
				def words = shortDescription.split(" ");
				for(word in words){
					if(word.length() > 2 && word.substring(0,1) == "#"){
						if(hashWords)
							hashWords = hashWords + " " + word
						else
							hashWords = word
					}
				}
				shortDescription = shortDescription.replaceAll("#", "")
			}
			else{
				if(detailsDescription && detailsDescription.length() > 400)
					shortDescription = detailsDescription.substring(0,400)
				else
					shortDescription = detailsDescription
			}
			
			if(title){
				def quoteWords = title.replaceAll("[^\\u0100-\\uFFFFa-zA-Z0-9]", " ")
				def words = quoteWords.split(" ");
				for(word in words){
					if(word.length() > 3){
						if(hashWords)
							hashWords = hashWords + " #" + WordUtils.capitalize(word)
						else
							hashWords = "#" + WordUtils.capitalize(word)
					}
				}				
				if(title.length() > 240)
					title = title.substring(0,240)
				title = title.replaceAll("#", "")
			}
			
			if(imageName)
				imageName = "u"+user.id+"/"+imageName
			if(hashWords)	
				hashWords = new LinkedHashSet<String>(Arrays.asList(hashWords.split(" "))).toString().replaceAll("[^\\u0100-\\uFFFFa-zA-Z0-9#]", " ")
			def newNewsArticle = new NewsArticle(title:title,shortDescription:shortDescription,detailsDescription:detailsDescription,imageName:imageName,hashWords:hashWords,articleOwner:author,hasDetails:hasDetails,postType:1,newsLink:newsLink)
			if(newNewsArticle.save(flush:true)){
				if(hashWords){
					def newHashWords = hashWords.replaceAll("#", "")
					def words = newHashWords.split(" ");
					for(word in words){
						if(word && word.length() > 2){
							def foundHashWord = ArticleHashWord.findByHashWord(word)
							if(foundHashWord){
								foundHashWord.totalArticle = foundHashWord.totalArticle + 1
								foundHashWord.addToNewsArticles(newNewsArticle)
								foundHashWord.save(flush:true)
							}
							else{
								def hashWordTitle = word + " news"
								def newHashWord = new ArticleHashWord(hashWord:word,hashWordTitle:hashWordTitle,articleHashWordOwner:author)
								newHashWord.addToNewsArticles(newNewsArticle)
								newHashWord.save(flush:true)
							}
						}
					}
				}
				if(user.isAdmin){
					try{
						postType = Integer.parseInt(newsCategory)
					}
					catch(Exception e){						
					}
					if(postType > 0){
						def latestNews = LatestNews.executeQuery("from LatestNews as LN where LN.postType=:postType order by LN.dateCreated",[postType:postType])
						if(postType == 1 && latestNews.size() == 2){
							latestNews[0].delete()						
						}
						else if(postType == 2 && latestNews.size() == 10){
							latestNews[0].delete()
						}
						else if(postType > 2 && latestNews.size() == 3){
							latestNews[0].delete()
						}
						def newLatestNews = new LatestNews(title:title,shortDescription:shortDescription,imageName:imageName,postType:postType,postId:newNewsArticle.id)
						newLatestNews.save(flush:true)
					}
				}
				flash.message = "Well done! You successfully created an article. Thanks for staying with us."
				redirect(uri:"/news/article/"+newNewsArticle.id+"/"+seoCovert(title:newNewsArticle.title))
				return
			}
			else{
				redirect(uri:"/")
				return
			}
			
		}.invalidToken{
			redirect(uri:"/")
			return
		}
	}
}
