package com.bddesh24

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder as SCH
import grails.plugin.springsecurity.SpringSecurityUtils
import java.text.SimpleDateFormat
import org.springframework.web.servlet.support.RequestContextUtils as RCU

@Secured(['permitAll'])
class PublicFunctionController {
	
	def springSecurityService
	def NewsService
	def TopTenzService
	def PollzService
	def askService
	def HashwordService
	def NewsSourceService
	def QuoteService
	def submitHWDescription(){
		def user = springSecurityService.currentUser
		def hashwordId = request.getParameter('tag')
		def hashwordType = request.getParameter('hwType')
		def description = request.getParameter('hwDescription')
		def hashword
		try{
			if(hashwordType.equals("hwask")){
				hashword = QuestionTag.get(Integer.parseInt(hashwordId))
				if(hashword && description)
					hashword.tagDescription = description
			}
			else if(hashwordType.equals("hwlinkz")){
				hashword = NewsSourceTag.get(Integer.parseInt(hashwordId))
				if(hashword && description)
					hashword.tagDescription = description
			}
			else if(hashwordType.equals("hwnews")){
				hashword = ArticleHashWord.get(Integer.parseInt(hashwordId))
				if(hashword && description)
					hashword.hashWordTitle = description
			}
			else if(hashwordType.equals("hwpollz")){
				hashword = PollTag.get(Integer.parseInt(hashwordId))
				if(hashword && description)
					hashword.tagDescription = description
			}
			else if(hashwordType.equals("hwtoptenz")){
				hashword = TopTenTag.get(Integer.parseInt(hashwordId))
				if(hashword && description)
					hashword.tagDescription = description
			}
			else if(hashwordType.equals("hwquote")){
				hashword = QuoteTopic.get(Integer.parseInt(hashwordId))
				if(hashword && description)
					hashword.topicDescription = description
			}
		}catch(Exception e){
		
		}
		if(hashword && hashword.save(flush:true)){
			render "done"
			return
		}
		else{
			render "bad"
			return
		}
	}
	
	def loadMoreHashNews(){
		def user = springSecurityService.currentUser
		def newsArticle
		def hashwdCat = request.getParameter("cathashwd")	
		def lastFeedDate
		def hashwdId	
		try{
			lastFeedDate = new Date().parse("yyyy-M-d H:m:s", request.getParameter("lastFeedDate"))
			hashwdId = Integer.parseInt(request.getParameter("tag"))
		}
		catch(Exception e){
		}
		if(hashwdCat && lastFeedDate && hashwdId){
			if(hashwdCat.equals("ask")){
				def questionTag = QuestionTag.get(hashwdId)
				if(questionTag){
					def questions = HashwordService.getHashwordQuestions(questionTag,lastFeedDate)
					[hashwdCat:hashwdCat,user:user,questionTag:questionTag,questions:questions]
				}
				else{
					render "nodata"
					return
				}
			}
			else if(hashwdCat.equals("news")){
				def articleHashWord = ArticleHashWord.get(hashwdId)
				if(articleHashWord){
					def newsArticles = HashwordService.getHashwordNewsArticles(articleHashWord,lastFeedDate)
					[hashwdCat:hashwdCat,user:user,articleHashWord:articleHashWord,newsArticles:newsArticles]
				}
				else{
					render "nodata"
					return
				}	
			}
			else if(hashwdCat.equals("pollz")){
				def pollTag = PollTag.get(hashwdId)
				if(pollTag){
					def polls = HashwordService.getHashwordPolls(pollTag,lastFeedDate)
					def pollItemsMap = polls.groupBy({it[0]})
					[hashwdCat:hashwdCat,user:user,pollTag:pollTag,pollItemsMap:pollItemsMap]
				}
				else{
					render "nodata"
					return
				}
			}
			else if(hashwdCat.equals("toptenz")){
				def topTenTag = TopTenTag.get(hashwdId)
				if(topTenTag){
					def topTens = HashwordService.getHashwordTopTens(topTenTag,lastFeedDate)
					[hashwdCat:hashwdCat,user:user,topTenTag:topTenTag,topTens:topTens]
				}
				else{
					render "nodata"
					return
				}
			}
			else{
				render "nodata"
				return
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def likeNewsSource(){
		def user = springSecurityService.currentUser
		def newsSource
		try {
			newsSource = NewsSource.get(Integer.parseInt(request.getParameter("NSrcId")))
		} catch (Exception e) {
		
		}
		if(newsSource){
			newsSource.totalVote = newsSource.totalVote + 1
			if(newsSource.save(flush:true)){
				render newsSource.totalVote
			}
			else{
				render newsSource.totalVote
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def likedQuote(){
		def user = springSecurityService.currentUser
		def quote
		try {
			quote = Quote.get(Integer.parseInt(request.getParameter("lkQuoteId")))
		} catch (Exception e) {
		
		}
		if(quote){
			quote.totalLike = quote.totalLike + 1
			if(quote.save(flush:true)){
				render quote.totalLike
			}
			else{
				render quote.totalLike
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def likeQuoteComment(){
		def user = springSecurityService.currentUser
		def quoteComment
		try {
			quoteComment = QuoteComment.get(Integer.parseInt(request.getParameter("lkQuoteCmtId")))
		} catch (Exception e) {
		
		}
		if(quoteComment){
			quoteComment.totalLike = quoteComment.totalLike + 1
			if(quoteComment.save(flush:true)){
				render quoteComment.totalLike
			}
			else{
				render quoteComment.totalLike
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def submitNewTopTenItem(){
		def user = springSecurityService.currentUser
		def topTen
		def newTenItem
		def newTopTenItem
		try {
			topTen = TopTen.get(Integer.parseInt(request.getParameter("niTTid")))
			newTenItem = request.getParameter("item")
		} catch (Exception e) {
		
		}
		if(topTen && newTenItem){
			newTenItem = newTenItem.replaceAll("#", "")
			if(newTenItem.length() > 100)
				newTenItem = newTenItem.substring(0,100)
			newTopTenItem = new TopTenItem(title:newTenItem,topTenItemOwner:user)
			topTen.addToTopTenItems(newTopTenItem)
			topTen.totalTopTenItem = topTen.totalTopTenItem + 1
			topTen.totalScore = topTen.totalScore + 1
			if(topTen.save(flush:true)){
				[topTen:topTen,newTopTenItem:newTopTenItem,user:user]
			}
			else{
				render "nodata"
				return
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def likeNewsSourceItem(){
		def user = springSecurityService.currentUser
		def newsSourceItem
		try {
			newsSourceItem = NewsSourceItem.get(Integer.parseInt(request.getParameter("NSItmId")))
		} catch (Exception e) {
		
		}
		if(newsSourceItem){
			newsSourceItem.totalVote = newsSourceItem.totalVote + 1
			if(newsSourceItem.save(flush:true)){
				render newsSourceItem.totalVote
			}
			else{
				render newsSourceItem.totalVote
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def submitNewsSourceComment(){
		def user = springSecurityService.currentUser
		def newsSource
		def comment
		try {
			newsSource = NewsSource.get(Integer.parseInt(request.getParameter("nscmsb_id")))
			comment = request.getParameter("comment")
		} catch (Exception e) {
		
		}
		if(newsSource && comment){
			Random random = new Random()
			def author
			def adminSize
			def adminUsers
			if(user && user.isAdmin){
				adminUsers = User.executeQuery("from User as U where U.enabled=true and U.isAdmin=true")
				adminSize = adminUsers.size()
				author = adminUsers[random.nextInt(adminSize)]
			}
			else{
				author = user
			}
			def newsSourceComment	
			def commentOwner
			if(comment.length() > 450)
				comment = comment.substring(0,450)
			comment = comment.replaceAll("#", "")							
			if(user){				
				commentOwner = author
				newsSourceComment = new NewsSourceComment(comment:comment,newsSource:newsSource,commentOwner:commentOwner)
			}
			else{
				def guest = User.findByUsername("guest")
				commentOwner = guest
				newsSourceComment = new NewsSourceComment(comment:comment,newsSource:newsSource,commentOwner:commentOwner)
			}
			if(user && user.isAdmin)
				newsSourceComment.enabled = true
			else
				newsSourceComment.enabled = false
			if(newsSourceComment.save(flush:true)){
				if(user && user.isAdmin){
					newsSource.totalComment = newsSource.totalComment + 1
					newsSource.save(flush:true)
				}				
				SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
			    def now = new Date()
			    def nowDateTime = sdfDate.format(now)
				[newsSource:newsSource,newsSourceComment:newsSourceComment,commentOwner:commentOwner,nowDateTime:nowDateTime]
			}
			else{
				render "nodata"
				return
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def submitNewsSourceItemComment(){
		def user = springSecurityService.currentUser
		def newsSourceItem
		def comment
		try {
			newsSourceItem = NewsSourceItem.get(Integer.parseInt(request.getParameter("nsicmsb_id")))
			comment = request.getParameter("comment")
		} catch (Exception e) {
		
		}
		if(newsSourceItem && comment){
			def newsSourceItemComment
			def commentOwner
			if(comment.length() > 450)
				comment = comment.substring(0,450)
			comment = comment.replaceAll("#", "")
			if(user){
				commentOwner = user
				newsSourceItemComment = new NewsSourceItemComment(comment:comment,newsSourceItem:newsSourceItem,commentOwner:commentOwner)
			}
			else{
				def guest = User.findByUsername("guest")
				commentOwner = guest
				newsSourceItemComment = new NewsSourceComment(comment:comment,newsSourceItem:newsSourceItem,commentOwner:commentOwner)
			}
			if(user && user.isAdmin)
				newsSourceItemComment.enabled = true
			else
				newsSourceItemComment.enabled = false
			if(newsSourceItemComment.save(flush:true)){
				if(user && user.isAdmin){
					newsSourceItem.totalComment = newsSourceItem.totalComment + 1
					newsSourceItem.save(flush:true)
				}				
				SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				def now = new Date()
				def nowDateTime = sdfDate.format(now)
				[newsSourceItem:newsSourceItem,newsSourceItemComment:newsSourceItemComment,commentOwner:commentOwner,nowDateTime:nowDateTime]
			}
			else{
				render "nodata"
				return
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def loadNSComments(){
		def user = springSecurityService.currentUser
		def newsSource
		try {
			newsSource = NewsSource.get(Integer.parseInt(request.getParameter("comNS_id")))
		} catch (Exception e) {
		
		}
		if(newsSource){
			def comments = NewsSourceComment.executeQuery("select NSCU,NSC from NewsSourceComment as NSC inner join NSC.newsSource as NS inner join NSC.commentOwner as NSCU where NS=:newsSource order by NSC.dateCreated desc",[newsSource:newsSource,max:40])
			[comments:comments,user:user]
		}
		else{
			render "nodata"
			return
		}
	}
	
	def loadNewsSourceItemComments(){
		def user = springSecurityService.currentUser
		def newsSourceItem
		try {
			newsSourceItem = NewsSourceItem.get(Integer.parseInt(request.getParameter("snsi_id")))
		} catch (Exception e) {
		
		}
		if(newsSourceItem){
			def comments = NewsSourceItem.executeQuery("select NSICU,NSIC from NewsSourceItem as NSI inner join NSI.newsSourceItemComment as NSIC inner join NSIC.commentOwner as NSICU where NSI=:newsSourceItem and NSIC.enabled=true order by NSIC.dateCreated desc",[newsSourceItem:newsSourceItem,max:40])
			[comments:comments,user:user]
		}
		else{
			render "nodata"
			return
		}
	}
	
	def enableComment(){
		def user = springSecurityService.currentUser
		def type = request.getParameter("cmtTpe")
		if(type.equals("ns")){
			def newsSourceComment
			try {
				newsSourceComment = NewsSourceComment.get(Integer.parseInt(request.getParameter("NSrcEnId")))
			} catch (Exception e) {
			
			}
			if(newsSourceComment){
				if(newsSourceComment.enabled == false){
					newsSourceComment.enabled = true
					newsSourceComment.save(flush:true)
					def newsSource = newsSourceComment.newsSource
					newsSource.totalComment = newsSource.totalComment + 1
					newsSource.save(flush:true)
				}							
				render "good"
				return
			}
			else{
				render "nodata"
				return
			}
		}
		else{
			def newsSourceItemComment
			try {
				newsSourceItemComment = NewsSourceItemComment.get(Integer.parseInt(request.getParameter("NSrcEnId")))
			} catch (Exception e) {
			
			}
			if(newsSourceItemComment){
				if(newsSourceItemComment.enabled == false){
					newsSourceItemComment.enabled = true
					newsSourceItemComment.save(flush:true)
					def newsSourceItem = newsSourceItemComment.newsSourceItem
					newsSourceItem.totalComment = newsSourceItem.totalComment + 1
					newsSourceItem.save(flush:true)
				}							
				render "good"
				return
			}
			else{
				render "nodata"
				return
			}
		}		
	}
	
    def likeArticle(){
		def user = springSecurityService.currentUser
		def newsArticle
		try {
			newsArticle = NewsArticle.get(Integer.parseInt(request.getParameter("articleId")))
		} catch (Exception e) {
		
		}
		if(newsArticle){
			newsArticle.totalLike = newsArticle.totalLike + 1
			if(newsArticle.save(flush:true)){
				render newsArticle.totalLike
			}
			else{
				render newsArticle.totalLike
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def likeAnswer(){
		def user = springSecurityService.currentUser
		def answer
		try {
			answer = Answer.get(Integer.parseInt(request.getParameter("lkAnsId")))
		} catch (Exception e) {
		
		}
		if(answer){
			answer.totalVote = answer.totalVote + 1
			if(answer.save(flush:true)){
				render answer.totalVote
			}
			else{
				render answer.totalVote
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def bestAnswer(){
		def user = springSecurityService.currentUser
		def answer
		def question
		try {
			answer = Answer.get(Integer.parseInt(request.getParameter("bstAnsId")))
		} catch (Exception e) {
		
		}
		if(answer){			
			question = answer.question
			answer.isBest = true
			question.bestAnswer = answer
			if(answer.detailsDescription.length() > 450)				
				question.shortDescription = answer.detailsDescription.substring(0,450)
			else
				question.shortDescription = answer.detailsDescription
			if(answer.imageName)
				question.imageName = answer.imageName
			def bestAnswers = Answer.executeQuery("select A from Answer as A inner join A.question as Q where Q=:question and A.isBest=true",[question:question])
			for(bestAnswer in bestAnswers){
				bestAnswer.isBest = false
				bestAnswer.save(flush:true)
			}
			answer.save(flush:true)
			question.save(flush:true)			
			render "done"
			return
		}
		else{
			render "nodata"
			return
		}
	}
	
	def likeQuestion(){
		def user = springSecurityService.currentUser
		def question
		def lkType
		try {
			question = Question.get(Integer.parseInt(request.getParameter("qusId")))
			lkType = request.getParameter("qlkType")
		} catch (Exception e) {
		
		}
		if(question && lkType){			
			if(lkType.equals("up")){
				question.totalVote = question.totalVote + 1
				question.totalScore = question.totalScore + 1
			}
			else if(question.totalVote > 0){
				question.totalVote = question.totalVote - 1
				question.totalScore = question.totalScore - 1
			}
			if(question.save(flush:true)){
				render question.totalVote 
			}
			else{
				render question.totalVote 
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def submitAnswer(){
		def user = springSecurityService.currentUser
		def question
		def answerTxt
		def answerOwner
		def newAnswer
		Random random = new Random()
		def author
		def adminSize
		def adminUsers
		if(user && user.isAdmin){
			adminUsers = User.executeQuery("from User as U where U.enabled=true and U.isAdmin=true")
			adminSize = adminUsers.size()
			author = adminUsers[random.nextInt(adminSize)]
		}
		else{
			author = user
		}
		try {
			question = Question.get(Integer.parseInt(request.getParameter("qusIdAns")))
			answerTxt = request.getParameter("answer")
		} catch (Exception e) {
		
		}
		if(question && answerTxt){
			if(answerTxt.length() > 1800)
				answerTxt = answerTxt.substring(0,1800)
			answerTxt = answerTxt.replaceAll("#", "")
			if(user)
				answerOwner = author
			else
				answerOwner = User.findByUsername("guest")
			newAnswer = new Answer(detailsDescription:answerTxt,answerOwner:answerOwner)
			question.totalAnswer = question.totalAnswer + 1
			question.totalScore = question.totalScore + 1
			question.addToAnswers(newAnswer)
			if(question.save(flush:true)){
				def newsArtcle = NewsArticle.get(question.postId)
				if(newsArtcle){
					if(answerTxt.length() > 450)
						answerTxt = answerTxt.substring(0,450)
					def articleComment = new ArticleComment(comment:answerTxt,newsArticle:newsArtcle,commentOwner:answerOwner)
					if(articleComment.save(flush:true)){
						newsArtcle.totalComment = newsArtcle.totalComment + 1
						newsArtcle.save(flush:true)
					}
				}
				SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				def now = new Date()
				def nowDateTime = sdfDate.format(now)
				[newAnswer:newAnswer,answerOwner:answerOwner,nowDateTime:nowDateTime]
			}
			else{
				render "nodata"
				return
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def loadAnswer(){
		def user = springSecurityService.currentUser
		def question
		def lkType
		try {
			question = Question.get(Integer.parseInt(request.getParameter("sAnsQusId")))
		} catch (Exception e) {
		
		}
		if(question){
			def answers = Answer.executeQuery("select AU,A from Answer as A inner join A.question as Q inner join A.answerOwner as AU where Q=:question and A.enabled=true order by A.dateCreated desc",[question:question,max:20])
			[answers:answers,question:question]
		}
		else{
			render "nodata"
			return
		}
	}
	
	def likePollOpinion(){
		def user = springSecurityService.currentUser
		def pollItemOpinion
		try {
			pollItemOpinion = PollItemOpinion.get(Integer.parseInt(request.getParameter("pOpinionId")))
		} catch (Exception e) {
		
		}
		if(pollItemOpinion){
			pollItemOpinion.totalLike = pollItemOpinion.totalLike + 1
			if(pollItemOpinion.save(flush:true)){
				render pollItemOpinion.totalLike
			}
			else{
				render pollItemOpinion.totalLike
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def likeTopItem(){
		def user = springSecurityService.currentUser
		def topTenItem
		try {
			topTenItem = TopTenItem.get(Integer.parseInt(request.getParameter("tItemId")))
		} catch (Exception e) {
		
		}
		if(topTenItem){
			topTenItem.totalVote = topTenItem.totalVote + 1
			if(topTenItem.save(flush:true)){
				def topTen = TopTenItem.executeQuery("select TT from TopTenItem as TTI inner join TTI.topTen as TT where TTI=:topTenItem",[topTenItem:topTenItem,max:1])
				if(topTen){
					topTen[0].totalVote = topTen[0].totalVote + 1
					topTen[0].totalScore = topTen[0].totalScore + 1
					if(topTen[0].save(flush:true)){
						render "yes"
						return
					}
					else{
						render "nodata"
						return
					}
				}
				render "nodata"
				return
			}
			else{
				render "nodata"
				return
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def likeTTIOpinion(){
		def user = springSecurityService.currentUser
		def topTenOpinion
		try {
			topTenOpinion = TopTenOpinion.get(Integer.parseInt(request.getParameter("lkItOmId")))
		} catch (Exception e) {
		
		}
		if(topTenOpinion){
			def type = request.getParameter("lkIOType")
			if(type.equals("up")){
				topTenOpinion.totalLike = topTenOpinion.totalLike + 1
			}
			else if(topTenOpinion.totalLike > 0){
				topTenOpinion.totalLike = topTenOpinion.totalLike - 1
			}
			if(topTenOpinion.save(flush:true)){
				render topTenOpinion.totalLike
			}
			else{
				render topTenOpinion.totalLike
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def likeArticleComment(){
		def user = springSecurityService.currentUser
		def newsArticleComment
		try {
			newsArticleComment = ArticleComment.get(Integer.parseInt(request.getParameter("articleCommentId")))
		} catch (Exception e) {
		
		}
		if(newsArticleComment){
			newsArticleComment.totalLike = newsArticleComment.totalLike + 1
			if(newsArticleComment.save(flush:true)){
				render newsArticleComment.totalLike
			}
			else{
				render newsArticleComment.totalLike
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def submitQuoteComment(){
		def user = springSecurityService.currentUser
		def quote
		def quoteComment
		def commentOwner
		Random random = new Random()
		def author
		def adminSize
		def adminUsers
		if(user && user.isAdmin){
			adminUsers = User.executeQuery("from User as U where U.enabled=true and U.isAdmin=true")
			adminSize = adminUsers.size()
			author = adminUsers[random.nextInt(adminSize)]
		}
		else{
			author = user
		}
		try {
			quote = Quote.get(Integer.parseInt(request.getParameter("qutCmt_id")))
			quoteComment = request.getParameter("comment")
		} catch (Exception e) {
		
		}
		if(quote && quoteComment){
			if(quoteComment.length() > 450)
				quoteComment = quoteComment.substring(0,450)
			quoteComment = quoteComment.replaceAll("#", "")
			if(user)
				commentOwner = author
			else
				commentOwner = User.findByUsername("guest")
			def newComment = new QuoteComment(comment:quoteComment,commentOwner:commentOwner)
			quote.totalComment = quote.totalComment + 1
			quote.addToQuoteComments(newComment)
			if(quote.save(flush:true)){
				def newsArtcle = NewsArticle.get(quote.postId)
				if(newsArtcle){
					def articleComment = new ArticleComment(comment:quoteComment,newsArticle:newsArtcle,commentOwner:commentOwner)
					if(articleComment.save(flush:true)){
						newsArtcle.totalComment = newsArtcle.totalComment + 1
						newsArtcle.save(flush:true)
					}
				}
				SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				def now = new Date()
				def nowDateTime = sdfDate.format(now)
				[newComment:newComment,commentOwner:commentOwner,nowDateTime:nowDateTime]
			}
			else{
				render "nodata"
				return
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def likePoll(){
		def user = springSecurityService.currentUser
		def poll
		def pollItem
		try {
			poll = Poll.get(Integer.parseInt(request.getParameter("poll_id")))
			pollItem = PollItem.get(Integer.parseInt(request.getParameter("lkPollIid")))
		} catch (Exception e) {
		
		}
		if(poll && pollItem){
			pollItem.totalVote = pollItem.totalVote + 1
			if(pollItem.save(flush:true)){
				poll.totalLike = poll.totalLike + 1
				poll.totalScore = poll.totalScore + 1
				poll.save(flush:true)
				render "yes"
			}
			else{
				render "nodata"
				return
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def pollItemOpinion(){
		def user = springSecurityService.currentUser
		def poll
		def pollItem
		def pollItemOpn
		def pollItemOpnUser
		Random random = new Random()
		def author
		def adminSize
		def adminUsers
		if(user && user.isAdmin){
			adminUsers = User.executeQuery("from User as U where U.enabled=true and U.isAdmin=true")
			adminSize = adminUsers.size()
			author = adminUsers[random.nextInt(adminSize)]
		}
		else{
			author = user
		}
		try {
			poll = Poll.get(Integer.parseInt(request.getParameter("oPollId")))
			pollItem = PollItem.get(Integer.parseInt(request.getParameter("oPollItemId")))
			pollItemOpn = request.getParameter("opinion")
		} catch (Exception e) {
		
		}
		if(poll && pollItem && pollItemOpn){
			if(pollItemOpn.length() > 450)
				pollItemOpn = pollItemOpn.substring(0,450)
			pollItemOpn = pollItemOpn.replaceAll("#", "")
			if(user)
				pollItemOpnUser = author
			else
				pollItemOpnUser = User.findByUsername("guest")
			def newPollItemOpinion = new PollItemOpinion(opinion:pollItemOpn,opinionOwner:pollItemOpnUser,pollItem:pollItem)
			if(newPollItemOpinion.save(flush:true)){
				pollItem.totalOpinion = pollItem.totalOpinion + 1
				pollItem.save(flush:true)
				poll.totalScore = poll.totalScore + 1
				poll.save(flush:true)
				def newsArtcle = NewsArticle.get(poll.postId)
				if(newsArtcle){
					def articleComment = new ArticleComment(comment:pollItemOpn,newsArticle:newsArtcle,commentOwner:pollItemOpnUser)
					if(articleComment.save(flush:true)){
						newsArtcle.totalComment = newsArtcle.totalComment + 1
						newsArtcle.save(flush:true)
					}
				}
				SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				def now = new Date()
				def nowDateTime = sdfDate.format(now)
				[newPollItemOpinion:newPollItemOpinion,pollItemOpnUser:pollItemOpnUser,nowDateTime:nowDateTime]
			}
			else{
				render "nodata"
				return
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def loadComments(){
		def user = springSecurityService.currentUser
		def newsArticle
		try {
			newsArticle = NewsArticle.get(Integer.parseInt(request.getParameter("comArticle_id")))
		} catch (Exception e) {
		
		}
		if(newsArticle){
			def articleComments = NewsArticle.executeQuery("select NAC,NACU from NewsArticle as NA inner join NA.articleComments as NAC inner join NAC.commentOwner as NACU where NA=:newsArticle and NAC.enabled=true order by NAC.dateCreated desc",[newsArticle:newsArticle,max:20])
			[articleComments:articleComments]
		}
		else{
			render "nodata"
			return
		}
	}
	
	def loadMoreToptenz(){
		def user = springSecurityService.currentUser
		def newsArticle
		def lastFeedDate = request.getParameter("lastFeedDate")
		def lastToptenDate
		try{
			lastToptenDate = new Date().parse("yyyy-M-d H:m:s", lastFeedDate)
		}
		catch(Exception e){
		}
		if(lastToptenDate){
			def topTenList = TopTenzService.getLatestTopTens(lastToptenDate)
			[topTenList:topTenList,user:user]
		}
		else{
			render "nodata"
			return
		}
	}
	
	def loadMorePolls(){
		def user = springSecurityService.currentUser
		def newsArticle
		def lastFeedDate = request.getParameter("lastFeedDate")
		def lastPollDate
		try{
			lastPollDate = new Date().parse("yyyy-M-d H:m:s", lastFeedDate)
		}
		catch(Exception e){
		}
		if(lastPollDate){
			def latestPolls = PollzService.getLatestPoll(lastPollDate)
			def pollItemsMap = latestPolls.groupBy({it[0]})
			[user:user,pollItemsMap:pollItemsMap]
		}
		else{
			render "nodata"
			return
		}
	}
	
	def loadMoreQuestions(){
		def user = springSecurityService.currentUser
		def newsArticle
		def lastFeedDate = request.getParameter("lastFeedDate")
		def lastQuestionDate
		try{
			lastQuestionDate = new Date().parse("yyyy-M-d H:m:s", lastFeedDate)
		}
		catch(Exception e){
		}
		if(lastQuestionDate){
			def questions = askService.getLatestQuestions(lastQuestionDate)
			[user:user,questions:questions]
		}
		else{
			render "nodata"
			return
		}
	}
	
	def loadMoreNewsSources(){
		def user = springSecurityService.currentUser
		def lastFeedId
		try{
			lastFeedId = Integer.parseInt(request.getParameter("lastFeedId"))
		}
		catch(Exception e){
		}
		if(lastFeedId > 0){
			def newsSources = NewsSourceService.getNewsSources(lastFeedId)
			if(newsSources){
				def newsSourcesMap = newsSources.groupBy({it[0]})
				[user:user,newsSourcesMap:newsSourcesMap]
			}
			else{
				render "nodata"
				return
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	def loadMoreNewsArticles(){
		def user = springSecurityService.currentUser
		def newsArticle
		def lastFeedDate = request.getParameter("lastFeedDate")
		def isNewsFeed = request.getParameter("isNewsFeed")
		def lastNewsDate
		try{
			lastNewsDate = new Date().parse("yyyy-M-d H:m:s", lastFeedDate)
		}
		catch(Exception e){
		}
		if(lastNewsDate){
			def isHome = true
			def newsArticles
			if(isNewsFeed.equals("true")){
				newsArticles = NewsService.getLatestOnlyNewsArticles(lastNewsDate)
				isHome = false
			}
			else{
				newsArticles = NewsService.getLatestNewsArticles(lastNewsDate)
			}
			[newsArticles:newsArticles,user:user,isHome:isHome]
		}
		else{
			render "nodata"
			return
		}
	}
	
	def loadMoreQuotes(){
		def user = springSecurityService.currentUser
		def newsArticle
		def lastFeedDate = request.getParameter("lastFeedDate")
		def quoteLocation = request.getParameter("quoteLocation")
		def tagAuthor = request.getParameter("tagAuthor")
		def lastNewsDate
		def quotes
		try{
			lastNewsDate = new Date().parse("yyyy-M-d H:m:s", lastFeedDate)
		}
		catch(Exception e){
		}
		if(lastNewsDate){
			if(quoteLocation.equals("quote")){
				quotes = QuoteService.getQuotes(lastNewsDate)
			}
			else if(quoteLocation.equals("hashword")){
				def quoteTag = QuoteTopic.findByTopic(tagAuthor)
				if(quoteTag)
					quotes = QuoteService.getHashwordQuotes(quoteTag,lastNewsDate)
				
			}
			else if(quoteLocation.equals("author")){
				def quoteAuthor = QuoteAuthor.findByAuthorName(tagAuthor)
				if(quoteAuthor)
					quotes = QuoteService.getAuthorQuotes(quoteAuthor,lastNewsDate)
			}			
			[quotes:quotes,user:user,quoteLocation:quoteLocation]
		}
		else{
			render "nodata"
			return
		}
	}
	
	def loadMoreProfileNewsArticles(){
		def user = springSecurityService.currentUser
		def newsArticle
		def lastFeedDate = request.getParameter("lastFeedDate")
		def pUser = request.getParameter("pUser")
		def lastNewsDate
		def profileOwner
		try{
			lastNewsDate = new Date().parse("yyyy-M-d H:m:s", lastFeedDate)
			profileOwner = User.get(Integer.parseInt(pUser))
		}
		catch(Exception e){
		}
		if(lastNewsDate && profileOwner){
			def newsArticles = NewsService.getUserNewsArticles(profileOwner,lastNewsDate)
			[newsArticles:newsArticles,user:user]
		}
		else{
			render "nodata"
			return
		}
	}
	
	def submitArticleComment(){
		def user = springSecurityService.currentUser
		def newsArticle 
		try {
			newsArticle = NewsArticle.get(Integer.parseInt(request.getParameter("article_id")))
		} catch (Exception e) {
			
		}
		
		if(newsArticle){
			def comment = request.getParameter("comment")
			def commentOwner
			Random random = new Random()
			def author
			def adminSize
			def adminUsers
			if(user && user.isAdmin){
				adminUsers = User.executeQuery("from User as U where U.enabled=true and U.isAdmin=true")
				adminSize = adminUsers.size()
				author = adminUsers[random.nextInt(adminSize)]
			}
			else{
				author = user
			}
			if(comment){
				def articleComment
				def hashWords
				def articleHashword
				if(comment.length() > 450)
					comment = comment.substring(0,450)
				comment = comment.replaceAll("#", "")
				
				if(user){
					commentOwner = author
					articleComment = new ArticleComment(comment:comment,newsArticle:newsArticle,commentOwner:commentOwner)
				}
				else{
					def guest = User.findByUsername("guest")
					commentOwner = guest
					articleComment = new ArticleComment(comment:comment,newsArticle:newsArticle,commentOwner:commentOwner)
				}
				
				if(articleComment.save(flush:true)){
					newsArticle.totalComment = newsArticle.totalComment + 1
					if(newsArticle.totalComment > 6)
						newsArticle.hasDetails = true
					newsArticle.save(flush:true)
					SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				    def now = new Date()
				    def nowDateTime = sdfDate.format(now)
					[article:newsArticle,articleComment:articleComment,commentOwner:commentOwner,nowDateTime:nowDateTime]
				}
				else{
					render "nodata"
					return
				}
			}
			else{
				render "nodata"
				return
			}
		}
		else{
			render "nodata"
			return 
		}
	}
	
	def topItemOpinion(){
		def user = springSecurityService.currentUser
		def topTenItem
		try {
			topTenItem = TopTenItem.get(Integer.parseInt(request.getParameter("tItemIdOpn")))
		} catch (Exception e) {
			
		}
		if(topTenItem){
			def topTen = TopTenItem.executeQuery("select TT from TopTenItem as TTI inner join TTI.topTen as TT where TTI=:topTenItem",[topTenItem:topTenItem,max:1])
			def opinion = request.getParameter("opinion")
			def opinionOwner
			if(opinion){
				Random random = new Random()
				def author
				def adminSize
				def adminUsers
				if(user && user.isAdmin){
					adminUsers = User.executeQuery("from User as U where U.enabled=true and U.isAdmin=true")
					adminSize = adminUsers.size()
					author = adminUsers[random.nextInt(adminSize)]
				}
				else{
					author = user
				}
				def itemOpinion
				if(opinion.length() > 450)
					opinion = opinion.substring(0,450)
				opinion = opinion.replaceAll("#", "")
				if(user){
					opinionOwner = author
					itemOpinion = new TopTenOpinion(opinion:opinion,topTenItem:topTenItem,opinionOwner:opinionOwner)
				}
				else{
					def guest = User.findByUsername("guest")
					opinionOwner = guest
					itemOpinion = new TopTenOpinion(opinion:opinion,topTenItem:topTenItem,opinionOwner:opinionOwner)
				}
				
				if(itemOpinion.save(flush:true)){
					topTenItem.totalOpinion = topTenItem.totalOpinion + 1
					topTenItem.save(flush:true)
					if(topTen){
						topTen[0].totalScore = topTen[0].totalScore + 1
						topTen[0].save(flush:true)
					}
					def newsArtcle = NewsArticle.get(topTen[0].postId)
					if(newsArtcle){
						def articleComment = new ArticleComment(comment:opinion,newsArticle:newsArtcle,commentOwner:opinionOwner)
						if(articleComment.save(flush:true)){
							newsArtcle.totalComment = newsArtcle.totalComment + 1
							newsArtcle.save(flush:true)
						}
					}
					[itemOpinion:itemOpinion]
				}
				else{
					render "nodata"
					return
				}
			}
			else{
				render "nodata"
				return
			}
		}
		else{
			render "nodata"
			return
		}
	}
	
	
}
