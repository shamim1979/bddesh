package com.bddesh24

import grails.transaction.Transactional

@Transactional
class QuoteService {

    def getQuotes(def lastNewsDate = new Date()){
		def quotes = Quote.executeQuery("select Q,QU from Quote as Q inner join Q.quoteOwner as QU where Q.dateCreated<:lastNewsDate and Q.enabled=true order by Q.dateCreated desc",[lastNewsDate:lastNewsDate,max:10])		
		return quotes
	}
	
	def getHashwordQuotes(def hashWord, def lastNewsDate = new Date(), def numRec=10){
		def quotes = QuoteTopic.executeQuery("select QTQ,QTQU from QuoteTopic as QT inner join QT.quotes as QTQ inner join QTQ.quoteOwner as QTQU where QT=:hashWord and QTQ.dateCreated<:lastNewsDate and QTQ.enabled=true order by QTQ.dateCreated desc",[hashWord:hashWord,lastNewsDate:lastNewsDate,max:numRec])
		return quotes
	}	
	
	def getAuthorQuotes(def quoteAuthor, def lastNewsDate = new Date(), def numRec=10){
		def quotes = QuoteAuthor.executeQuery("select QAQ,QAQU from QuoteAuthor as QA inner join QA.quotes as QAQ inner join QAQ.quoteOwner as QAQU where QA=:quoteAuthor and QAQ.dateCreated<:lastNewsDate and QAQ.enabled=true order by QAQ.dateCreated desc",[quoteAuthor:quoteAuthor,lastNewsDate:lastNewsDate,max:numRec])
		return quotes
	}
	
	def getNewAuthorQuotes(def quoteAuthor, def quoteView, def numRec=6){
		def quotes = QuoteAuthor.executeQuery("select QAQ,QAQU from QuoteAuthor as QA inner join QA.quotes as QAQ inner join QAQ.quoteOwner as QAQU where QA=:quoteAuthor and QAQ.id>:quoteViewId and QAQ.enabled=true",[quoteAuthor:quoteAuthor,quoteViewId:quoteView.id,max:numRec])
		return quotes
	}
}
