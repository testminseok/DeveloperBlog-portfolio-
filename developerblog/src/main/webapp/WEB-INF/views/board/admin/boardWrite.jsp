<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
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
	<form method="post" action="/reportWrite" name="frm"> 
		<table style="width:40%">
			<tr >
				<td><strong>작성자 :</strong></td>
				<td>
					<span>${user.getUserid()}</span>
					<input type="hidden" name="writer" value="${user.getUserid()}" readonly="readonly" />
				</td>
			</tr>
			<tr> 
				<td><strong>제목 :</strong></td><td><input type="text" class="form-control" name="title"/></td>  
			</tr>
			<tr>
				<td><strong>소제목 :</strong></td><td><input type="text" class="form-control" name="subheading"/></td>
			</tr>
			<tr>
				<td><strong>카테고리 :</strong></td> 
				<td>
					<select class="custom-select" name="category" id="category">
						<c:forEach items="${categoryDeduplication}" var="categoryDeduplication" begin="0" end="${categoryDeduplication.size() }">
							<option value="${categoryDeduplication}">${categoryDeduplication}</option>
						</c:forEach>
					</select>
				</td>
				<td>
					<input type="text" id="addCategory" value="" placeholder="카테고리 명을 입력해주세요" class="form-control" >
				</td>
				<td>
					<button class="btn btn-outline-secondary" type="button" onclick="categoryAdd()">추가</button>
				</td>
			</tr> 
		</table>
		<textarea id="summernote" name="content" wrap="hard"></textarea>   
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
	
function categoryAdd() {
	
	if($("#addCategory").val() == ""){
		alert("카테고리명을 입력해주세요");
		return;
	}
	
	$("#category").append("<option value='"+$("#addCategory").val()+"'>"+$("#addCategory").val()+"</option>");
	
}
</script>
</body>
</html>