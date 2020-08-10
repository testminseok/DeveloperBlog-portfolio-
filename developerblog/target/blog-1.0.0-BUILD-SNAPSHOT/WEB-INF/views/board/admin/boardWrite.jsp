<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/include/navigationBar.jsp"></jsp:include> 
<h2 class="text-center">글 작성</h2><br><br><br>

<div class="container">
	<form method="post" action="/reportWrite"> 
		<table style="width:30%">
			<tr >
				<td><strong>작성자 :</strong></td>
				<td>
					<span>${user.getUserid()}</span>
					<input type="hidden" name="writer" value="${user.getUserid()}" readonly="readonly" />
				</td>
			</tr>
			<tr> 
				<td><strong>제목 :</strong></td><td><input type="text" style="width:100%" name="title"/></td>  
			</tr>
			<tr>
				<td><strong>소제목 :</strong></td><td><input type="text" style="width:100%" class="w-50" name="subheading"/></td>
			</tr>
		</table>
		<textarea id="summernote" name="content"></textarea>   
		<button type="submit">글 등록</button>
	</form>
</div>
<jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/resources/js/summernote-ko-KR.js"></script>
<script>
$(document).ready(function() { 
	var userId = '${user.getUserid()}'; 
	 
	if(userId != "admin"){
		alert('잘못된 접근입니다.');
		location.href = '/'; 
	}
	 
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>
</body>
</html>