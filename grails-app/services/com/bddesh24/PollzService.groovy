package com.bddesh24

import grails.transaction.Transactional

@Transactional
class PollzService {

    def getLatestPoll(def lastNewsDate = new Date()){
		def polls = Poll.executeQuery("select P,PI from Poll as P inner join P.pollItems as PI where P.dateCreated<:lastNewsDate and P.enabled=true order by P.dateCreated desc",[lastNewsDate:lastNewsDate,max:20])		
		return polls
	}
	
	def getPollIOpinion(def pollItem){
		def pollOpinions = PollItemOpinion.executeQuery("select PIO,PIOU from PollItemOpinion as PIO inner join PIO.pollItem as PI inner join PIO.opinionOwner as PIOU where PI=:pollItem and PIO.enabled=true order by PIO.totalLike desc",[pollItem:pollItem,max:25])
		return pollOpinions
	}
	
}
