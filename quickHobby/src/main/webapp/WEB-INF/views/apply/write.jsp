<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="./img/favicon.ico">

<title>TripPeeple</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="js/chosen.jquery.js" type="text/javascript"></script>

<script src="./js/jquery.ui.widget.js"></script>

<link rel="stylesheet" href="css/chosen.css">

<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
<link rel="stylesheet" href="css/jquery.fileupload.css">

<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="//blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="//blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>

<script src="js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="js/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="js/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="js/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="js/jquery.fileupload-validate.js"></script>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Custom styles for this template -->
<link href="./css/cover.css" rel="stylesheet">

<script type="text/javascript">
$(function () {
	  $('[data-toggle="tooltip"]').tooltip({'placement': 'bottom'});
	  $(".chosen-select").chosen();
	});
</script>

<script>
$(function () {	
    'use strict';
    var url = "upload.do";
    var uploadButton = $('<button/>').addClass('btn btn-primary').prop('disabled', true).text('Processing...').on('click', function () {
    	var $this = $(this);
        var data = $this.data();
        $this.off('click').text('Abort').on('click', function () {
        	$this.remove();
            data.abort();
        });
        data.submit().always(function () {
        	$this.remove();
        });
    });
    $('#fileupload').fileupload({
        url: url,
        dataType: 'json',
        autoUpload: false,
        previewMaxWidth : 200,
        
    }).on('fileuploadadd', function (e, data) {
    	$("#files").empty();
    	data.context = $('<div/>').appendTo('#files');
        $.each(data.files, function (index, file) {
            var node = $('<p/>').append($('<span/>').text(file.name));
            if (!index) {
                node.append('<br>').append(uploadButton.clone(true).data(data));
            }
            node.appendTo(data.context);
        });
        
    }).on('fileuploadprocessalways', function (e, data) {
    	var index = data.index,
        file = data.files[index],
        node = $(data.context.children()[index]);
	    if (file.preview) {
	    	node.prepend('<br>').prepend(file.preview);
	    	$("#files").find("video").css("width", "90%");
	    }
	    if (file.error) {
	        node.append('<br>').append($('<span class="text-danger"/>').text(file.error));
	    }
	    if (index + 1 === data.files.length) {
	        data.context.find('button').text('Upload').prop('disabled', !!data.files.error);
	    }
        
    }).on('fileuploadprogressall', function (e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $('#progress .progress-bar').css(
            'width',
            progress + '%'
        );
    }).on('fileuploaddone', function (e, data) {
    	$("#upLoadDone").html("<p class='text-success'><b>Upload Done!</b></p>");
    	$("#file_name").val(data.result.fileName);
    	$("#file_size").val(data.result.fileSize);
    	$("#file_type").val(data.result.fileType);
    	$("#file_path").val(data.result.filePath);
    }).on('fileuploadfail', function (e, data) {
        $.each(data.files, function (index) {
            var error = $('<span class="text-danger"/>').text('File upload failed.');
            $(data.context.children()[index]).append('<br>').append(error);
        });
    }).prop('disabled', !$.support.fileInput).parent().addClass($.support.fileInput ? undefined : 'disabled');
});
</script>

<script type="text/javascript">
	window.onload = setMenu;
	window.onresize = setMenu;	
	function setMenu() {
		var width = window.innerWidth;
	   	var menus = document.getElementsByName("menu-by-size");
		if (width < 768) {
			menus[0].innerHTML = "My Page";
			menus[1].innerHTML = "글쓰기";
	    	menus[2].innerHTML = "팔로우관리";
			menus[3].innerHTML = "회원정보수정";
	    	menus[4].innerHTML = "로그아웃";
		} else {
			menus[0].innerHTML = "${member_id}님";
			menus[1].innerHTML = "<span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>";
			menus[2].innerHTML = "<span class='glyphicon glyphicon-user' aria-hidden='true'></span>";
			menus[3].innerHTML = "<span class='glyphicon glyphicon-cog' aria-hidden='true'></span>";
			menus[4].innerHTML = "<span class='glyphicon glyphicon-log-out' aria-hidden='true'></span>";
		}
	}
	
</script>


</head>

<body>
<!-- header -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container" >
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> <span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.do">Trip Peeple</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="myListForm.do?member_num=${sessionScope.member_num}" name="menu-by-size" data-container="body" data-toggle="tooltip" title="My Page">
							${member_id}님
						</a>
					</li>
					<li>
						<a href="writeForm.do" name="menu-by-size" data-container="body" data-toggle="tooltip" title="글쓰기">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>						
						</a>
					</li>
					<li>
						<a href="#" name="menu-by-size" data-container="body" data-toggle="tooltip" title="팔로우관리">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>						
						</a>
					</li>
					<li>
						<a href="modifyForm.do" name="menu-by-size" data-container="body" data-toggle="tooltip" title="회원정보수정">
							<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>						
						</a>
					</li>
					<li>
						<a href="logout.do" name="menu-by-size" data-container="body" data-toggle="tooltip" title="로그아웃">
							<span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>						
						</a>					
					</li>					
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>					
			</div>
			<!--/.navbar-collapse -->
		</div>
	</nav>
<!-- //header -->


<!-- content -->
	<div id="content">

		<div class="form-content">
		
		
			<div class="form-group">
				<label for="fileupload" class="col-sm-3 control-label" style="text-align: right; margin-top: 20px;">파일 업로드</label>
				<div class="col-sm-7" style="text-align: left;">
					<span class="btn btn-default fileinput-button" >
			        <i class="glyphicon glyphicon-plus"></i>
			        <span>Add files..</span>
			        <!-- The file input field used as target for the file upload widget -->
			        <input id="fileupload" type="file" name="files">
				    </span>
				    <br>
				    <br>
				    
				    <!-- The container for the uploaded files -->
				    <div id="files" class="files">
				    
				    </div>
				    
				    <!-- The global progress bar -->
				    <div id="progress" class="progress">
				        <div class="progress-bar progress-bar-striped"></div>
				    </div>
					    
				    <div id="upLoadDone" ></div>
				
				</div>					
			</div>
		
		
			<br/><br/>
			<form class="form-horizontal" action="write.do" name="form" method="post" enctype="multipart/form-data">
			
				<c:set var="member_num" value="${member_num}" scope="session" />
				<div class="form-group">
					<label for="city_num" class="col-sm-3 control-label">도시</label>
					<div class="col-sm-5" style="text-align: left;">
						<select name="city_num" data-placeholder="어디를 여행하셨나요?" class="chosen-select" tabindex="2" style="width: 90%; ">
				          	<jsp:include page="city_data.html" />
				        </select>
					</div>
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-3 control-label">글 내용</label>
					<div class="col-sm-7">
						<textarea class="form-control" rows="14" name="content"
							placeholder="내용을 입력해주세요"></textarea>
					</div>
				</div>
				

				<hr>

				<input type="hidden" name="file_name" id="file_name">
				<input type="hidden" name="file_path" id="file_path">
				<input type="hidden" name="file_size" id="file_size">
				<input type="hidden" name="file_type" id="file_type">
				
				<button type="submit" class="btn btn-default">게시하기</button>
				<button type="button" class="btn btn-default" onclick="window.history.back(-1)">취소</button>

			</form>

		</div>
		
	</div>	
<!-- //content -->


<!-- footer -->
	
	<footer>
		<p>&copy; Company 2014</p>
	</footer>
	
<!-- //footer -->
	

	
	
</body>
</html>
