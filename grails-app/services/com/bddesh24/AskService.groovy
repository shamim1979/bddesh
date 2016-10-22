package com.bddesh24

import grails.transaction.Transactional

@Transactional
class AskService {

    def getLatestQuestions(def lastNewsDate = new Date()){
		def latestQuestions = Question.executeQuery("select Q,QU from Question as Q inner join Q.questionOwner as QU where Q.dateCreated<:lastNewsDate and Q.enabled=true order by Q.dateCreated desc",[lastNewsDate:lastNewsDate,max:10])		
		return latestQuestions
	} 
}
