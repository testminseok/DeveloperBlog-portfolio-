<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개발자의 길</title>
<link rel="stylesheet" href="/resources/css/indexCss.css">
<link rel="stylesheet" href="/resources/css/publicCss.css">
</head> 
<body> 
	<jsp:include page="/WEB-INF/include/navigationBar.jsp"></jsp:include>
	<header class="mt-5">
		<div class="container text-center">
			<h1 class="display-2">Hello, World!</h1> 
			<hr class="hrsmall">
		</div>
		
		<div class="container text-center">
			<h2>The only thing worse than starting something and failing ... is not starting something.</h2> 
		</div>
	</header> 
	
	<!-- 10개씩 보여주기 -->	
	<!-- Main Content -->
	<div class="mt-5"> 
		<c:forEach items="${reportListPart }" var="boardList">
			<div class="container" style="padding-left: 150px; padding-right: 150px;">
				<article class="main-content">
			    	<h2><a href="/boardDetails/${boardList.bno}" class="main-title">${boardList.title}</a></h2>
			        <h3 class="main-subheading">${boardList.subheading }</h3>
			        <p class="main-reportingDate"><fmt:formatDate value="${boardList.reportingDate }" pattern="yyyy.MM.dd"/></p>
			    </article>
				<hr>		
			</div>
		</c:forEach>
	</div>
	
	<!-- 페이징 -->
	<div class="container text-center"> 
		<c:choose>
			<c:when test="${nowPage == 1 }">
				<a href= "/?perPage=10&page=${nowPage}" class="main-pageNum-nowPage">${nowPage}</a>
			</c:when>
			<c:otherwise>
				<a href= "/?perPage=10&page=${1}" class="main-pageNum">${1}</a>
			</c:otherwise>
		</c:choose> 
		<span style="font-size: 30px">···</span> 
		<c:forEach begin="${nowPage-1}" end="${nowPage+1}" var="i">
			<c:choose>
				<c:when test="${i < totalReports  && i > 1}"> 
					<c:choose>
						<c:when test="${i == nowPage }">
							<a href= "/?perPage=10&page=${i}" class="main-pageNum-nowPage">${i}</a>
						</c:when>
						<c:otherwise>
							<a href= "/?perPage=10&page=${i}" class="main-pageNum">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:when>
			</c:choose>
		</c:forEach> 
		<span style="font-size: 30px">···</span>
		<c:choose>
			<c:when test="${nowPage == totalReports }">
				<a href= "/?perPage=10&page=${totalReports}" class="main-pageNum-nowPage">${totalReports}</a>
			</c:when>
			<c:otherwise>
				<a href= "/?perPage=10&page=${totalReports}" class="main-pageNum">${totalReports}</a>
			</c:otherwise>
		</c:choose>
	</div>
	<hr> 
	<jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>
</body>
</html>