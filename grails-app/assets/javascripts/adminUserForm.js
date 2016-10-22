var numImageUploaded = 0;var upcW = 0;var upcH = 0;var upcX = 0;var upcY = 0;var upiW = 0;var upiH = 0;var upiX = 0;var upiY = 0;
var preKeyCode = 8;
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
var quotesTotalLength = 0;
var qualityInfo = [
	'Box (win 0.5px)',
    'Hamming (win 1px)',
    'Lanczos (win 2px)',
    'Lanczos (win 3px)',
]
var topTenItemsLength = 3;
var newsSourceItemsLength = 1
var contentType 
$(function(){
	$('[title]').tipsy({fade: true,trigger: 'manual', gravity: 's'});
	jQuery("time.date").timeago();
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

	
function submitQuotes(){
	if(!isUrlFetching){
		isUrlFetching = true;
		var urlTxt = $("#quoteLinkFetch").val();
		$("#quotesSubmit").removeClass('hidden');		
		var newsLoadUrl = rootDirectoy+"Admin/linkFetchQuote";
		$.ajax({
			url: newsLoadUrl,
			data: {security:"sha3i3",urlLink:urlTxt},			  
			success: function(data) {
				$("#quotesSubmit").addClass('hidden');
				isUrlFetching = false;	
				$("#qSuc").html(data);
				var qData = $("#qSuc").html();
				var qaList = qData.split(';;;');
				var len = qaList.length;
				for(var k=0;k<len;k++){
					var qaListData = qaList[k].split(';;');
					if(qaListData[0]){
						quotesTotalLength++;
						var dInput = '<div class="cibb"><textarea rows="2" placeholder="Enter Quote" class="form-control cusTxtBx" id="quote'+quotesTotalLength+'" name="quote'+quotesTotalLength+'" autocomplete="off" title="Please enter quote">'+qaListData[0]+'</textarea></div><div class="cibb"><textarea rows="1" placeholder="Enter Author " class="form-control cusTxtBx" id="quoteAuthor'+quotesTotalLength+'" name="quoteAuthor'+quotesTotalLength+'" autocomplete="off" title="Please enter quoted author name">'+qaListData[1]+'</textarea></div>';
						$("#quoteForm").append(dInput);
					}					
				}
				$("#quoteItemLength").val(quotesTotalLength);
			},
			error: function(){									
	        }
		});
	}
}

function submitLink(){
	if(!isUrlFetching){
		isUrlFetching = true;
		var urlTxt = $("#topTenLinkFetch").val();
		$("#toptenLink").removeClass('hidden');		
		var newsLoadUrl = rootDirectoy+"Admin/linkFetchTopten";
		$.ajax({
			url: newsLoadUrl,
			data: {security:"sha3i3",urlLink:urlTxt},			  
			success: function(data) {
				$("#toptenLink").addClass('hidden');
				isUrlFetching = false;	
				$("#topTenSuc").html(data);
				var qData = $("#topTenSuc").html();
				var qaList = qData.split(';;;');
				var len = qaList.length;
				for(var k=0;k<len;k++){
					var qaListData = qaList[k].split(';;');
					if(qaListData[0]){
						quotesTotalLength++;
						var dInput = '<div class="cibb"><textarea rows="2" placeholder="Enter Quote" class="form-control cusTxtBx" id="quote'+quotesTotalLength+'" name="quote'+quotesTotalLength+'" autocomplete="off" title="Please enter quote">'+qaListData[0]+'</textarea></div><div class="cibb"><textarea rows="1" placeholder="Enter Author " class="form-control cusTxtBx" id="quoteAuthor'+quotesTotalLength+'" name="quoteAuthor'+quotesTotalLength+'" autocomplete="off" title="Please enter quoted author name">'+qaListData[1]+'</textarea></div>';
						$("#quoteForm").append(dInput);
					}					
				}
				$("#quoteItemLength").val(quotesTotalLength);
			},
			error: function(){									
	        }
		});
	}
}

function submitQuotePost(){
	$("#quoteRegisterForm").submit();
}

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
	$('#myModal').modal('show')
}

function submitPost(formName){
	$("#" + formName + "submit").removeClass('hidden');
	$("#" + formName + "RegisterForm").submit();
}

function addPhoto(photoFormName){
	contentType = photoFormName
	$("#uploadImageFile").click();
}

function addMoreItem(){
	newsSourceItemsLength++;
	$("#newsSourceItemLength").val(newsSourceItemsLength);	
	$("#newsSourceList").append('<div class="cibb"><textarea rows="1" placeholder="title" class="form-control cusTxtBx" id="title'+newsSourceItemsLength+'" name="title'+newsSourceItemsLength+'" autocomplete="off" original-title="Please enter news source item title"></textarea></div><div class="cibb"><textarea rows="4" placeholder="shortDescription" class="form-control cusTxtBx" id="shortDescription'+newsSourceItemsLength+'" name="shortDescription'+newsSourceItemsLength+'" autocomplete="off" original-title="Please enter news source item short description"></textarea></div><div class="cibb"><textarea rows="15" placeholder="newsLinks" class="form-control cusTxtBx" id="newsLinks'+newsSourceItemsLength+'" name="newsLinks'+newsSourceItemsLength+'" autocomplete="off" original-title="Please enter news source item newsLinks"></textarea></div><div class="cibb"><textarea rows="1" placeholder="newsSourceTag" class="form-control cusTxtBx" id="newsSourceTag'+newsSourceItemsLength+'" name="newsSourceTag'+newsSourceItemsLength+'" autocomplete="off" original-title="Please enter news source item tag"></textarea></div>');
	$("#title"+newsSourceItemsLength).tipsy({fade: true,trigger: 'manual', gravity: 's'});
	$("#shortDescription"+newsSourceItemsLength).tipsy({fade: true,trigger: 'manual', gravity: 's'});
	$("#newsLinks"+newsSourceItemsLength).tipsy({fade: true,trigger: 'manual', gravity: 's'});
	$("#newsSourceTag"+newsSourceItemsLength).tipsy({fade: true,trigger: 'manual', gravity: 's'});
}

function validateForm(submitedFormName){
	switch(submitedFormName){				
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
		case 'newsSource':
			var valid = false;
			valid = checkEmpty("#title");
			valid = checkEmpty("#shortDescription");
			valid = checkEmpty("#newsSourceTag");
			for(var i=1;i<=newsSourceItemsLength;i++){
				valid = checkEmpty("#title"+i);
				valid = checkEmpty("#shortDescription"+i);
				valid = checkEmpty("#newsLinks"+i);
				valid = checkEmpty("#newsSourceTag"+i);
			}
			if(!valid)
				$("#" + submitedFormName + "submit").addClass('hidden');
			return valid;
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

var updateResized = _.debounce(function (ufileext,uimgfor,iwdth) {	
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
    	if(uimgfor == 'news'){
    		var dataURL = dst.toDataURL("image/jpeg");
    		var pWC = $("#articleTitle").width()+20;
    		var pHC = Math.round((pWC*60)/100);
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
    		var pHC = Math.round((pWC*60)/100);
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
    		var pHC = Math.round((pWC*60)/100);
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
    		var pHC = Math.round((pWC*60)/100);
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
    });
}, 100);

function saveProcessedImage(btn,simagefor,data,ftype){
	if(simagefor == 'news' || simagefor == 'topten' || simagefor == 'poll' || simagefor == 'question'){
		newsUrl = rootDirectoy + "ImageProcessing/socialImageUpload";
    	upLoadImage(newsUrl,simagefor,data,ftype);
	}
}

function upLoadImage(imageUrl,upImagefor,dataURL,fileext){	
	if(upImagefor == 'news' || upImagefor == 'topten' || upImagefor == 'poll' || upImagefor == 'question'){
		imageData = {security:"sha3i3",image:dataURL,fileType:fileext,imageWidth:upcW,imageHeight:upcH,posX:upcX,posY:upcY};
	} 
	$.ajax({
	 	type: "POST",		 	
		url: imageUrl,			 
		data: imageData,
		success: function(data) {
			switch(upImagefor){
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
			}
		},
		error: function () {
			
		}	
 	});
}

