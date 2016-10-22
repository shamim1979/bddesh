var numImageUploaded = 0;var upcW = 0;var upcH = 0;var upcX = 0;var upcY = 0;var upiW = 0;var upiH = 0;var upiX = 0;var upiY = 0;
var maxNumImage = 5;
var isUrlFetching = false;
var isUrlAlreadyFetched = false;
var pImageUploaded = false;
var uploadedImageName = '';   
var img 
var quality = 3;
var unsharpAmount = 80;
var unsharpRadius = 0.6;
var unsharpThreshold = 2;
var imageList = [];
var qualityInfo = [
	'Box (win 0.5px)',
    'Hamming (win 1px)',
    'Lanczos (win 2px)',
    'Lanczos (win 3px)',
]
var topTenItemsLength = 3;
var contentType 
var cpTTItemId=0;
var quoteImgExt = "jpeg";
$(function(){
	$('[title]').tipsy({fade: true,trigger: 'manual', gravity: 's'});
	$("time.date").timeago();
	$(".linkingText").linker();
	$(".linkingText").removeClass('linkingText');
	if (window.File && window.FileReader && window.FileList && window.Blob) {
		var uploadImageFile = document.getElementById('uploadImageFile');
		if(uploadImageFile){
			uploadImageFile.onchange = function(){
				var files = document.getElementById('uploadImageFile').files;
		        for(var i = 0; i < files.length; i++) {
		        	var filename=files[i].name;
			        var ext= filename.substring(filename.lastIndexOf('.')+1);
			        if(ext == "jpg" || ext == "jpeg" || ext == "gif" || ext == "JPEG" || ext == "JPG" || ext == "GIF" || ext == "png" || ext == "PNG"){
			        	resizeImage(files[i],ext,contentType);			        	
			        	break;
				    }	
			        else{
			        	alert("file does not match");
				    }
		        }
			};
		}	
	}
	else{
	}
	$('.modal').on('show.bs.modal', function() {
		$(this).show();
		adjustModalHeight(this);
	});
	$(window).resize(function() {
		if ($('.modal.in').length != 0) {
			adjustModalHeight($('.modal.in'));
		}
	});
});

function adjustModalHeight(element) {
	this.$element     = $(element);  
	this.$content     = this.$element.find('.modal-content');
	var borderWidth   = this.$content.outerHeight() - this.$content.innerHeight();
	var dialogMargin  = $(window).width() < 768 ? 20 : 60;
	var contentHeight = $(window).height() - (dialogMargin + borderWidth);
	var headerHeight  = this.$element.find('.modal-header').outerHeight() || 0;
	var footerHeight  = this.$element.find('.modal-footer').outerHeight() || 0;
	var maxHeight     = contentHeight - (headerHeight + footerHeight);

	this.$content.css({
		'overflow': 'hidden'
	});
	  
	this.$element.find('.modal-body').css({
		'max-height': maxHeight,
		'overflow-y': 'auto'
	});
}

function hasUser(){
	if(isLogged == 'no'){
		window.location.replace(loginUrl);
	}
}

function submitPost(formName){
	if(isLogged == 'no'){
		window.location.replace(loginUrl);
	}
	else{
		$("#" + formName + "submit").removeClass('hidden');
		if(pImageUploaded && $("#" + formName + "ImageSubmit a").hasClass('save'))
			$("#" + formName + "ImageSubmit a.save").click();
		else
			$("#" + formName + "RegisterForm").submit();
	}
}

function submitLogin(){
	var uValid = true
	if(!$("#mContent #j_username").val()){
		$("#mContent #j_username").tipsy('show');
		uValid = false
	}
	if(!$("#mContent #j_password").val()){
		$("#mContent #j_password").tipsy('show');
		uValid = false
	}
	if(uValid)
		$("#mContent #submit").click();
}

function addPhoto(photoFormName,pcTIId){
	if(isLogged == 'no'){
		window.location.replace(loginUrl);
	}
	else{		
		contentType = photoFormName;
		cpTTItemId = pcTIId;
		$("#uploadImageFile").click();
	}
}

function addMoreItem(){
	if(isLogged == 'no'){
		window.location.replace(loginUrl);
	}
	else{
		topTenItemsLength++;
		$("#toptenItemLength").val(topTenItemsLength);
		$("#topTenList").append('<div class="cibb"><textarea rows="1" placeholder="Enter top ten Item" class="form-control cusTxtBx" id="item'+topTenItemsLength+'" name="item'+topTenItemsLength+'" autocomplete="off" original-title="Please enter top ten item"></textarea></div>');
		$("#item"+topTenItemsLength).tipsy({fade: true,trigger: 'manual', gravity: 's'});
	}
}

function validateForm(submitedFormName){
	switch(submitedFormName){				
		case 'quote':
			var valid = false;			
			valid = checkEmpty("#aquote");
			valid = checkEmpty("#quoteAuthor");
			if(!valid)
				$("#" + submitedFormName + "submit").addClass('hidden');
			return valid;
			break;
		case 'news':
			var valid = false;
			valid = checkEmpty("#articleDescription");
			if(!valid)
				$("#" + submitedFormName + "submit").addClass('hidden');
			return valid;
			break;
		case 'topten':
			var valid = false;
			valid = checkEmpty("#toptenTitle");
			valid = checkEmpty("#toptenDescription");
			for(var i=1;i<=topTenItemsLength;i++){
				valid = checkEmpty("#item"+i);
			}
			if(!valid)
				$("#" + submitedFormName + "submit").addClass('hidden');
			return valid;
			break;
		case 'poll':
			var valid = false;
			valid = checkEmpty("#pollQuestion");
			valid = checkEmpty("#positiveTitle");
			valid = checkEmpty("#oppositeTitle");
			if(!valid)
				$("#" + submitedFormName + "submit").addClass('hidden');
			return valid;
			break;
		case 'question':
			var valid = false;
			valid = checkEmpty("#questionTitle");
			if(!valid)
				$("#" + submitedFormName + "submit").addClass('hidden');
			return valid;
			break;
	}
}

function checkEmpty(eleId){
	if(!$(eleId).val()){
		$(eleId).tipsy('show');
		return false;
	}
	else{
		$(eleId).tipsy('hide');
		return true;
	}
}

function hideAllTipsy(){
	$('#articleDescription').tipsy('hide');
	for(var i=1;i<=topTenItemsLength;i++){
		$("#item"+i).tipsy('hide');
	}
	$('#toptenTitle').tipsy('hide');
	$('#toptenDescription').tipsy('hide');
	$('#pollQuestion').tipsy('hide');
	$('#positiveTitle').tipsy('hide');
	$('#oppositeTitle').tipsy('hide');
	$('#questionTitle').tipsy('hide');
}

function resizeImage(file,fileext,imgfor,iwidth) {
	var reader = new FileReader();
	reader.onloadend = function() {
		img = new Image();
		img.src = reader.result;
		img.onload = function() {
	    	updateOrig();
            updateResized(fileext,imgfor,iwidth);
	    }
	}
	reader.readAsDataURL(file);
}

function updateOrig() {
	var src, ctx;
    src = $('#src')[0];
    src.width = img.width;
    src.height = img.height;
    ctx = src.getContext("2d");
    ctx.drawImage(img, 0, 0);
}

var updateResized = _.debounce(function(ufileext,uimgfor,iwdth) {	
    var dst, ctx, width, start, time;
    if(iwdth)
    	width = iwdth;
    else
    	width = 500;
    dst = $('#dst-pica')[0];
    dst.width = width;
    dst.height = img.height * width / img.width;
    window.pica.resizeCanvas($('#src')[0], dst, {
    	quality: quality,
    	unsharpAmount: unsharpAmount,
    	unsharpRadius: unsharpRadius,
    	unsharpThreshold: unsharpThreshold,
    	transferable: true
    }, function (err) {    	
    	if(uimgfor == 'hwquote' || uimgfor == 'hwask' || uimgfor == 'hwlinkz' || uimgfor == 'hwnews' || uimgfor == 'hwpollz' || uimgfor == 'hwtoptenz'){
    		var dataURL = dst.toDataURL("image/jpeg");
    		var pWC = $("#profileCoverImage").width();
    		var pHC = $("#profileCoverImage").height();
        	var div = document.createElement('div');
    		div.innerHTML = '<img id="pCover" class="phCen" src="' + dataURL + '" />';
    		$("#profileCoverImage").html(div);
    		var pcImage = $("#profileCoverImage img").attr("src");
    		$("#profileCoverImage #pCover").cropbox({
    	        width: pWC,
    	        height: pHC
    	    }, function() {
    	    }).on('cropbox', function(e, result) {
    	    	upcW=result.cropW;
    			upcH=result.cropH;
    			upcX=result.cropX;
    			upcY=result.cropY;
    	    });
    		pImageUploaded = true;
    		uploadedImageName = '';
    		$("#pCSvbtn").html('<a class="sbbtn brd3 psbtnw" href="javascript:void(0)" onclick="javascript:saveProcessedImage(\'save\',\''+uimgfor+'\',\''+dataURL+'\',\''+ufileext+'\')">Save</a>');
    	}
    	if(uimgfor == 'topItem'){
    		var dataURL = dst.toDataURL("image/jpeg");
    		var pWC = $("#cpTTIImg"+cpTTItemId).width();
    		var pHC = $("#cpTTIImg"+cpTTItemId).height();
        	var div = document.createElement('div');
    		div.innerHTML = '<img id="pCover" class="phCen" src="' + dataURL + '" />';
    		$("#cpTTIImg"+cpTTItemId).html(div);
    		var pcImage = $("#cpTTIImg"+cpTTItemId+" img").attr("src");
    		$("#cpTTIImg"+cpTTItemId+" #pCover").cropbox({
    	        width: pWC,
    	        height: pHC
    	    }, function() {
    	    }).on('cropbox', function(e, result) {
    	    	upcW=result.cropW;
    			upcH=result.cropH;
    			upcX=result.cropX;
    			upcY=result.cropY;
    	    });
    		pImageUploaded = true;
    		uploadedImageName = '';
    		$("#TTIImgSave"+cpTTItemId).html('<a class="sbbtn brd3 psbtnw" href="javascript:void(0)" onclick="javascript:saveProcessedImage(\'save\',\''+uimgfor+'\',\''+dataURL+'\',\''+ufileext+'\')">Save</a>');
    	}
    	if(uimgfor == 'danswer' || uimgfor == 'dpoll'){
    		var dataURL = dst.toDataURL("image/jpeg");
    		var pWC = $("#pollAnsImgSave"+cpTTItemId).width();
    		var pHC = Math.round((pWC*55)/100);
        	var div = document.createElement('div');
    		div.innerHTML = '<img id="pCover" class="phCen" src="' + dataURL + '" />';
    		$("#pollAnsImgSave"+cpTTItemId).html(div);
    		var pcImage = $("#pollAnsImgSave"+cpTTItemId+" img").attr("src");
    		$("#pollAnsImgSave"+cpTTItemId+" #pCover").cropbox({
    	        width: pWC,
    	        height: pHC
    	    }, function() {
    	    }).on('cropbox', function(e, result) {
    	    	upcW=result.cropW;
    			upcH=result.cropH;
    			upcX=result.cropX;
    			upcY=result.cropY;
    	    });
    		pImageUploaded = true;
    		uploadedImageName = '';
    		$("#pollAnsImgSave"+cpTTItemId).prepend('<a class="sbbtn brd3 psbtnw" href="javascript:void(0)" onclick="javascript:saveProcessedImage(\'save\',\''+uimgfor+'\',\''+dataURL+'\',\''+ufileext+'\')">Save</a>');
    	}
    	if(uimgfor == 'pCover' || uimgfor == 'apCover'){
    		var dataURL = dst.toDataURL("image/jpeg");
    		var pWC = $("#profileCoverImage").width();
    		var pHC = $("#profileCoverImage").height();
        	var div = document.createElement('div');
    		div.innerHTML = '<img id="pCover" class="phCen" src="' + dataURL + '" />';
    		$('#profileCoverImage').html(div);
    		var pcImage = $('#profileCoverImage img').attr("src");
    		$('#profileCoverImage #pCover').cropbox({
    	        width: pWC,
    	        height: pHC
    	    }, function() {
    	    }).on('cropbox', function(e, result) {
    	    	upcW=result.cropW;
    			upcH=result.cropH;
    			upcX=result.cropX;
    			upcY=result.cropY;
    	    });
    		pImageUploaded = true;
    		uploadedImageName = '';
    		$("#pCSvbtn").html('<a class="sbbtn brd3 psbtnw" href="javascript:void(0)" onclick="javascript:saveProcessedImage(\'save\',\''+uimgfor+'\',\''+dataURL+'\',\''+ufileext+'\')">Save</a>');
    		$("#pCSvbtn").removeClass('hidden');
    	}
    	if(uimgfor == 'pProfile' || uimgfor == 'apProfile'){
    		var dataURL = dst.toDataURL("image/jpeg");
    		var pWC = $("#profileImage").width();
    		var pHC = $("#profileImage").height();
        	var div = document.createElement('div');
    		div.innerHTML = '<img id="pCover" class="phCen" src="' + dataURL + '" />';
    		$('#profileImage').html(div);
    		var pcImage = $('#profileImage img').attr("src");
    		$('#profileImage #pCover').cropbox({
    	        width: pWC,
    	        height: pHC
    	    }, function() {
    	    }).on('cropbox', function(e, result) {
    	    	upcW=result.cropW;
    			upcH=result.cropH;
    			upcX=result.cropX;
    			upcY=result.cropY;
    	    });
    		pImageUploaded = true;
    		uploadedImageName = '';
    		$("#pSvbtn").html('<a class="sbbtn brd3 psbtnw" href="javascript:void(0)" onclick="javascript:saveProcessedImage(\'save\',\''+uimgfor+'\',\''+dataURL+'\',\''+ufileext+'\')">Save</a>');
    		$("#pSvbtn").removeClass('hidden');
    	}
    	if(uimgfor == 'news'){
    		var dataURL = dst.toDataURL("image/jpeg");
    		var pWC = $("#articleTitle").width()+20;
    		var pHC = Math.round((pWC*55)/100);
        	var div = document.createElement('div');
    		div.innerHTML = '<img id="pCover" class="phCen" src="' + dataURL + '" />';
    		$('#newsImageLoad').html(div); 
    		$('#newsImageLoad').removeClass('hidden');
    		var pcImage = $('#newsImageLoad img').attr("src");
    		$('#newsImageLoad #pCover').cropbox({
    	        width: pWC,
    	        height: pHC
    	    }, function() {
    	    }).on('cropbox', function(e, result) {
    	    	upcW=result.cropW;
    			upcH=result.cropH;
    			upcX=result.cropX;
    			upcY=result.cropY;
    	    });
    		pImageUploaded = true;
    		uploadedImageName = '';
    		$("#"+uimgfor + "iload").addClass('hidden');
    		$("#"+uimgfor + "ImageSubmit").html('<a class="save" href="javascript:void(0)" onclick="javascript:saveProcessedImage(\'save\',\''+uimgfor+'\',\''+dataURL+'\',\''+ufileext+'\')">Save</a>');
    	}
    	if(uimgfor == 'topten'){
    		var dataURL = dst.toDataURL("image/jpeg");
    		var pWC = $("#toptenTitle").width()+20;
    		var pHC = Math.round((pWC*55)/100);
        	var div = document.createElement('div');
    		div.innerHTML = '<img id="pCover" class="phCen" src="' + dataURL + '" />';
    		$('#toptenImageLoad').html(div); 
    		$('#toptenImageLoad').removeClass('hidden');
    		var pcImage = $('#toptenImageLoad img').attr("src");
    		$('#toptenImageLoad #pCover').cropbox({
    	        width: pWC,
    	        height: pHC
    	    }, function() {
    	    }).on('cropbox', function(e, result) {
    	    	upcW=result.cropW;
    			upcH=result.cropH;
    			upcX=result.cropX;
    			upcY=result.cropY;
    	    });
    		pImageUploaded = true;
    		uploadedImageName = '';
    		$("#"+uimgfor + "iload").addClass('hidden');
    		$("#"+uimgfor + "ImageSubmit").html('<a class="save" href="javascript:void(0)" onclick="javascript:saveProcessedImage(\'save\',\''+uimgfor+'\',\''+dataURL+'\',\''+ufileext+'\')">Save</a>');
    	}
    	if(uimgfor == 'poll'){
    		var dataURL = dst.toDataURL("image/jpeg");
    		var pWC = $("#pollQuestion").width()+20;
    		var pHC = Math.round((pWC*55)/100);
        	var div = document.createElement('div');
    		div.innerHTML = '<img id="pCover" class="phCen" src="' + dataURL + '" />';
    		$('#pollImageLoad').html(div); 
    		$('#pollImageLoad').removeClass('hidden');
    		var pcImage = $('#pollImageLoad img').attr("src");
    		$('#pollImageLoad #pCover').cropbox({
    	        width: pWC,
    	        height: pHC
    	    }, function() {
    	    }).on('cropbox', function(e, result) {
    	    	upcW=result.cropW;
    			upcH=result.cropH;
    			upcX=result.cropX;
    			upcY=result.cropY;
    	    });
    		pImageUploaded = true;
    		uploadedImageName = '';
    		$("#"+uimgfor + "iload").addClass('hidden');
    		$("#"+uimgfor + "ImageSubmit").html('<a class="save" href="javascript:void(0)" onclick="javascript:saveProcessedImage(\'save\',\''+uimgfor+'\',\''+dataURL+'\',\''+ufileext+'\')">Save</a>');
    	}
    	if(uimgfor == 'question'){
    		var dataURL = dst.toDataURL("image/jpeg");
    		var pWC = $("#questionTitle").width()+20;
    		var pHC = Math.round((pWC*55)/100);
        	var div = document.createElement('div');
    		div.innerHTML = '<img id="pCover" class="phCen" src="' + dataURL + '" />';
    		$('#questionImageLoad').html(div); 
    		$('#questionImageLoad').removeClass('hidden');
    		var pcImage = $('#questionImageLoad img').attr("src");
    		$('#questionImageLoad #pCover').cropbox({
    	        width: pWC,
    	        height: pHC
    	    }, function() {
    	    }).on('cropbox', function(e, result) {
    	    	upcW=result.cropW;
    			upcH=result.cropH;
    			upcX=result.cropX;
    			upcY=result.cropY;
    	    });
    		pImageUploaded = true;
    		uploadedImageName = '';
    		$("#"+uimgfor + "iload").addClass('hidden');
    		$("#"+uimgfor + "ImageSubmit").html('<a class="save" href="javascript:void(0)" onclick="javascript:saveProcessedImage(\'save\',\''+uimgfor+'\',\''+dataURL+'\',\''+ufileext+'\')">Save</a>');
    	}
    	if(uimgfor == 'quote'){
    		quoteImgExt = ufileext;
    		quoteImageProcess();
    	}
    });
}, 100);

function changeQuoteImage(){	
	quoteImageProcess();
}
function quoteImageProcess(){
	var quoteCanvas = $('#quoteCanvas')[0];
	dst = $('#dst-pica')[0];
	quoteCanvas.width = dst.width;
	quoteCanvas.height = dst.height;
    var canvas = quoteCanvas.getContext("2d");
    canvas.globalAlpha = 0.5;
    canvas.drawImage(dst, 0, 0);
    canvas.globalAlpha = 1;
    var colors = ['#660033','#1784f4','#ccffff','#B9E7FE','#BDD2FF','#BDC0FF','#D5BDFF','#F0C6FF','#FFC6F6','#fff68f','#66cccc','#FDE1D8','#FFE5BD','#FFF8BD','#E6FFBD','#C6FFBD','#CDFADD','#D3FCF4','#cfd7df','#91e8e4','#ffccff','#FB3B34','#FCFF7C','#92FE45'];
	var text = $("#aquote").val();
	var fontSize;     		
	if(isNaN(parseInt($("#fontSize").val())))
		fontSize = 30;
	else
		fontSize = parseInt($("#fontSize").val());
	var width = parseInt(dst.width*.9);
	var sx = parseInt((dst.width*.1)/2);
	var lines = []
	var line = '';
	var lineTest = '';
	var words = text.split(' ');
	var currentY = 0;
	canvas.font = fontSize +"px solaimanLipi";    
	for(var i = 0, len = words.length; i < len; i++) {
		lineTest = line + words[i] + ' ';
		if (canvas.measureText(lineTest).width > width) {
	      	currentY = lines.length * fontSize + fontSize+15;
			lines.push({ text: line, height: currentY });
			line = words[i] + ' ';
		} 
		else{
			line = lineTest;
		}
	}
	if(line.length > 0) {
		currentY = lines.length * fontSize + fontSize+15;
	    	lines.push({ text: line.trim(), height: currentY });
	}	
	canvas.fillStyle = "#fff";
	for(var i = 0, len = lines.length; i < len; i++) {
		canvas.fillText(lines[i].text, sx-1, lines[i].height+50);
	}
	canvas.fillStyle = colors[Math.floor(Math.random() * colors.length)];
	for(var i = 0, len = lines.length; i < len; i++) {
		canvas.fillText(lines[i].text, sx, lines[i].height+50);
	}
	canvas.fillStyle = colors[Math.floor(Math.random() * colors.length)];
	for(var i = 0, len = lines.length; i < len; i++) {
		canvas.fillText(lines[i].text, sx+1, lines[i].height+50);
	}
	var authorText = $("#quoteAuthor").val();
	canvas.font = (fontSize-8) +"px solaimanLipi";
	canvas.fillText(authorText, sx, lines.length * fontSize+fontSize+70);
	canvas.fillStyle = "#fff";
	canvas.fillText(authorText, sx+1, lines.length * fontSize+fontSize+70);
	var dataURL = quoteCanvas.toDataURL("image/jpeg");
	var pWC = $("#aquote").width()+20;
	var pHC = Math.round((pWC*55)/100);
	var div = document.createElement('div');
	div.innerHTML = '<img id="pCover" class="phCen" src="' + dataURL + '" />';
	$('#quoteImageLoad').html(div); 
	$('#quoteImageLoad').removeClass('hidden');
	var pcImage = $('#quoteImageLoad img').attr("src");
	$('#quoteImageLoad #pCover').cropbox({
        width: pWC,
        height: pHC
    }, function() {
    }).on('cropbox', function(e, result) {
    	upcW=result.cropW;
		upcH=result.cropH;
		upcX=result.cropX;
		upcY=result.cropY;    			
    });
	pImageUploaded = true;
	uploadedImageName = '';
	$("#quoteiload").addClass('hidden');
	$("#quoteImageSubmit").html('<a class="save" href="javascript:void(0)" onclick="javascript:saveProcessedImage(\'save\',\'quote\',\''+dataURL+'\',\''+quoteImgExt+'\')">Save</a>');
}

function saveProcessedImage(btn,simagefor,data,ftype){
	if(simagefor == 'hwquote' || simagefor == 'hwask' || simagefor == 'hwlinkz' || simagefor == 'hwnews' || simagefor == 'hwpollz' || simagefor == 'hwtoptenz'){
		newsUrl = rootDirectoy + "ImageProcessing/hashwordCoverImageUpload";
    	upLoadImage(newsUrl,simagefor,data,ftype);
	}
	else if(simagefor == 'news' || simagefor == 'topten' || simagefor == 'poll' || simagefor == 'question'){
		newsUrl = rootDirectoy + "ImageProcessing/socialImageUpload";
    	upLoadImage(newsUrl,simagefor,data,ftype);
	}
	else if(simagefor == 'quote'){
		newsUrl = rootDirectoy + "ImageProcessing/socialQuoteImageUpload";
    	upLoadImage(newsUrl,simagefor,data,ftype);
	}	
	else if(simagefor == 'pCover' || simagefor == 'apCover'){
		$("#pCSvbtn").html('');
		newsUrl = rootDirectoy + "ImageProcessing/profileCoverImageUpload";
    	upLoadImage(newsUrl,simagefor,data,ftype);    	
	}
	else if(simagefor == 'pProfile' || simagefor == 'apProfile'){
		$("#pSvbtn").html('');
		newsUrl = rootDirectoy + "ImageProcessing/profileImageUpload";
    	upLoadImage(newsUrl,simagefor,data,ftype);
	}
	else if(simagefor == 'topItem'){
		$("#pSvbtn").html('');
		newsUrl = rootDirectoy + "ImageProcessing/topItemImageUpload";
    	upLoadImage(newsUrl,simagefor,data,ftype);
	}
	else if(simagefor == 'danswer' || simagefor == 'dpoll'){
		$("#pSvbtn").html('');
		newsUrl = rootDirectoy + "ImageProcessing/pollAnswerImageUpload";
    	upLoadImage(newsUrl,simagefor,data,ftype);
	}
}

function upLoadImage(imageUrl,upImagefor,dataURL,fileext){	
	if(upImagefor == 'quote' || upImagefor == 'news' || upImagefor == 'topten' || upImagefor == 'poll' || upImagefor == 'question'){
		imageData = {security:"sha3i3",image:dataURL,fileType:fileext,imageWidth:upcW,imageHeight:upcH,posX:upcX,posY:upcY};
	} 
	else if(upImagefor == 'pCover' || upImagefor == 'pProfile' || upImagefor == 'apCover' || upImagefor == 'apProfile'){
		imageData = {security:"sha3i3",image:dataURL,fileType:fileext,imageWidth:upcW,imageHeight:upcH,posX:upcX,posY:upcY,pUser:pUser,upImagefor:upImagefor};
	}
	else if(upImagefor == 'topItem'){
		imageData = {security:"sha3i3",image:dataURL,fileType:fileext,imageWidth:upcW,imageHeight:upcH,posX:upcX,posY:upcY,cpTTItemId:cpTTItemId};
	}
	else if(upImagefor == 'hwquote' || upImagefor == 'hwask' || upImagefor == 'hwlinkz' || upImagefor == 'hwnews' || upImagefor == 'hwpollz' || upImagefor == 'hwtoptenz'){
		imageData = {security:"sha3i3",image:dataURL,fileType:fileext,imageWidth:upcW,imageHeight:upcH,posX:upcX,posY:upcY,tag:tag,hwType:upImagefor};
	}
	else if(upImagefor == 'danswer' || upImagefor == 'dpoll'){
		imageData = {security:"sha3i3",image:dataURL,fileType:fileext,imageWidth:upcW,imageHeight:upcH,posX:upcX,posY:upcY,cpTTItemId:cpTTItemId,isPollAnswer:upImagefor};
	}
	$.ajax({
	 	type: "POST",		 	
		url: imageUrl,			 
		data: imageData,
		success: function(data) {
			if(upImagefor == 'danswer' || upImagefor == 'dpoll'){
				var imgSrc = rootDirectoy+"newsImages/d490/"+data.userId+"/"+data.imageName;
				$("#pollAnsImgSave"+cpTTItemId).html('<img class="covphCen" src="'+imgSrc+'">');
			}
			if(upImagefor == 'hwquote' || upImagefor == 'hwask' || upImagefor == 'hwlinkz' || upImagefor == 'hwnews' || upImagefor == 'hwpollz' || upImagefor == 'hwtoptenz'){
				var imgSrc = rootDirectoy+"newsImages/d690/"+data.userId+"/"+data.imageName;
				$("#profileCoverImage").html('<img class="covphCen" src="'+imgSrc+'">');
			}
			switch(upImagefor){
				case 'quote':
					uploadedImageName = data.imageName;
					var imgSrc = rootDirectoy+"newsImages/d490/"+data.userId+"/"+data.imageName;
					$("#quoteImageLoad").html('<img class="covphCen" src="'+imgSrc+'">');
					$("#quoteImageName").val(data.imageName);
					$("#quoteImageSubmit").html('');
					$("#quoteRegisterForm").submit();
					break;
				case 'news':
					uploadedImageName = data.imageName;
					var imgSrc = rootDirectoy+"newsImages/d490/"+data.userId+"/"+data.imageName;
					$("#newsImageLoad").html('<img class="covphCen" src="'+imgSrc+'">');
					$("#newsImageName").val(data.imageName);
					$("#newsImageSubmit").html('');
					$("#newsRegisterForm").submit();
					break;
				case 'topten':
					uploadedImageName = data.imageName;
					var imgSrc = rootDirectoy+"newsImages/d490/"+data.userId+"/"+data.imageName;
					$("#toptenImageLoad").html('<img class="covphCen" src="'+imgSrc+'">');
					$("#toptenImageName").val(data.imageName);
					$("#toptenImageSubmit").html('');
					$("#toptenRegisterForm").submit();
					break;
				case 'poll':
					uploadedImageName = data.imageName;
					var imgSrc = rootDirectoy+"newsImages/d490/"+data.userId+"/"+data.imageName;
					$("#pollImageLoad").html('<img class="covphCen" src="'+imgSrc+'">');
					$("#pollImageName").val(data.imageName);
					$("#pollImageSubmit").html('');
					$("#pollRegisterForm").submit();
					break;
				case 'question':
					uploadedImageName = data.imageName;
					var imgSrc = rootDirectoy+"newsImages/d490/"+data.userId+"/"+data.imageName;
					$("#questionImageLoad").html('<img class="covphCen" src="'+imgSrc+'">');
					$("#questionImageName").val(data.imageName);
					$("#questionImageSubmit").html('');
					$("#questionRegisterForm").submit();
					break;
				case 'pCover':
					var imgSrc = rootDirectoy+"newsImages/d690/"+data.userId+"/"+data.imageName;
					$("#profileCoverImage").html('<img class="covphCen" src="'+imgSrc+'">');
					break;
				case 'apCover':
					var imgSrc = rootDirectoy+"newsImages/d690/"+data.userId+"/"+data.imageName;
					$("#profileCoverImage").html('<img class="covphCen" src="'+imgSrc+'">');
					break;
				case 'pProfile':
					var imgSrc = rootDirectoy+"newsImages/d195/"+data.userId+"/"+data.imageName;
					$("#profileImage").html('<img class="covphCen" src="'+imgSrc+'">');
					break;
				case 'apProfile':
					var imgSrc = rootDirectoy+"newsImages/d195/"+data.userId+"/"+data.imageName;
					$("#profileImage").html('<img class="covphCen" src="'+imgSrc+'">');
					break;
				case 'topItem':
					var imgSrc = rootDirectoy+"newsImages/d170/"+data.userId+"/"+data.imageName;
					$("#cpTTIImg"+cpTTItemId).html('<img class="covphCen" src="'+imgSrc+'">');
					$("#TTIImgSave"+cpTTItemId).html('');
					break;
			}
		},
		error: function () {
			
		}	
 	});
}

