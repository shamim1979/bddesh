package com.bddesh24

import org.apache.commons.lang.WordUtils
import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.web.servlet.support.RequestContextUtils as RCU

class AskController {

    def springSecurityService
	def askService
	def HashwordService
	
	@Secured(['permitAll'])
    def index() { 
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def questions = askService.getLatestQuestions(new Date())
		
		def newsSourceTags
		def newsHashwords
		def topTenTags
		def pollTags
		def questionTags
		def usaTags
		def hashwordSet = HashwordSet.findByLocation("home")
		if(hashwordSet){
			newsSourceTags = hashwordSet.newsSourceTags
			if(newsSourceTags)
				newsSourceTags = newsSourceTags.replaceAll("\\s+", " ").trim().split(" ")
			newsHashwords = hashwordSet.newsArticleTags
			if(newsHashwords)
				newsHashwords = newsHashwords.replaceAll("\\s+", " ").trim().split(" ")
			topTenTags = hashwordSet.topTenTags
			if(topTenTags)
				topTenTags = topTenTags.replaceAll("\\s+", " ").trim().split(" ")
			pollTags = hashwordSet.pollTags
			if(pollTags)
				pollTags = pollTags.replaceAll("\\s+", " ").trim().split(" ")
			questionTags = hashwordSet.questionTags
			if(questionTags)
				questionTags = questionTags.replaceAll("\\s+", " ").trim().split(" ")
			usaTags = hashwordSet.usaSourceTags
			if(usaTags)
				usaTags = usaTags.replaceAll("\\s+", " ").trim().split(" ")
		}
		def metaData = [:]
		metaData.put("keyword", "bddesh24, ask, question, bangladesh, science, technology, sports, cricket, culture, lifestyle, education, entertainment, health, world, asia, europe, africa, usa, middle east, india, UK, south america, north america")
		metaData.put("title", "Bddesh24 | the leading social portal in Bangladesh")
		metaData.put("description", "Bddesh24 ask, question and best answer in the world")
		metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultQuestion.jpg")
		metaData.put("url", "http://www.bddesh24.com/ask")
		[metaData:metaData,usaTags:usaTags,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,user:user,questions:questions,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]
	}
	
	@Secured(['permitAll'])
	def answer() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def question
		try {
			question = Question.get(Integer.parseInt(params.id))
		}
		catch(Exception e) {
		}
		if(question){
			def keyWords = "answer, ask, question,"
			if(question.title){
				def tmpKeyWords = question.title.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			def answers = Answer.executeQuery("select AU,A from Answer as A inner join A.question as Q inner join A.answerOwner as AU where Q=:question and A.enabled=true order by A.totalVote desc",[question:question,max:30])
			def questionTag
			def questions
			def qusTagWords = question.questionTags
			if(qusTagWords){
				qusTagWords = qusTagWords.replaceAll("#", "")
				qusTagWords = qusTagWords.split(" ")
				questionTag = QuestionTag.findByQuestionTag(qusTagWords[0])
				if(questionTag)
					questions = HashwordService.getHashwordQuestions(questionTag,new Date(),3)
			}
			for(userQuestion in questions){
				if(userQuestion[0]==question){
					questions.remove(userQuestion)
					break
				}
			}				
			def newsSourceTags
			def newsHashwords
			def topTenTags
			def pollTags
			def questionTags
			def hashwordSet = HashwordSet.findByLocation("home")
			if(hashwordSet){
				newsSourceTags = hashwordSet.newsSourceTags
				if(newsSourceTags)
					newsSourceTags = newsSourceTags.replaceAll("\\s+", " ").trim().split(" ")
				newsHashwords = hashwordSet.newsArticleTags
				if(newsHashwords)
					newsHashwords = newsHashwords.replaceAll("\\s+", " ").trim().split(" ")
				topTenTags = hashwordSet.topTenTags
				if(topTenTags)
					topTenTags = topTenTags.replaceAll("\\s+", " ").trim().split(" ")
				pollTags = hashwordSet.pollTags
				if(pollTags)
					pollTags = pollTags.replaceAll("\\s+", " ").trim().split(" ")
				questionTags = hashwordSet.questionTags
				if(questionTags)
					questionTags = questionTags.replaceAll("\\s+", " ").trim().split(" ")
			}
			def metaData = [:]
			metaData.put("keyword", keyWords+"bddesh24")			
			if(question.shortDescription){
				metaData.put("title", question.title)
				metaData.put("description", question.shortDescription)
			}
			else{
				metaData.put("title", question.title)
				metaData.put("description", "Answer to help people if you know!")
			}
			if(question.imageName)
				metaData.put("image", "http://www.bddesh24.com/newsImages/d490/"+question.imageName)
			else
				metaData.put("image", "http://www.bddesh24.com/images/bddeshdefault/defaultQuestion.jpg")
			metaData.put("url", "http://www.bddesh24.com/ask/answer/"+question.id+"/"+seoCovert(title:question.title))
			[metaData:metaData,questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,questions:questions,user:user,question:question,answers:answers,keyWords:keyWords,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]
		}
		else{
			redirect(uri:"/")
			return
		}
	}
	
	@Secured(['permitAll'])
	def question() {
		def user = springSecurityService.currentUser
		def config = SpringSecurityUtils.securityConfig
		String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
		def question
		try {
			question = Question.get(Integer.parseInt(params.id))
		}
		catch(Exception e) {
		}
		if(question){
			def keyWords
			if(question.title){
				def tmpKeyWords = question.title.split(" ")
				for(word in tmpKeyWords){
					if(word.length() > 3){
						if(keyWords)
							keyWords = keyWords + " " + word + ", "
						else
							keyWords = word + ", "
					}
				}
			}
			def answers = Answer.executeQuery("select AU,A from Answer as A inner join A.question as Q inner join A.answerOwner as AU where Q=:question order by A.totalVote desc",[question:question,max:30])
			
			def newsSourceTags
			def newsHashwords
			def topTenTags
			def pollTags
			def questionTags
			def hashwordSet = HashwordSet.findByLocation("home")
			if(hashwordSet){
				newsSourceTags = hashwordSet.newsSourceTags
				if(newsSourceTags)
					newsSourceTags = newsSourceTags.replaceAll("\\s+", " ").trim().split(" ")
				newsHashwords = hashwordSet.newsArticleTags
				if(newsHashwords)
					newsHashwords = newsHashwords.replaceAll("\\s+", " ").trim().split(" ")
				topTenTags = hashwordSet.topTenTags
				if(topTenTags)
					topTenTags = topTenTags.replaceAll("\\s+", " ").trim().split(" ")
				pollTags = hashwordSet.pollTags
				if(pollTags)
					pollTags = pollTags.replaceAll("\\s+", " ").trim().split(" ")
				questionTags = hashwordSet.questionTags
				if(questionTags)
					questionTags = questionTags.replaceAll("\\s+", " ").trim().split(" ")
			}
			[questionTags:questionTags,pollTags:pollTags,topTenTags:topTenTags,newsHashwords:newsHashwords,newsSourceTags:newsSourceTags,user:user,question:question,answers:answers,keyWords:keyWords,rememberMeParameter: config.rememberMe.parameter,postUrl:postUrl]
		}
		else{
			redirect(uri:"/")
			return
		}
	}
	
	@Secured(['ROLE_USER'])
	def createQuestion(){
		def user = springSecurityService.currentUser
		withForm{			
			def title = params.questionTitle
			def shortDescription = params.shortDescription
			def imageName = params.questionImageName
			def questionHashtags = params.questionHashtags
			def questionTags
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
			if(questionHashtags){
				def words = questionHashtags.split(" ");
				for(word in words){
					if(word.length() > 2){
						if(word.substring(0,1) == "#"){
							if(questionTags)
								questionTags = questionTags + " " + word
							else
								questionTags = word
						}
						else{
							if(questionTags)
								questionTags = questionTags + " #" + word
							else
								questionTags = "#" + word
						}
					}
				}
			}
			if(title){
				def quoteWords = title.replaceAll("[^\\u0100-\\uFFFFa-zA-Z0-9]", " ")
				def words = quoteWords.split(" ");
				for(word in words){
					if(word.length() > 3){
						if(questionTags)
							questionTags = questionTags + " #" + WordUtils.capitalize(word)
						else
							questionTags = "#" + WordUtils.capitalize(word)
					}
				}
				if(title.length() > 400)
					title = title.substring(0,400)				
			}
			if(shortDescription){
				if(shortDescription.length() > 400)
					shortDescription = shortDescription.substring(0,400)
				def words = shortDescription.split(" ");
				for(word in words){
					if(word.length() > 2 && word.substring(0,1) == "#"){
						if(questionTags)
							questionTags = questionTags + " " + word
						else
							questionTags = word
					}
				}
				shortDescription = shortDescription.replaceAll("#", "")
			}
			if(imageName)
				imageName = "u"+user.id+"/"+imageName
			if(questionTags)
				questionTags = new LinkedHashSet<String>(Arrays.asList(questionTags.split(" "))).toString().replaceAll("[^\\u0100-\\uFFFFa-zA-Z0-9#]", " ")
			def newQuestion = new Question(title:title,shortDescription:shortDescription,imageName:imageName,questionTags:questionTags,questionOwner:author)
			
			if(newQuestion.save(flush:true)){
				if(questionTags){
					def newHashWords = questionTags.replaceAll("#", "")
					def words = newHashWords.split(" ");
					for(word in words){
						if(word && word.length() > 2){
							def foundHashWord = QuestionTag.findByQuestionTag(word)
							if(foundHashWord){
								foundHashWord.totalQuestion = foundHashWord.totalQuestion + 1
								foundHashWord.addToQuestions(newQuestion)
								foundHashWord.save(flush:true)
							}
							else{
								def hashWordTitle = word + " question"
								def newHashWord = new QuestionTag(questionTag:word,tagDescription:hashWordTitle,questionTagOwner:user)
								newHashWord.addToQuestions(newQuestion)
								newHashWord.save(flush:true)
							}
						}
					}
				}
				def newNewsArticle = new NewsArticle(title:title,hashWords:questionTags,detailsDescription:title,imageName:imageName,articleOwner:author,postType:4,postId:newQuestion.id)
				if(newNewsArticle.save(flush:true)){
					newQuestion.postId = newNewsArticle.id
					newQuestion.save(flush:true)
					if(questionTags){
						def newHashWords = questionTags.replaceAll("#", "")
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
					def latestNews = LatestNews.executeQuery("from LatestNews as LN where LN.postType=:postType order by LN.dateCreated",[postType:32])
					if(latestNews.size() == 5){
						latestNews[0].delete()
					}
					def newLatestNews = new LatestNews(title:title,shortDescription:title,imageName:imageName,postType:32,postId:newQuestion.id)
					newLatestNews.save(flush:true)
				}
				flash.message = "Well done! You successfully created a question. Thanks for staying with us."
				redirect(uri:"/ask/answer/"+newQuestion.id+"/"+seoCovert(title:newQuestion.title))
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
