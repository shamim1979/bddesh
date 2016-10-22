var isLikeLoading = false;
var isFeedLoading = false;
var isUrlFetching = false;
var preKeyCode = 8;
var urlFetched="no";

var delay = (function(){
	var timer = 0;
	return function(callback, ms){
		clearTimeout(timer);
	    timer = setTimeout(callback, ms);
	};
})();

function showAlreadyVotedModal(errMsg){	
	$("#errMsgCode").html(errMsg);
	$("#errMsgSec").fadeIn('fast');
	$("#errMsgSec").fadeOut(1000);
}

function urlFetching(lObj,event,isImage){
	if(((((event.keyCode || event.which)==86) || ((event.keyCode || event.which)==118))  && event.ctrlKey) || ((event.keyCode || event.which)==32)){
		delay(function(){
			var urlList = $(lObj).val().split(" ");
			for(var i=0;i<urlList.length;i++){
				var urlText = urlList[i];
				if((/(https\:\/\/|http:\/\/)([www\.]?)([^\s|<]+)/.test(urlText)) || (/([^https\:\/\/]|[^http:\/\/]|^)(www)\.([^\s|<]+)/.test(urlText))){
					if(urlFetched==urlText)
						return;
					urlFetched = urlText;
					fetchURLData(urlText,isImage);
					break;
				}
			}			
		},100);
	}
}
	
function fetchURLData(urlTxt,hasImage){
	if(!isUrlFetching){
		isUrlFetching = true;
		$("#newssubmit").removeClass('hidden');		
		var newsLoadUrl = rootDirectoy+"ImageProcessing/linkDataFetching";
		$.ajax({
			url: newsLoadUrl,
			data: {security:"sha3i3",urlLink:urlTxt,hasImage:hasImage},			  
			success: function(data) {
				$("#newssubmit").addClass('hidden');
				isUrlFetching = false;
				if(data !='bad'){
					if(hasImage=="Quote"){						
						$("#tmpContainer").html(data.URLTitle);
						$("#aquote").val($("#tmpContainer").html());
						$("#tmpContainer").html(data.urlDescription);
						$("#quoteAuthor").val($("#tmpContainer").html());
					}
					else{
						$("#tmpContainer").html(data.URLTitle);
						$("#articleTitle").val($("#tmpContainer").html());
						$("#tmpContainer").html(data.urlDescription);
						$("#articleDescription").val($("#tmpContainer").html());
						var urlData = url_domain(urlTxt);
						$("#newsLink").val('<a class="brd3 hswa" target="_blank" rel="nofollow" href="'+urlTxt+'">'+urlData+'</a>');
						if(data.urlImage!=='no'){
				    		uploadedImageName = data.urlImage;
							var imgSrc = rootDirectoy+"newsImages/d490/"+data.userId+"/"+uploadedImageName;
							$("#newsImageLoad").html('<img class="covphCen" src="'+imgSrc+'">');
							$("#newsImageLoad").removeClass('hidden');
							$("#newsImageName").val(uploadedImageName);
						}
					}					
				}
			},
			error: function(){									
	        }
		});
	}
}

function submitNewItem(niTTid){	
	if(isLogged == 'no'){
		window.location.replace(loginUrl);
		return;
	}
	var item = $("#newTopTenItem").val();
	if(item && !isUrlFetching){
		isUrlFetching = true;
		$("#itSubmit").removeClass('hidden');
		var newsLoadUrl = rootDirectoy+"PublicFunction/submitNewTopTenItem";
		$.ajax({
			url: newsLoadUrl,
			data: {security:"sha3i3",niTTid:niTTid,item:item},			  
			success: function(data) {
				$("#itSubmit").addClass('hidden');
				isUrlFetching = false;
				if(data!='nodata'){	
					$("#newTopTenItem").val('');
					$("#ttiList").append(data);
					window.scrollTo(0,document.body.scrollHeight);
				}
			},
			error: function(){									
	        }
		});
	}
}

function likeNewsSource(NSrcId){	
	if(!isLikeLoading){	
		var yesVoted = readCookie("nslk_"+NSrcId);
		if(yesVoted==='liked'){
			showAlreadyVotedModal('You already liked this linkz source');
		}
		else{			
			isLikeLoading = true;
			var curLike = $("#nslike"+NSrcId+" span.cmlld").html();
			$("#nslike"+NSrcId+" span.cmlld").html($("#lloading").html());
			var newsLikeUrl = rootDirectoy+"PublicFunction/likeNewsSource";
			$.ajax({
				url: newsLikeUrl,
				data: {security:"sha3i3",NSrcId:NSrcId},			  
				success: function(data) {
					isLikeLoading = false;
					if(data=="nodata"){
						$("#nslike"+NSrcId+" span.cmlld").html(curLike);
					}
					else{
						$("#nslike"+NSrcId+" span.cmlld").html(data);
						createCookie("nslk_"+NSrcId,'liked',30);
					}
				},
				error: function () {
					isLikeLoading = false;
		        }
		  	});
		}				
	}
}

function likeQuote(lkQuoteId){	
	if(!isLikeLoading){	
		var yesVoted = readCookie("qulk_"+lkQuoteId);
		if(yesVoted==='liked'){
			showAlreadyVotedModal('You already liked this quote');
		}
		else{			
			isLikeLoading = true;
			var curLike = $("#quLike"+lkQuoteId+" span.cmlld").html();
			$("#quLike"+lkQuoteId+" span.cmlld").html($("#lloading").html());
			var newsLikeUrl = rootDirectoy+"PublicFunction/likedQuote";
			$.ajax({
				url: newsLikeUrl,
				data: {security:"sha3i3",lkQuoteId:lkQuoteId},			  
				success: function(data) {
					isLikeLoading = false;
					if(data=="nodata"){
						$("#quLike"+lkQuoteId+" span.cmlld").html(curLike);
					}
					else{
						$("#quLike"+lkQuoteId+" span.cmlld").html(data);
						createCookie("qulk_"+lkQuoteId,'liked',30);
					}
				},
				error: function () {
					isLikeLoading = false;
		        }
		  	});
		}				
	}
}

function likeQuoteComment(lkQuoteCmtId){	
	if(!isLikeLoading){	
		var yesVoted = readCookie("quCmtlk_"+lkQuoteCmtId);
		if(yesVoted==='liked'){
			showAlreadyVotedModal('You already liked this quote comment');
		}
		else{			
			isLikeLoading = true;
			var curLike = $("#quCmtLike"+lkQuoteCmtId+" span.cmlld").html();
			$("#quCmtLike"+lkQuoteCmtId+" span.cmlld").html($("#lloading").html());
			var newsLikeUrl = rootDirectoy+"PublicFunction/likeQuoteComment";
			$.ajax({
				url: newsLikeUrl,
				data: {security:"sha3i3",lkQuoteCmtId:lkQuoteCmtId},			  
				success: function(data) {
					isLikeLoading = false;
					if(data=="nodata"){
						$("#quCmtLike"+lkQuoteCmtId+" span.cmlld").html(curLike);
					}
					else{
						$("#quCmtLike"+lkQuoteCmtId+" span.cmlld").html(data);
						createCookie("quCmtlk_"+lkQuoteCmtId,'liked',30);
					}
				},
				error: function () {
					isLikeLoading = false;
		        }
		  	});
		}				
	}
}

function loadMoreHashNews(cathashwd){	
	if(!isFeedLoading && lastFeedDate){				
		isFeedLoading = true;
		$("#feedMoreLoader").removeClass('hidden');
		var newsLoadUrl = rootDirectoy+"PublicFunction/loadMoreHashNews";
		$.ajax({
			url: newsLoadUrl,
			data: {security:"sha3i3",cathashwd:cathashwd,tag:tag,lastFeedDate:lastFeedDate},			  
			success: function(data) {
				$("#feedMoreLoader").addClass('hidden');
				isFeedLoading = false;
				if(data !='nodata'){
					$("#tmpContainer").html(data);
					$("#hashFeedList").append($("#tmpContainer").html());	
					$(".linkingText").linker();
					$(".linkingText").removeClass('linkingText');
					$("time.date").timeago();
				}
			},
			error: function () {
				lastFeedDate = '';
				isFeedLoading = false;
				$("#feedMoreLoader").addClass('hidden');
	        }
	  	});		
	}
}

function likeNewsSourceItem(NSItmId){	
	if(!isLikeLoading){	
		var yesVoted = readCookie("nsilk_"+NSItmId);
		if(yesVoted==='liked'){
			showAlreadyVotedModal('You already liked this linkz source');
		}
		else{			
			isLikeLoading = true;
			var curLike = $("#nsilike"+NSItmId+" span.cmlld").html();
			$("#nsilike"+NSItmId+" span.cmlld").html($("#lloading").html());
			var newsLikeUrl = rootDirectoy+"PublicFunction/likeNewsSourceItem";
			$.ajax({
				url: newsLikeUrl,
				data: {security:"sha3i3",NSItmId:NSItmId},			  
				success: function(data) {
					isLikeLoading = false;
					if(data=="nodata"){
						$("#nsilike"+NSItmId+" span.cmlld").html(curLike);
					}
					else{
						$("#nsilike"+NSItmId+" span.cmlld").html(data);
						createCookie("nsilk_"+NSItmId,'liked',30);
					}
				},
				error: function () {
					isLikeLoading = false;
		        }
		  	});
		}				
	}
}

function enableNSC(NSrcEnId,cmtTpe){	
	if(!isLikeLoading){	
		isLikeLoading = true;
		var newsLikeUrl = rootDirectoy+"PublicFunction/enableComment";
		$.ajax({
			url: newsLikeUrl,
			data: {security:"sha3i3",NSrcEnId:NSrcEnId,cmtTpe:cmtTpe},			  
			success: function(data) {
				isLikeLoading = false;				
			},
			error: function () {
				isLikeLoading = false;
	        }
	  	});				
	}
}

function likeArticle(articleId){	
	if(!isLikeLoading){	
		var yesVoted = readCookie("arlk_"+articleId);
		if(yesVoted==='liked'){
			showAlreadyVotedModal("You have already liked this article");
		}
		else{			
			isLikeLoading = true;
			var curLike = $("#arLike"+articleId+" span.cmlld").html();
			$("#arLike"+articleId+" span.cmlld").html($("#lloading").html());
			var newsLikeUrl = rootDirectoy+"PublicFunction/likeArticle";
			$.ajax({
				url: newsLikeUrl,
				data: {security:"sha3i3",articleId:articleId},			  
				success: function(data) {
					isLikeLoading = false;
					if(data=="nodata"){
						$("#arLike"+articleId+" span.cmlld").html(curLike);
					}
					else{
						$("#arLike"+articleId+" span.cmlld").html(data);
						createCookie("arlk_"+articleId,'liked',30);
					}
				},
				error: function () {
					isLikeLoading = false;
		        }
		  	});
		}				
	}
}

function likeQuestion(qusId, qlkType){	
	if(!isLikeLoading){	
		var yesVoted = readCookie("quslk_"+qusId);
		if(yesVoted==='liked'){
			showAlreadyVotedModal('You already liked this question');
		}
		else{			
			isLikeLoading = true;
			if(qlkType=="up")
				$("#qLkU"+qusId+" span.cmlld").html($("#lloading").html());
			else
				$("#qLkD"+qusId+" span.cmlld").html($("#lloading").html());
			$("#regSubmitAns").attr("onclick","javascript:submitAnswer("+qusId+");")
			var newsLikeUrl = rootDirectoy+"PublicFunction/likeQuestion";
			$.ajax({
				url: newsLikeUrl,
				data: {security:"sha3i3",qusId:qusId,qlkType:qlkType},			  
				success: function(data) {
					isLikeLoading = false;
					if(qlkType=="up")
						$("#qLkU"+qusId+" span.cmlld").html('');
					else
						$("#qLkD"+qusId+" span.cmlld").html('');
					if(data!="nodata"){
						$("#qLkU"+qusId+" span.vNum").html(data);
						createCookie("quslk_"+qusId,'liked',30);
						var yesVoted = readCookie("qasLk_"+qusId);
						if(!yesVoted)
							$("#ansFrm"+qusId).html($("#qAnsForm").html());
					}
				},
				error: function () {
					isLikeLoading = false;
		        }
		  	});
		}				
	}
}

function submitAnswer(qusIdAns){
	var answer = $("#ansFrm"+qusIdAns+" #newAnswer").val();
	if(answer){
		var commentUrl = rootDirectoy+"PublicFunction/submitAnswer";
		$("#ansFrm"+qusIdAns+" .llod").removeClass('hidden');
		$.ajax({
		 	type: "POST",		 	
			url: commentUrl,			 
			data: {security:"sha3i3",answer:answer,qusIdAns:qusIdAns},
			success: function(data) {
				$(".topirc").html('');	
				$("#ansFrm"+qusIdAns).html('');
				if(data !='nodata'){
					createCookie("qasLk_"+qusIdAns,'liked',30);					
					$("#ansLst"+qusIdAns).prepend(data);
					$("#qShA"+qusIdAns+" .aNum").html(parseInt($("#qShA"+qusIdAns+" .aNum").html())+1);
					$(".linkingText").linker();
					$(".linkingText").removeClass('linkingText');
					$("time.date").timeago();
				}
			},
			error: function () {
				$("#ansFrm"+qusIdAns).html('');
	        }	
	  	});
	}
	else{
		
	}
}

function submitHWDescription(sHashwd){
	var hwDescription = $("#hwDescription").val();
	if(hwDescription){
		var commentUrl = rootDirectoy+"PublicFunction/submitHWDescription";
		$("#hwSubmit.llod").removeClass('hidden');
		$.ajax({
		 	type: "POST",		 	
			url: commentUrl,			 
			data: {security:"sha3i3",hwDescription:hwDescription,tag:tag,hwType:sHashwd},
			success: function(data) {
				$("#hwDescription").val('');
				$("#hwSubmit.llod").addClass('hidden');
			},
			error: function () {
	        }	
	  	});
	}
}

function showAnswer(sAnsQusId){	
	if(!isLikeLoading){
		isLikeLoading = true;
		$("#regSubmitAns").attr("onclick","javascript:submitAnswer("+sAnsQusId+");")
		$("#qShA"+sAnsQusId+" span.cmlld").html($("#lloading").html());
		var newsLikeUrl = rootDirectoy+"PublicFunction/loadAnswer";
		$.ajax({
			url: newsLikeUrl,
			data: {security:"sha3i3",sAnsQusId:sAnsQusId},			  
			success: function(data) {
				isLikeLoading = false;
				$("#qShA"+sAnsQusId+" span.cmlld").html('');
				if(data!="nodata"){
					$("#ansLst"+sAnsQusId).html(data);
					$("time.date").timeago();
					var yesVoted = readCookie("qasLk_"+sAnsQusId);
					if(!yesVoted)
						$("#ansFrm"+sAnsQusId).html($("#qAnsForm").html());
				}
			},
			error: function () {
				isLikeLoading = false;
	        }
	  	});			
	}
}

function likeAnswer(lkAnsId){	
	if(!isLikeLoading){	
		var yesVoted = readCookie("anslk_"+lkAnsId);
		if(yesVoted==='liked'){
			showAlreadyVotedModal('You already liked this answer');
		}
		else{			
			isLikeLoading = true;
			var curLike = $("#qAnsLike"+lkAnsId+" span.cmlld").html();
			$("#qAnsLike"+lkAnsId+" span.cmlld").html($("#lloading").html());
			var newsLikeUrl = rootDirectoy+"PublicFunction/likeAnswer";
			$.ajax({
				url: newsLikeUrl,
				data: {security:"sha3i3",lkAnsId:lkAnsId},			  
				success: function(data) {
					isLikeLoading = false;
					if(data=="nodata"){
						$("#qAnsLike"+lkAnsId+" span.cmlld").html(curLike);
					}
					else{
						$("#qAnsLike"+lkAnsId+" span.cmlld").html(data);
						createCookie("anslk_"+lkAnsId,'liked',30);
					}
				},
				error: function () {
					isLikeLoading = false;
		        }
		  	});
		}				
	}
}

function bestAnswer(bstAnsId){	
	if(!isLikeLoading){	
		isLikeLoading = true;
		$("#qAnsBest"+bstAnsId+" span.cmlld").html($("#lloading").html());
		var newsLikeUrl = rootDirectoy+"PublicFunction/bestAnswer";
		$.ajax({
			url: newsLikeUrl,
			data: {security:"sha3i3",bstAnsId:bstAnsId},			  
			success: function(data) {
				isLikeLoading = false;
				$("#qAnsBest"+bstAnsId+" span.cmlld").html('Best');
				$("#qAnsBest"+bstAnsId).attr("onclick","javascript:void(0);");
			},
			error: function () {
				isLikeLoading = false;
	        }
	  	});				
	}
}

function likeArticleComment(articleCommentId){	
	if(!isLikeLoading){	
		var yesVoted = readCookie("arCmtlk_"+articleCommentId);
		if(yesVoted==='liked'){
			showAlreadyVotedModal('You already liked this article comment');
		}
		else{			
			isLikeLoading = true;
			var curLike = $("#arCmtLike"+articleCommentId+" span.cmlld").html();
			$("#arCmtLike"+articleCommentId+" span.cmlld").html($("#lloading").html());
			var newsLikeUrl = rootDirectoy+"PublicFunction/likeArticleComment";
			$.ajax({
				url: newsLikeUrl,
				data: {security:"sha3i3",articleCommentId:articleCommentId},			  
				success: function(data) {
					isLikeLoading = false;
					if(data=="nodata"){
						$("#arCmtLike"+articleCommentId+" span.cmlld").html(curLike);
					}
					else{
						$("#arCmtLike"+articleCommentId+" span.cmlld").html(data);
						createCookie("arCmtlk_"+articleCommentId,'liked',30);
					}
				},
				error: function () {
					isLikeLoading = false;
		        }
		  	});
		}				
	}
}

function showArticleComments(comArticle_id){	
	var totalComments = $("#arTotalComment"+comArticle_id+" span.cmlld").html();
	$("#arTotalComment"+comArticle_id+" span.cmlld").html($("#lloading").html());
	var commentUrl = rootDirectoy+"PublicFunction/loadComments";
	$.ajax({
	 	type: "POST",		 	
		url: commentUrl,			 
		data: {security:"sha3i3",comArticle_id:comArticle_id},
		success: function(data) {			
			if(data !='nodata'){
				$("#articleComments"+comArticle_id).html(data);
				$(".linkingText").linker();
				$(".linkingText").removeClass('linkingText');
				$("time.date").timeago();
				$("#arTotalComment"+comArticle_id+" span.cmlld").html(totalComments);
			}
		},
		error: function () {
				            
        }	
  	});
}

function showNewsSourceItemComments(snsi_id){	
	var totalComments = $("#nsiShCmt"+snsi_id+" span.cmlld").html();
	$("#nsiShCmt"+snsi_id+" span.cmlld").html($("#lloading").html());
	var commentUrl = rootDirectoy+"PublicFunction/loadNewsSourceItemComments";
	$.ajax({
	 	type: "POST",		 	
		url: commentUrl,			 
		data: {security:"sha3i3",snsi_id:snsi_id},
		success: function(data) {			
			if(data !='nodata'){
				$("#nsiCmtLst"+snsi_id).html(data);
				$(".linkingText").linker();
				$(".linkingText").removeClass('linkingText');
				$("time.date").timeago();
				$("#nsiShCmt"+snsi_id+" span.cmlld").html(totalComments);
			}
		},
		error: function () {
				            
        }	
  	});
}

function submitArticleComment(article_id,obj,event){
	var commentEnable = false;
	var curKeyCode = event.keyCode;
	if(preKeyCode != 8 && curKeyCode == 13)
		commentEnable = true;
	preKeyCode = curKeyCode;
	var comment = $(obj).val().trim();
	if(commentEnable && comment){
		var commentUrl = rootDirectoy+"PublicFunction/submitArticleComment";
		$.ajax({
		 	type: "POST",		 	
			url: commentUrl,			 
			data: {security:"sha3i3",comment:comment,article_id:article_id},
			success: function(data) {
				$(obj).val('');				
				if(data !='nodata'){
					$("#articleComments"+article_id).prepend(data);
					$(".linkingText").linker();
					$(".linkingText").removeClass('linkingText');
					$("#arTotalComment"+article_id+" span.cmlld").html(parseInt($("#arTotalComment"+article_id+" span.cmlld").html()) + 1)
					$("time.date").timeago();
				}
			},
			error: function () {
					            
	        }	
	  	});
	}
}

function submitQuoteComment(qutCmt_id,obj,event){
	var commentEnable = false;
	var curKeyCode = event.keyCode;
	if(preKeyCode != 8 && curKeyCode == 13)
		commentEnable = true;
	preKeyCode = curKeyCode;
	var comment = $(obj).val().trim();
	if(commentEnable && comment){
		var commentUrl = rootDirectoy+"PublicFunction/submitQuoteComment";
		$.ajax({
		 	type: "POST",		 	
			url: commentUrl,			 
			data: {security:"sha3i3",comment:comment,qutCmt_id:qutCmt_id},
			success: function(data) {
				$(obj).val('');				
				if(data !='nodata'){
					$("#quoteComments"+qutCmt_id).prepend(data);
					$(".linkingText").linker();
					$(".linkingText").removeClass('linkingText');
					$("#quTotalComment"+qutCmt_id+" span.cmlld").html(parseInt($("#quTotalComment"+qutCmt_id+" span.cmlld").html()) + 1)
					$("time.date").timeago();
				}
			},
			error: function () {
					            
	        }	
	  	});
	}
}

function submitNSComment(nscmsb_id,obj,event){
	var commentEnable = false;
	var curKeyCode = event.keyCode;
	if(preKeyCode != 8 && curKeyCode == 13)
		commentEnable = true;
	preKeyCode = curKeyCode;
	var comment = $(obj).val().trim();
	if(commentEnable && comment){
		var commentUrl = rootDirectoy+"PublicFunction/submitNewsSourceComment";
		$.ajax({
		 	type: "POST",		 	
			url: commentUrl,			 
			data: {security:"sha3i3",comment:comment,nscmsb_id:nscmsb_id},
			success: function(data) {
				$(obj).val('');				
				if(data !='nodata'){
					$("#nsCmtLst"+nscmsb_id).prepend(data);
					$(".linkingText").linker();
					$(".linkingText").removeClass('linkingText');
					$("#nsShCmt"+nscmsb_id+" span.cmlld").html(parseInt($("#nsShCmt"+nscmsb_id+" span.cmlld").html()) + 1)
					$("time.date").timeago();
				}
			},
			error: function () {
					            
	        }	
	  	});
	}
}

function submitNSIComment(nsicmsb_id,obj,event){
	var commentEnable = false;
	var curKeyCode = event.keyCode;
	if(preKeyCode != 8 && curKeyCode == 13)
		commentEnable = true;
	preKeyCode = curKeyCode;
	var comment = $(obj).val().trim();
	if(commentEnable && comment){
		var commentUrl = rootDirectoy+"PublicFunction/submitNewsSourceItemComment";
		$.ajax({
		 	type: "POST",		 	
			url: commentUrl,			 
			data: {security:"sha3i3",comment:comment,nsicmsb_id:nsicmsb_id},
			success: function(data) {
				$(obj).val('');				
				if(data !='nodata'){
					$("#nsiCmtLst"+nsicmsb_id).prepend(data);
					$(".linkingText").linker();
					$(".linkingText").removeClass('linkingText');
					$("#nsiShCmt"+nsicmsb_id+" span.cmlld").html(parseInt($("#nsiShCmt"+nsicmsb_id+" span.cmlld").html()) + 1)
					$("time.date").timeago();
				}
			},
			error: function () {
					            
	        }	
	  	});
	}
}

function showNewsSourceComments(comNS_id){	
	var totalComments = $("#nsShCmt"+comNS_id+" span.cmlld").html();
	$("#nsShCmt"+comNS_id+" span.cmlld").html($("#lloading").html());
	var commentUrl = rootDirectoy+"PublicFunction/loadNSComments";
	$.ajax({
	 	type: "POST",		 	
		url: commentUrl,			 
		data: {security:"sha3i3",comNS_id:comNS_id},
		success: function(data) {			
			if(data !='nodata'){
				$("#nsCmtLst"+comNS_id).html(data);
				$(".linkingText").linker();
				$(".linkingText").removeClass('linkingText');
				$("time.date").timeago();
				$("#nsShCmt"+comNS_id+" span.cmlld").html(totalComments);
			}
		},
		error: function () {
			$("#nsShCmt"+comNS_id+" span.cmlld").html($("#lloading").html());
        }	
  	});
}

function shareFacebook(articleID,pageID,groupID){
	var urlLocation = "http://www.bddesh24.com";	
	var fbImage 
	var fbTitle 
	var fbDescription
	var link 
	if(articleID){
		fbImage = urlLocation + $("#fbInfo"+articleID+" .fbImage").attr("fbdata");
		fbTitle = $("#fbInfo"+articleID+" .fbTitle").attr("fbdata");
		fbDescription = $("#fbInfo"+articleID+" .fbDescription").attr("fbdata");
		link = urlLocation+$("#fbInfo"+articleID+" .fbLink").attr("fbdata");
	}
	else{		
		fbImage = $("#fbInfo .fbImage").attr("fbdata");
		fbTitle = $("#fbInfo .fbTitle").attr("fbdata");
		fbDescription = $("#fbInfo .fbDescription").attr("fbdata");
		link = $("#fbInfo .fbLink").attr("fbdata");
	}
	FB.ui({
		method:'feed',
		app_id:'1072979889379772',
		picture: fbImage,
        link: link,
        description: fbDescription,
        caption: urlLocation        
		}, 
		function(response){
			if (response && response.post_id) {
				
			}else {
				
			}
		}
	);
}

function loadMoreNewsArticles(){
	if(!isFeedLoading && lastFeedDate){				
		isFeedLoading = true;
		$("#feedMoreLoader").removeClass('hidden');
		var newsLoadUrl = rootDirectoy+"PublicFunction/loadMoreNewsArticles";
		$.ajax({
			url: newsLoadUrl,
			data: {security:"sha3i3",lastFeedDate:lastFeedDate,isNewsFeed:isNewsFeed},			  
			success: function(data) {
				$("#feedMoreLoader").addClass('hidden');
				isFeedLoading = false;
				if(data !='nodata'){
					$("#tmpContainer").html(data);
					$("#newsFeedList").append($("#tmpContainer").html());	
					$(".linkingText").linker();
					$(".linkingText").removeClass('linkingText');
					$("time.date").timeago();
				}
			},
			error: function () {
				lastFeedDate = '';
				isFeedLoading = false;
				$("#feedMoreLoader").addClass('hidden');
	        }
	  	});		
	}
}

function loadMoreQuotes(){
	if(!isFeedLoading && lastFeedDate){				
		isFeedLoading = true;
		$("#feedMoreLoader").removeClass('hidden');
		var newsLoadUrl = rootDirectoy+"PublicFunction/loadMoreQuotes";
		$.ajax({
			url: newsLoadUrl,
			data: {security:"sha3i3",lastFeedDate:lastFeedDate,quoteLocation:quoteLocation,tagAuthor:tagAuthor},			  
			success: function(data) {
				$("#feedMoreLoader").addClass('hidden');
				isFeedLoading = false;
				if(data !='nodata'){
					$("#tmpContainer").html(data);
					$("#quoteFeedList").append($("#tmpContainer").html());	
					$(".linkingText").linker();
					$(".linkingText").removeClass('linkingText');
					$("time.date").timeago();
				}
			},
			error: function () {
				lastFeedDate = '';
				isFeedLoading = false;
				$("#feedMoreLoader").addClass('hidden');
	        }
	  	});		
	}
}

function loadMoreNewsSources(){
	if(!isFeedLoading && lastFeedId){				
		isFeedLoading = true;
		$("#feedMoreLoader").removeClass('hidden');
		var newsLoadUrl = rootDirectoy+"PublicFunction/loadMoreNewsSources";
		$.ajax({
			url: newsLoadUrl,
			data: {security:"sha3i3",lastFeedId:lastFeedId},			  
			success: function(data) {
				$("#feedMoreLoader").addClass('hidden');
				if(data =='nodata'){
					lastFeedId = '';
				}
				else{
					$("#tmpContainer").html(data);
					$("#linkzFeedList").append($("#tmpContainer").html());	
					$(".linkingText").linker();
					$(".linkingText").removeClass('linkingText');
					$("time.date").timeago();
				}
				isFeedLoading = false;
			},
			error: function () {
				lastFeedId = '';
				isFeedLoading = false;
				$("#feedMoreLoader").addClass('hidden');
	        }
	  	});		
	}
}

function loadMoreProfileNewsArticles(){
	if(!isFeedLoading && lastFeedDate){				
		isFeedLoading = true;
		$("#feedMoreLoader").removeClass('hidden');
		var newsLoadUrl = rootDirectoy+"PublicFunction/loadMoreProfileNewsArticles";
		$.ajax({
			url: newsLoadUrl,
			data: {security:"sha3i3",lastFeedDate:lastFeedDate,pUser:pUser},			  
			success: function(data) {
				$("#feedMoreLoader").addClass('hidden');
				isFeedLoading = false;
				if(data !='nodata'){
					$("#tmpContainer").html(data);
					$("#newsFeedList").append($("#tmpContainer").html());	
					$(".linkingText").linker();
					$(".linkingText").removeClass('linkingText');
					$("time.date").timeago();
				}
			},
			error: function () {
				lastFeedDate = '';
				isFeedLoading = false;
				$("#feedMoreLoader").addClass('hidden');
	        }
	  	});		
	}
}

function loadMoreToptenz(){
	if(!isFeedLoading && lastFeedDate){				
		isFeedLoading = true;
		$("#feedMoreLoader").removeClass('hidden');
		var newsLoadUrl = rootDirectoy+"PublicFunction/loadMoreToptenz";
		$.ajax({
			url: newsLoadUrl,
			data: {security:"sha3i3",lastFeedDate:lastFeedDate},			  
			success: function(data) {
				$("#feedMoreLoader").addClass('hidden');
				isFeedLoading = false;
				if(data !='nodata'){
					$("#tmpContainer").html(data);
					$("#topTenFeedList").append($("#tmpContainer").html());	
					$(".linkingText").linker();
					$(".linkingText").removeClass('linkingText');
					$("time.date").timeago();
				}
			},
			error: function () {
				lastFeedDate = '';
				isFeedLoading = false;
				$("#feedMoreLoader").addClass('hidden');
	        }
	  	});		
	}
}

function loadMorePoll(){
	if(!isFeedLoading && lastFeedDate){				
		isFeedLoading = true;
		$("#feedMoreLoader").removeClass('hidden');
		var newsLoadUrl = rootDirectoy+"PublicFunction/loadMorePolls";
		$.ajax({
			url: newsLoadUrl,
			data: {security:"sha3i3",lastFeedDate:lastFeedDate},			  
			success: function(data) {
				$("#feedMoreLoader").addClass('hidden');
				isFeedLoading = false;
				if(data !='nodata'){
					$("#tmpContainer").html(data);
					$("#pollFeedList").append($("#tmpContainer").html());	
					$(".linkingText").linker();
					$(".linkingText").removeClass('linkingText');
					$("time.date").timeago();
				}
			},
			error: function () {
				lastFeedDate = '';
				isFeedLoading = false;
				$("#feedMoreLoader").addClass('hidden');
	        }
	  	});		
	}
}

function loadMoreQuestions(){
	if(!isFeedLoading && lastFeedDate){				
		isFeedLoading = true;
		$("#feedMoreLoader").removeClass('hidden');
		var newsLoadUrl = rootDirectoy+"PublicFunction/loadMoreQuestions";
		$.ajax({
			url: newsLoadUrl,
			data: {security:"sha3i3",lastFeedDate:lastFeedDate},			  
			success: function(data) {
				$("#feedMoreLoader").addClass('hidden');
				isFeedLoading = false;
				if(data !='nodata'){
					$("#tmpContainer").html(data);
					$("#questionFeedList").append($("#tmpContainer").html());	
					$(".linkingText").linker();
					$(".linkingText").removeClass('linkingText');
					$("time.date").timeago();
				}
			},
			error: function () {
				lastFeedDate = '';
				isFeedLoading = false;
				$("#feedMoreLoader").addClass('hidden');
	        }
	  	});		
	}
}

function voteShowOpinion(tItemId){
	if(!isLikeLoading){	
		var yesVoted = readCookie("tItmlk_"+tItemId);
		if(yesVoted==='liked'){
			showAlreadyVotedModal('You already voted this top ten item');
		}
		else{			
			isLikeLoading = true;
			$(".topirc").html('');
			$("#tOpinionSubmitForm").attr("onclick","javascript:submitItemOpinion("+tItemId+");")
			$("#tItemOpinion"+tItemId).html($("#itemOpinionForm").html());
			$("#tItmVLk"+tItemId+" .itemVote").addClass("hidden");
			$("#tItmVLk"+tItemId+" .itemPercent").addClass("hidden");
			$("#tItmVLk"+tItemId+" .tiLdr").removeClass("hidden");
			var newsLikeUrl = rootDirectoy+"PublicFunction/likeTopItem";
			$.ajax({
				url: newsLikeUrl,
				data: {security:"sha3i3",tItemId:tItemId},			  
				success: function(data) {
					if(data!="nodata"){
						var curTotInc = parseInt($("#tItmVLk"+tItemId+" .itemTotVote").html())+1
						$("#tItmVLk"+tItemId+" .itemTotVote").html(curTotInc);
						var ttTotVote = parseInt($("#totalTenVote").html()) + 1;
						$("#totalTenVote").html(ttTotVote);
						$(".itemTotVote").each(function(){
							var curTvote = parseInt($(this).html());
							$(this).prev('.itemPercent').html(parseInt((curTvote/ttTotVote)*100)+"%");
						});
						$(".itemVote").addClass("hidden");
						$(".itemPercent").removeClass("hidden");
						$(".tiLdr").addClass("hidden");
						createCookie("tItmlk_"+tItemId,'liked',30);
					}
					isLikeLoading = false;
				},
				error: function () {
					isLikeLoading = false;
		        }
		  	});
		}				
	}
}

function submitItemOpinion(tItemIdOpn){
	var opinion = $("#tItemOpinion"+tItemIdOpn+" #newTopTenItemOpinion").val();
	if(opinion){
		var commentUrl = rootDirectoy+"PublicFunction/topItemOpinion";
		$("#tItemOpinion"+tItemIdOpn+" .llod").removeClass('hidden');
		$.ajax({
		 	type: "POST",		 	
			url: commentUrl,			 
			data: {security:"sha3i3",opinion:opinion,tItemIdOpn:tItemIdOpn},
			success: function(data) {
				$(".topirc").html('');				
				if(data !='nodata'){
					$("#itemOpinionList"+tItemIdOpn).prepend(data);
					$(".linkingText").linker();
					$(".linkingText").removeClass('linkingText');
				}
			},
			error: function () {
				$(".topirc").html('');
	        }	
	  	});
	}
	else{
		
	}
}

function likeIOpinion(lkItOmId,lkIOType){	
	if(!isLikeLoading){	
		var yesVoted = readCookie("ttIOpnlk_"+lkItOmId);
		if(yesVoted==='liked'){
			showAlreadyVotedModal('You already liked this opinion');
		}
		else{			
			isLikeLoading = true;
			var curLike = $("#tov"+lkItOmId).html();
			$("#tov"+lkItOmId).html($("#lloading").html());
			var newsLikeUrl = rootDirectoy+"PublicFunction/likeTTIOpinion";
			$.ajax({
				url: newsLikeUrl,
				data: {security:"sha3i3",lkItOmId:lkItOmId,lkIOType:lkIOType},			  
				success: function(data) {
					isLikeLoading = false;
					if(data=="nodata"){
						$("#tov"+lkItOmId).html(curLike);
					}
					else{
						$("#tov"+lkItOmId).html(data);
						createCookie("ttIOpnlk_"+lkItOmId,'liked',30);
					}
				},
				error: function () {
					isLikeLoading = false;
		        }
		  	});
		}				
	}
}

function calPollVote(cpoll_id,cpvType,alVote){
	if(alVote=='y'){
		$("#fpvp"+cpoll_id+" .pvp").removeClass('hidden');
		$("#fovp"+cpoll_id+" .pvp").removeClass('hidden');
		$("#npvp"+cpoll_id+" .pvp").removeClass('hidden');
		$("#novp"+cpoll_id+" .pvp").removeClass('hidden');
		$("#oavt"+cpoll_id).removeClass('hidden');
		$("#pavt"+cpoll_id).removeClass('hidden');
	}
	else{
		var tpVote = parseInt($("#fpvp"+cpoll_id+" .pvc").html());
		var toVote = parseInt($("#fpvp"+cpoll_id+" .ovc").html());
		if(cpvType==1){
			tpVote++;
			$("#fpvp"+cpoll_id+" .pvc").html(tpVote);
		}
		else{
			toVote++;
			$("#fpvp"+cpoll_id+" .ovc").html(toVote);
		}
		var tVote = tpVote + toVote;
		var ppVote = parseInt((tpVote/tVote)*100);
		var opVote = parseInt((toVote/tVote)*100);
		$("#fpvp"+cpoll_id+" .pvp").html(ppVote+"%").removeClass('hidden');
		$("#fovp"+cpoll_id+" .pvp").html(opVote+"%").removeClass('hidden');
		$("#npvp"+cpoll_id+" .pvp").html(ppVote+"%").removeClass('hidden');
		$("#novp"+cpoll_id+" .pvp").html(opVote+"%").removeClass('hidden');
	}
	
}

function likePoll(poll_id,pvType,lkPollIid,pVotEnable){
	if(pvType=='0'){
		$('.nav-tabs a[href="#default'+poll_id+'"]').tab('show');
	}
	else{
		if(!isLikeLoading){
			var yesVoted = readCookie("polllk_"+poll_id);
			if(yesVoted==='liked' || pVotEnable==false){
				if(pvType=='1')
					$('.nav-tabs a[href="#positive'+poll_id+'"]').tab('show');
				else
					$('.nav-tabs a[href="#opposite'+poll_id+'"]').tab('show');
				if(pVotEnable)
					calPollVote(poll_id,pvType,'y');
			}
			else{
				if(pvType=='1')
					$('.nav-tabs a[href="#positive'+poll_id+'"]').tab('show');						
				else if(pvType=='2')
					$('.nav-tabs a[href="#opposite'+poll_id+'"]').tab('show');
				$("#po"+poll_id+""+lkPollIid).html($("#pollOpinionForm").html());
				$("#po"+poll_id+""+lkPollIid+" #pOpinionSubmitForm").attr("onclick","javascript:submitPollOpinion("+poll_id+","+lkPollIid+");");
				$("#po"+poll_id+""+lkPollIid+" #pOpinionSubmit").removeClass('hidden');
				isLikeLoading = true;
				var newsLikeUrl = rootDirectoy+"PublicFunction/likePoll";
				$.ajax({
					url: newsLikeUrl,
					data: {security:"sha3i3",poll_id:poll_id,lkPollIid:lkPollIid},			  
					success: function(data) {
						isLikeLoading = false;
						if(data=="nodata"){
						}
						else{
							$("#po"+poll_id+""+lkPollIid+" #pOpinionSubmit").addClass('hidden');							
							createCookie("polllk_"+poll_id,'liked',30);
							$("#ptVotes"+poll_id).html(parseInt($("#ptVotes"+poll_id).html())+1);
							calPollVote(poll_id,pvType,'n');
						}
					},
					error: function () {
						isLikeLoading = false;
			        }
			  	});
			}
		}
	}
}

function submitPollOpinion(oPollId,oPollItemId){
	var opinion = $("#po"+oPollId+""+oPollItemId+" #newPollOpinion").val();
	if(opinion){
		var commentUrl = rootDirectoy+"PublicFunction/pollItemOpinion";
		$("#po"+oPollId+""+oPollItemId+" #pOpinionSubmit").removeClass('hidden');
		$.ajax({
		 	type: "POST",		 	
			url: commentUrl,			 
			data: {security:"sha3i3",opinion:opinion,oPollId:oPollId,oPollItemId:oPollItemId},
			success: function(data) {
				$(".topirc").html('');				
				if(data !='nodata'){
					$("#po"+oPollId+""+oPollItemId).html('');
					$("#spo"+oPollId+""+oPollItemId).html(data);
					$(".linkingText").linker();
					$(".linkingText").removeClass('linkingText');
					$("#ptOpinions"+oPollId).html(parseInt($("#ptOpinions"+oPollId).html())+1);
					$("time.date").timeago();
				}
			},
			error: function () {
				$(".topirc").html('');
	        }	
	  	});
	}
}

function likePollOpinion(pOpinionId){	
	if(!isLikeLoading){	
		var yesVoted = readCookie("pOnlk_"+pOpinionId);
		if(yesVoted==='liked'){
			showAlreadyVotedModal('You already liked this opinion');
		}
		else{			
			isLikeLoading = true;
			var curLike = $("#pOpnLike"+pOpinionId+" span.cmlld").html();
			$("#pOpnLike"+pOpinionId+" span.cmlld").html($("#lloading").html());
			var newsLikeUrl = rootDirectoy+"PublicFunction/likePollOpinion";
			$.ajax({
				url: newsLikeUrl,
				data: {security:"sha3i3",pOpinionId:pOpinionId},			  
				success: function(data) {
					isLikeLoading = false;
					if(data=="nodata"){
						$("#pOpnLike"+pOpinionId+" span.cmlld").html(curLike);
					}
					else{
						$("#pOpnLike"+pOpinionId+" span.cmlld").html(data);
						createCookie("pOnlk_"+pOpinionId,'liked',30);
					}
				},
				error: function () {
					isLikeLoading = false;
		        }
		  	});
		}				
	}
}

