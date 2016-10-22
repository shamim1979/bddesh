(function( $ ){
  $.fn.linker = function(options) {
  	
		var defaults = {
			target   : '', //blank,self,parent,top
            className : '',
            rel : ''
		};
        
		var options = $.extend(defaults, options);
		var newsRoot="/";
		
        target_string = (options.target != '') ? 'target="_'+options.target+'"' : '';
        class_string = (options.className != '') ? 'class="'+options.className+'"' : '';
        rel_string = (options.rel != '') ? 'rel="'+options.rel+'"' : '';

        $(this).each(function(){
        	var deshRoot="/";
            t = $(this).html();
        	t = t.trim();
        	t = t.replace(/&lt;br \/&gt;/g, '<br />');
			t = t.replace(/&lt;br&gt;/g, '<br />');
			t = t.replace(/(\r\n|\r|\n)/g, '<br>');
			t = t.replace(/(https\:\/\/|http:\/\/)([www\.]?)([^\s|<]+)/gi,function($1$2$3){
        		var urlData = $1$2$3;
        		var youtubeUrl='http://www.youtube.com/embed/'
        		var regExpYoutube =	/^.*(youtu.be\/|v\/|embed\/|watch\?|youtube.com\/user\/[^#]*#([^\/]*?\/)*)\??v?=?([^#\&\?]*).*/;
    			var match = urlData.match(regExpYoutube);
    			if (match && match[3]) {
    				return '<iframe width=100% height=350 src='+youtubeUrl+match[3]+'?autoplay=0&rel=0 frameborder=0 allowfullscreen></iframe>';
    			} else {
    				return '<a class="brd3 hswa" target="_blank" rel="nofollow" href="'+urlData+'" '+class_string+' '+rel_string+'>'+url_domain(urlData)+'</a>';
    			}
        	});   
			t = t.replace(/[#]+[A-Za-z0-9-_]+/g, function(u) {
				var u = u.replace("#","");
				return u.link(deshRoot+"newspaper/tagWord/"+u);
			});
            $(this).html(t);
        })
  		
  };
  
  $.fn.extend({  
		limit: function(limit,element) {			
			var interval, f;
			var self = $(this);

			$(this).focus(function(){
				interval = window.setInterval(substring,100);
			});

			$(this).blur(function(){
				clearInterval(interval);
				substring();
			});

			substringFunction = "function substring(){ var val = $(self).val();var length = val.length;if(length > limit){$(self).val($(self).val().substring(0,limit));}";
			if(typeof element != 'undefined')
				substringFunction += "if($(element).html() != limit-length){$(element).html((limit-length<=0)?'0':limit-length);}"

					substringFunction += "}";

			eval(substringFunction);
			substring();			
		}     
	});
})( jQuery );

//cookie create, read and erase
function createCookie(name,value,days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}

function eraseCookie(name) {
	createCookie(name,"",-1);
}

//functions for auto size of TextArea
(function(e){var t="hidden",n="border-box",r="lineHeight",i='<textarea tabindex="-1" style="position:absolute; top:-9999px; left:-9999px; right:auto; bottom:auto; -moz-box-sizing:content-box; -webkit-box-sizing:content-box; box-sizing:content-box; word-wrap:break-word; height:0 !important; min-height:0 !important; overflow:hidden;">',s=["fontFamily","fontSize","fontWeight","fontStyle","letterSpacing","textTransform","wordSpacing","textIndent"],o="oninput",u="onpropertychange",a=e(i)[0];a.setAttribute(o,"return"),e.isFunction(a[o])||u in a?(e(a).css(r,"99px"),e(a).css(r)==="99px"&&s.push(r),e.fn.autosize=function(r){return this.each(function(){function g(){var e,n;p||(p=!0,l.value=a.value,l.style.overflowY=a.style.overflowY,l.style.width=f.css("width"),l.scrollTop=0,l.scrollTop=9e4,e=l.scrollTop,n=t,e>h?(e=h,n="scroll"):e<c&&(e=c),a.style.overflowY=n,a.style.height=e+m+"px",setTimeout(function(){p=!1},1))}var a=this,f=e(a),l,c=f.height(),h=parseInt(f.css("maxHeight"),10),p,d=s.length,v,m=0;if(f.css("box-sizing")===n||f.css("-moz-box-sizing")===n||f.css("-webkit-box-sizing")===n)m=f.outerHeight()-f.height();if(f.data("mirror")||f.data("ismirror"))return;l=e(i).data("ismirror",!0).addClass(r||"autosizejs")[0],v=f.css("resize")==="none"?"none":"horizontal",f.data("mirror",e(l)).css({overflow:t,overflowY:t,wordWrap:"break-word",resize:v}),h=h&&h>0?h:9e4;while(d--)l.style[s[d]]=f.css(s[d]);e("body").append(l),u in a?o in a?a[o]=a.onkeyup=g:a[u]=g:a[o]=g,e(window).resize(g),f.bind("autosize",g),f.text(f.text()),g()})}):e.fn.autosize=function(){return this}})(jQuery);

function url_domain(data) {
	var a = document.createElement('a');
	a.href = data;
	return a.hostname;
}

function submitLink(){
	var linkURL = $("#cLink").val();
	if(linkURL.length > 0){
		userLinkCreate(linkURL);
		$("#cLink").val('');
	}
}

function showUserLinks(){
	if(typeof(Storage) !== "undefined") {
		$("#userLinkzList").html('');
		var bddesh24LinksArray = []
		if(localStorage.bddesh24Links){
			bddesh24LinksArray = JSON.parse(localStorage.getItem("bddesh24Links"))
			var i = 0;
			var len = bddesh24LinksArray.length;
			for (i=0;i<len;i++) {
				generateUserLink(bddesh24LinksArray[i])
			}
		}
	}	
}

function userLinkCreate(submitedLinkURLData){
	var isLink = generateUserLink(submitedLinkURLData);
	if(isLink){
		var bddesh24LinksArray = []
		if(localStorage.bddesh24Links) {
			bddesh24LinksArray = JSON.parse(localStorage.getItem("bddesh24Links"))
			bddesh24LinksArray.push(submitedLinkURLData)
			localStorage.setItem("bddesh24Links", JSON.stringify(bddesh24LinksArray));
		}
		else{
			bddesh24LinksArray.push(submitedLinkURLData)
			localStorage.setItem("bddesh24Links", JSON.stringify(bddesh24LinksArray));
		}		
	}	
}

function generateUserLink(linkURLData){
	var isLink = false;
	linkURLData.replace(/(https\:\/\/|http:\/\/)([www\.]?)([^\s|<]+)/gi,function($1$2$3){
		isLink = true;
		var urlData = $1$2$3;
		$("#userLinkzList").append('<a class="brd3 hswa clhw" target="_blank" href="'+urlData+'" class="conta"><span class="glyphicon glyphicon-link" aria-hidden="true">'+url_domain(urlData)+'</a><a href="javascript:void(0)" onclick="removeLink(\''+urlData+'\')" class="brd3 hswa">x</a>'); 
	});
	return isLink;
}

function removeLink(rUrlLink){
	var bddesh24LinksArray = []
	if(localStorage.bddesh24Links){
		bddesh24LinksArray = JSON.parse(localStorage.getItem("bddesh24Links"))
		var i = 0;
		var len = bddesh24LinksArray.length;
		for (i=0;i<len;i++) {
			if(bddesh24LinksArray[i].localeCompare(rUrlLink) == 0){
				bddesh24LinksArray.splice(i, 1)
				localStorage.setItem("bddesh24Links", JSON.stringify(bddesh24LinksArray));
				break;
			}
		}
		showUserLinks();
	}
}


