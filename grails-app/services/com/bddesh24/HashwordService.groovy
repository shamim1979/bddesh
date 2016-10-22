package com.bddesh24

import grails.transaction.Transactional

@Transactional
class HashwordService {

    def getHashwordTopTens(def hashWord, def lastNewsDate = new Date(), def numRec=10){
		def topTens = TopTenTag.executeQuery("select TTU,TT from TopTenTag as TTHT inner join TTHT.topTens as TT inner join TT.topTenOwner as TTU where TTHT=:hashWord and TT.dateCreated<:lastNewsDate and TT.enabled=true order by TT.dateCreated desc",[hashWord:hashWord,lastNewsDate:lastNewsDate,max:numRec])
		return topTens
	}
	
	def getHashwordNewsArticles(def hashWord, def lastNewsDate = new Date(), def numRec=10){
		def newsArticles = ArticleHashWord.executeQuery("select NAU,NA from ArticleHashWord as AHT inner join AHT.newsArticles as NA inner join NA.articleOwner as NAU where AHT=:hashWord and NA.dateCreated<:lastNewsDate and NA.enabled=true order by NA.dateCreated desc",[hashWord:hashWord,lastNewsDate:lastNewsDate,max:numRec])
		return newsArticles
	}
	
	def getHashwordPolls(def hashWord, def lastNewsDate = new Date(), def numRec=12){
		def polls = PollTag.executeQuery("select P,PI from PollTag as PT inner join PT.polls as P inner join P.pollItems as PI where PT=:hashWord and P.dateCreated<:lastNewsDate and P.enabled=true order by P.dateCreated desc",[hashWord:hashWord,lastNewsDate:lastNewsDate,max:numRec])
		return polls
	}
	
	def getHashwordQuestions(def hashWord, def lastNewsDate = new Date(), def numRec=10){
		def questions = QuestionTag.executeQuery("select Q,QU from QuestionTag as QT inner join QT.questions as Q inner join Q.questionOwner as QU where QT=:hashWord and Q.dateCreated<:lastNewsDate and Q.enabled=true order by Q.dateCreated desc",[hashWord:hashWord,lastNewsDate:lastNewsDate,max:numRec])
		return questions
	}
	
	def getHashwordNewsSources(def hashWord, def lastNewsDate = new Date()){
		def newsSources = NewsSourceTag.executeQuery("select NSI from NewsSourceTag as NST inner join NST.newsSourceItems as NSI where NST=:hashWord and NSI.enabled=true order by NSI.id",[hashWord:hashWord])
		return newsSources
	}
}
