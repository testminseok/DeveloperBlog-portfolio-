<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/include/navigationBar.jsp"></jsp:include> 
<div class="container">
	<h1 class="display-3">${boardVO.title }</h1>
	<h2 class="display-4">${boardVO.subheading }</h2>
	<h4 class="display-4"><fmt:formatDate value="${boardVO.reportingDate }" pattern="yyyy.MM.dd"/></h4>
	<br>
	<hr>
	<div id="content"></div> 
	<hr>
	<div class="float-right">
		<c:choose>
			<c:when test="${user.getUserid() eq 'admin'}">
				<button type="button" class="btn btn-primary btn-lg" onclick="location.href = '/adminPage'">글 목록</button>
				<button type="button" class="btn btn-warning btn-lg" onclick="location.href = '/moveBoardModifyPage/'+${boardVO.bno}">글수정</button>
				<button type="button" class="btn btn-danger btn-lg" onclick="deleteCheck()">글삭제</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-primary btn-lg" onclick="location.href = '/'">글 목록</button>
			</c:otherwise>
		</c:choose>
	</div>
	<form action="/boardDelete" method="post" id="deleteForm">
		<input type="hidden" name="_method" value="delete"> 
		<input type="hidden" name="bno" value="${boardVO.bno }">
	</form> 
</div>



<jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).ready(function () {
		$("#content").html('${boardVO.content}')
					 .css("font-size","30px")
					 .css("word-break","break-all");
})

function deleteCheck() {
	var result = confirm('정말로 삭제하시겠습니까?');
	if (result) {
		$("#deleteForm").submit();
	}else {
		return;
	}
	
}
		 
		 
		
</script>
</body>
</html>