package com.bddesh24

import org.apache.commons.lang.WordUtils
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

class PollzController {

    def springSecurityService
	def PollzService
	
	@Secured(['permitAll'])
    def index() { 
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def latestPolls = PollzService.getLatestPoll(new Date())
		def pollItemsMap = latestPolls.groupBy({it[0]})
		
		def metaData = [:]
		metaData.put("keyword", "bddesh24, poll, polls, vote, bangladesh, bangladesh vote, politics, science, technology, sports, culture, lifestyle, education, entertainment, health, cricket,football")
		metaData.put("title", "Bddesh24 | the leading social portal in Bangladesh")
		metaData.put("description", "Bddesh24 poll, pollz, vote, top polls and best poll in Bangladesh as well as in the world")
		metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultPoll.jpg")
		metaData.put("url", "http://www.bddesh24.com/pollz")
		[metaData:metaData,user:user,pollItemsMap:pollItemsMap,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]
	}
	
	@Secured(['permitAll'])
	def result() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def latestPolls = PollzService.getLatestPoll(new Date())
		def pollView
		try {
			pollView = Poll.get(Integer.parseInt(params.id))
		}
		catch(Exception e) {
		}
		if(pollView){
			def pollItems = pollView.pollItems
			def pollItemOpinionMap = [:]
			pollItemOpinionMap[pollItems[0]] = PollzService.getPollIOpinion(pollItems[0])
			pollItemOpinionMap[pollItems[1]] = PollzService.getPollIOpinion(pollItems[1])
			def tmpKeyWords = pollView.question.split(" ")
			def keyWords = "poll,"
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
			if(pollView.question)
				metaData.put("title", pollView.question)
			else
				metaData.put("title", "Bddesh24 | the leading social portal in Bangladesh")
			if(pollView.shortDescription)
				metaData.put("description", pollView.shortDescription)
			else
				metaData.put("description", "")
			if(pollView.imageName)
				metaData.put("image", "http://www.bddesh24.com/newsImages/d490/"+pollView.imageName)
			else
				metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultArticle.jpg")
			metaData.put("url", "http://www.bddesh24.com/pollz/result/"+pollView.id+"/"+seoCovert(title:pollView.question))
			[metaData:metaData,user:user,pollView:pollView,pollItemOpinionMap:pollItemOpinionMap,keyWords:keyWords,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]
		}
		else{
			redirect(uri:"/")
			return
		}
	}
	
	@Secured(['ROLE_USER'])
	def createPoll(){
		def user = springSecurityService.currentUser
		withForm{
			def imageName = params.pollImageName
			def question = params.pollQuestion
			def positiveTitle = params.positiveTitle
			def oppositeTitle = params.oppositeTitle
			def positiveDeffence = params.positiveDeffence
			def oppositeDeffence = params.oppositeDeffence
			def shortDescription = params.shortDescription
			def pollHashtags = params.pollHashtags
			def pollTags
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
			if(pollHashtags){
				def words = pollHashtags.split(" ");
				for(word in words){
					if(word.length() > 2){
						if(word.substring(0,1) == "#"){
							if(pollTags)
								pollTags = pollTags + " " + word
							else
								pollTags = word
						}
						else{
							if(pollTags)
								pollTags = pollTags + " #" + word
							else
								pollTags = "#" + word
						}
					}
				}
			}
			if(question){
				def quoteWords = question.replaceAll("[^\\u0100-\\uFFFFa-zA-Z0-9]", " ")
				def words = quoteWords.split(" ");
				for(word in words){
					if(word.length() > 3){
						if(pollTags)
							pollTags = pollTags + " #" + WordUtils.capitalize(word)
						else
							pollTags = "#" + WordUtils.capitalize(word)
					}
				}
				if(question.length() > 198)
					question = question.substring(0,198)				
				question = question.replaceAll("#", "")
			}
			if(positiveTitle){				
				if(positiveTitle.length() > 25)
					positiveTitle = positiveTitle.substring(0,25)
				def words = positiveTitle.split(" ");
				for(word in words){
					if(word.length() > 2 && word.substring(0,1) == "#"){
						if(pollTags)
							pollTags = pollTags + " " + word
						else
							pollTags = word
					}
				}
				positiveTitle = positiveTitle.replaceAll("#", "")
			}
			if(oppositeTitle){
				if(oppositeTitle.length() > 25)
					oppositeTitle = oppositeTitle.substring(0,25)
				def words = oppositeTitle.split(" ");
				for(word in words){
					if(word.length() > 2 && word.substring(0,1) == "#"){
						if(pollTags)
							pollTags = pollTags + " " + word
						else
							pollTags = word
					}
				}
				oppositeTitle = oppositeTitle.replaceAll("#", "")
			}
			if(positiveDeffence){
				if(positiveDeffence.length() > 400)
					positiveDeffence = positiveDeffence.substring(0,400)
				def words = positiveDeffence.split(" ");
				for(word in words){
					if(word.length() > 2 && word.substring(0,1) == "#"){
						if(pollTags)
							pollTags = pollTags + " " + word
						else
							pollTags = word
					}
				}
				positiveDeffence = positiveDeffence.replaceAll("#", "")
			}
			if(oppositeDeffence){
				if(oppositeDeffence.length() > 400)
					oppositeDeffence = oppositeDeffence.substring(0,400)
				def words = oppositeDeffence.split(" ");
				for(word in words){
					if(word.length() > 2 && word.substring(0,1) == "#"){
						if(pollTags)
							pollTags = pollTags + " " + word
						else
							pollTags = word
					}
				}
				oppositeDeffence = oppositeDeffence.replaceAll("#", "")
			}
			if(shortDescription){
				if(shortDescription.length() > 400)
					shortDescription = shortDescription.substring(0,400)
				def words = shortDescription.split(" ");
				for(word in words){
					if(word.length() > 2 && word.substring(0,1) == "#"){
						if(pollTags)
							pollTags = pollTags + " " + word
						else
							pollTags = word
					}
				}
				shortDescription = shortDescription.replaceAll("#", "")
			}
			else{
				if(positiveDeffence){
					shortDescription = positiveDeffence
				}
				else if(oppositeDeffence){
					shortDescription = oppositeDeffence
				}
				else{
					shortDescription = positiveTitle
				}				
			}			
			if(imageName)
				imageName = "u"+user.id+"/"+imageName
			if(pollTags)
				pollTags = new LinkedHashSet<String>(Arrays.asList(pollTags.split(" "))).toString().replaceAll("[^\\u0100-\\uFFFFa-zA-Z0-9#]", " ")
			def newPoll = new Poll(question:question,shortDescription:shortDescription,imageName:imageName,pollTags:pollTags,pollOwner:author)
			newPoll.addToPollItems(title:positiveTitle,deffence:positiveDeffence,isPositive:true,pollItemOwner:author)
			newPoll.addToPollItems(title:oppositeTitle,deffence:oppositeDeffence,pollItemOwner:author)
			
			if(newPoll.save(flush:true)){
				if(pollTags){
					def newHashWords = pollTags.replaceAll("#", "")
					def words = newHashWords.split(" ");
					for(word in words){
						if(word && word.length() > 2){
							def foundHashWord = PollTag.findByPollTag(word)
							if(foundHashWord){
								foundHashWord.totalPoll = foundHashWord.totalPoll + 1
								foundHashWord.addToPolls(newPoll)
								foundHashWord.save(flush:true)
							}
							else{
								def hashWordTitle = word + " news"
								def newHashWord = new PollTag(pollTag:word,tagDescription:hashWordTitle,pollTagOwner:author)
								newHashWord.addToPolls(newPoll)
								newHashWord.save(flush:true)
							}
						}
					}
				}
				def newNewsArticle
				if(shortDescription)
						newNewsArticle = new NewsArticle(title:question,hashWords:pollTags,shortDescription:shortDescription,detailsDescription:shortDescription,imageName:imageName,articleOwner:author,postType:3,postId:newPoll.id)
					else
						newNewsArticle = new NewsArticle(title:positiveTitle,hashWords:pollTags,detailsDescription:question,imageName:imageName,articleOwner:author,postType:3,postId:newPoll.id)
				if(newNewsArticle.save(flush:true)){
					newPoll.postId = newNewsArticle.id
					newPoll.save(flush:true)
					if(pollTags){
						def newHashWords = pollTags.replaceAll("#", "")
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
					def latestNews = LatestNews.executeQuery("from LatestNews as LN where LN.postType=:postType order by LN.dateCreated",[postType:31])
					if(latestNews.size() == 5){
						latestNews[0].delete()
					}
					def newLatestNews = new LatestNews(title:positiveTitle,shortDescription:question,imageName:imageName,postType:31,postId:newPoll.id)
					newLatestNews.save(flush:true)
				}
				flash.message = "Well done! You successfully created a poll. Thanks for staying with us."
				redirect(uri:"/pollz/result/"+newPoll.id+"/"+seoCovert(title:newPoll.question))
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
