<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class="form_style"  action="${root}/board/write.do"  method="post" onsubmit="return checkForm(this)">	
		<input type="hidden" name="boardNumber" value="${boardNumber}"/>
					
		<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				<a href="${root}/board/list.do">List</a>
		</div>
			
		<div class="line">
			<label class="title">Writer</label>
			<span class="content">
				<input type="text" name="writer"/>
			</span>
		</div>
		
		<div class="line">
			<label class="title">Title</label>
			<span class="content"><input type="text" size="50" name="subject"/></span>
		</div>
		
		<div class="line" style="height:230px;">
			<label class="title" style="height:230px;">Content</label>
			<span class="content" style="height:230px;">
				<textarea rows="14" cols="58" name="content"></textarea>
			</span>
		</div>
		
		<div class="line">
			<label class="title">ReadCount</label>
			<span class="content">
				<input type="text" name="writer"/>
			</span>
		</div>
		
		<div class="line">
			<label class="title">Visible</label>
			<span class="content">
				<input type="text" name="writer"/>
			</span>
		</div>
		
		<div class="line">
			<label class="title">Recommand</label>
			<span class="content">
				<input type="text" name="writer"/>
			</span>
		</div>
		
		<div class="line" style="width:598px; border-width:2px; text-align:center;">
			<input type="submit" value="Write"/>
			<input type="reset" value="Reset"/>
			<input type="button" value="List" onclick="location.href='${root}/board/list.do'"/>
		</div>
	</form>
</body>
</html>