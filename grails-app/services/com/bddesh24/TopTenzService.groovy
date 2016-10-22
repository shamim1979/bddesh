package com.bddesh24

import grails.transaction.Transactional

@Transactional
class TopTenzService {

    def getLatestTopTens(def lastNewsDate = new Date()){
		def latestTopTens = TopTen.executeQuery("select TTU,TT from TopTen as TT inner join TT.topTenOwner as TTU where TT.dateCreated<:lastNewsDate and TT.enabled=true order by TT.dateCreated desc",[lastNewsDate:lastNewsDate,max:10])		
		return latestTopTens
	}
	
	def getFeaturedTopTens(def lastNewsDate = new Date()){
		def latestTopTens = TopTen.executeQuery("from TopTen as TT  where TT.featured = true and TT.dateCreated<:lastNewsDate and TT.enabled=true  order by TT.dateCreated desc",[lastNewsDate:lastNewsDate,max:10])
		return latestTopTens
	}
	
	def getTopTenItems(def topTen){
		def topTenItems = TopTenItem.executeQuery("select TTI from TopTenItem as TTI inner join TTI.topTen as TT where TT=:topTen and TTI.enabled=true order by TTI.totalVote desc",[topTen:topTen,max:20])
		return topTenItems
	}
	
	def getTopTenItemOpinions(def topTenItem){
		def topTenItemOpinions = TopTenItem.executeQuery("select TTIO from TopTenItem as TTI inner join TTI.topTenOpinions as TTIO where TTI=:topTenItem and TTIO.enabled=true  order by TTIO.totalLike desc",[topTenItem:topTenItem,max:4])
		return topTenItemOpinions
	} 
}
