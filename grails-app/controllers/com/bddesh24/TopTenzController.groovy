package com.bddesh24

import org.apache.commons.lang.WordUtils
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

class TopTenzController {
	def springSecurityService
	def TopTenzService
	
	@Secured(['permitAll'])
    def index() { 
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def topTenList = TopTenzService.getLatestTopTens(new Date())
		
		def metaData = [:]
		metaData.put("keyword", "bddesh24, top ten, top ten list, top list, top in bangladesh, top in world, bangladesh top list, best in bangladesh, top animals, top books, top company, top product, top consumer services, top education, top university, top college, top foods, top games, top lifestyle, top movies, top music, top people, top sports, top television, top world, top technology")
		metaData.put("title", "Bddesh24 | the leading social portal in Bangladesh")
		metaData.put("description", "Bddesh24 best top ten list in Bangladesh as well as in the world")
		metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultTopTen.jpg")
		metaData.put("url", "http://www.bddesh24.com/topTenz")
		[metaData:metaData,user:user,topTenList:topTenList,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]
	}
	
	@Secured(['permitAll'])
	def topList() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def topTenView
		try {
			topTenView = TopTen.get(Integer.parseInt(params.id))
		}
		catch(Exception e) {
		}
		if(topTenView){
			def topTenItems = TopTenzService.getTopTenItems(topTenView)
			def topTenItemsOpinionMap = [:]
			for(topTenItem in topTenItems){
				def topTenOpinions = TopTenzService.getTopTenItemOpinions(topTenItem)
				topTenItemsOpinionMap.put(topTenItem, topTenOpinions)
			}
			def tmpKeyWords = topTenView.title.split(" ")
			def keyWords = "topten,"
			for(word in tmpKeyWords){
				if(word.length() > 3){
					if(keyWords)
						keyWords = keyWords + " " + word + ", "
					else
						keyWords = word + ", " 
				}	
			}			
			def metaData = [:]
			metaData.put("keyword", keyWords+"bddesh24")
			if(topTenView.title)
				metaData.put("title", topTenView.title)
			else
				metaData.put("title", "Bddesh24 | the leading social portal in Bangladesh")
			if(topTenView.shortDescription)
				metaData.put("description", topTenView.shortDescription)
			else
				metaData.put("description", "Bddesh24 best top ten list in Bangladesh as well as in the world")
			if(topTenView.imageName)
				metaData.put("image", "http://www.bddesh24.com/newsImages/d490/"+topTenView.imageName)
			else
				metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultTopTen.jpg")
			metaData.put("url", "http://www.bddesh24.com/topTenz/topList/"+topTenView.id+"/"+seoCovert(title:topTenView.title))
			[metaData:metaData,user:user,topTenItemsOpinionMap:topTenItemsOpinionMap,topTenView:topTenView,keyWords:keyWords,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]
		}
		else{
			redirect(uri:"/")
			return
		}
	}
	
	@Secured(['ROLE_USER'])
	def createTopTen(){
		def user = springSecurityService.currentUser
		withForm{
			def title = params.toptenTitle
			def detailsDescription = params.toptenDescription
			def imageName = params.toptenImageName
			def toptenHashtags = params.toptenHashtags
			def toptenItemLength = params.toptenItemLength
			def shortDescription 
			def topTenTags
			def itemsLength
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
			try{
				if(toptenItemLength)
					itemsLength = Integer.parseInt(toptenItemLength)
			}
			catch(Exception e){
				itemsLength = 3
			}
			
			if(toptenHashtags){
				def words = toptenHashtags.split(" ");
				for(word in words){
					if(word.length() > 2){
						if(word.substring(0,1) == "#"){
							if(topTenTags)
								topTenTags = topTenTags + " " + word
							else
								topTenTags = word
						}
						else{
							if(topTenTags)
								topTenTags = topTenTags + " #" + word
							else
								topTenTags = "#" + word
						}
					}
				}
			}
			
			if(detailsDescription){
				if(detailsDescription.length() > 900)
					detailsDescription = detailsDescription.substring(0,900)
				def words = detailsDescription.split(" ");
				for(word in words){
					if(word.length() > 2 && word.substring(0,1) == "#"){
						if(topTenTags)
							topTenTags = topTenTags + " " + word
						else
							topTenTags = word
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
						if(topTenTags)
							topTenTags = topTenTags + " " + word
						else
							topTenTags = word
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
						if(topTenTags)
							topTenTags = topTenTags + " #" + WordUtils.capitalize(word)
						else
							topTenTags = "#" + WordUtils.capitalize(word)
					}
				}
				if(title.length() > 240)
					title = title.substring(0,240)				
				title = title.replaceAll("#", "")
			}
			
			if(imageName)
				imageName = "u"+user.id+"/"+imageName
			if(topTenTags)
				topTenTags = new LinkedHashSet<String>(Arrays.asList(topTenTags.split(" "))).toString().replaceAll("[^\\u0100-\\uFFFFa-zA-Z0-9#]", " ")
			def newTopTen = new TopTen(title:title,shortDescription:shortDescription,detailsDescription:detailsDescription,imageName:imageName,topTenTags:topTenTags,topTenOwner:author)
			
			for(int j = 1; j <= itemsLength; j++){
				def item = params."item${j}"
				item = item.replaceAll("#", "")
				if(item.length() > 100)
					item = item.substring(0,100)					
				newTopTen.addToTopTenItems(title:item,topTenItemOwner:author)
			}
			newTopTen.totalTopTenItem = itemsLength
			newTopTen.totalScore = itemsLength
			if(newTopTen.save(flush:true)){
				if(topTenTags){
					def newHashWords = topTenTags.replaceAll("#", "")
					def words = newHashWords.split(" ");
					for(word in words){
						if(word && word.length() > 2){
							def foundHashWord = TopTenTag.findByTopTenTag(word)
							if(foundHashWord){
								foundHashWord.totalTopTen = foundHashWord.totalTopTen + 1
								foundHashWord.addToTopTens(newTopTen)
								foundHashWord.save(flush:true)
							}
							else{
								def hashWordTitle = word + " news"
								def newHashWord = new TopTenTag(topTenTag:word,tagDescription:hashWordTitle,topTenTagOwner:author)
								newHashWord.addToTopTens(newTopTen)
								newHashWord.save(flush:true)
							}
						}
					}
				}
				def newNewsArticle = new NewsArticle(title:title,hashWords:topTenTags,shortDescription:shortDescription,detailsDescription:detailsDescription,imageName:imageName,articleOwner:author,postType:2,postId:newTopTen.id)
				
				if(newNewsArticle.save(flush:true)){
					newTopTen.postId = newNewsArticle.id
					newTopTen.save(flush:true)
					if(topTenTags){
						def newHashWords = topTenTags.replaceAll("#", "")
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
				}
				
				if(user.isAdmin){
					def latestNews = LatestNews.executeQuery("from LatestNews as LN where LN.postType=:postType order by LN.dateCreated",[postType:30])
					if(latestNews.size() == 5){
						latestNews[0].delete()
					}
					def newLatestNews = new LatestNews(title:title,shortDescription:shortDescription,imageName:imageName,postType:30,postId:newTopTen.id)
					newLatestNews.save(flush:true)
				}				
				
				flash.message = "Well done! You successfully created a top ten list. Thanks for staying with us."
				redirect(uri:"/topTenz/topList/"+newTopTen.id+"/"+seoCovert(title:newTopTen.title))
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
