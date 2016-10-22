<g:if test="${hashwdCat.equals("ask")}">
	<g:render template="/publicFunction/questionSection" model="[user:user,questions:questions]"></g:render>
</g:if>
<g:elseif test="${hashwdCat.equals("news")}">
	<g:render template="/publicFunction/newsSection" model="[user:user,newsArticles:newsArticles,isHome:isHome]"></g:render>
</g:elseif>
<g:elseif test="${hashwdCat.equals("pollz")}">
	<g:render template="/publicFunction/pollSection" model="[user:user,pollItemsMap:pollItemsMap]"></g:render>
</g:elseif>
<g:elseif test="${hashwdCat.equals("toptenz")}">
	<g:render template="/publicFunction/topTenSection" model="[topTenList:topTens,user:user]"></g:render>
</g:elseif>