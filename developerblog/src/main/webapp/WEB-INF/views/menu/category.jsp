<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/category.css">
<link rel="stylesheet" href="/resources/css/publicCss.css">
</head>
<body>
<jsp:include page="/WEB-INF/include/navigationBar.jsp"></jsp:include>  
<header>
	<div class="container text-center mt-5">
		<h1 class="display-2">Category</h1>
		<hr class="hrsmall"> 
	</div>
		
	<div class="container text-center mt-5">
		<h3>차곡 차곡 쌓아가는 지식들</h3> 
	</div>
</header> 
<div class="container mt-5">  
	<div class="row justify-content-md-center"> 
		<div class="col-10">
			<c:forEach items="${categoryCount}" var="categoryCount" begin="0" end="${categoryCount.size() }">
				<a href="#${categoryCount.key}"><button class="btn btn-secondary">${categoryCount.key}(${categoryCount.value})</button></a>
			</c:forEach>
		<hr>
		</div>
	</div>
	<div class="row justify-content-md-center"> 
		<div class="col-10">
			<c:forEach items="${categoryCount}" var="categoryCount" begin="0" end="${categoryCount.size() }">
				<h3><a id="${categoryCount.key}">${categoryCount.key}(${categoryCount.value})</a></h3><br>
				<div class="container">
					<c:forEach items="${boardlist}" var="boardlist">
						<c:if test="${categoryCount.key == boardlist.category }">
							<a href="/boardDetails/${boardlist.bno}" class="title">${boardlist.title}</a><br> 
							<fmt:formatDate value="${boardlist.reportingDate }" pattern="yyyy.MM.dd"/><br>
						</c:if>
					</c:forEach>
				</div>
				<hr>
			</c:forEach> 
		</div>
	</div>
	<br>
</div>
<jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>
</body>
</html>