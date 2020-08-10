<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/timelineCss.css">
<link rel="stylesheet" href="/resources/css/publicCss.css">
</head>
<body> 
<jsp:include page="/WEB-INF/include/navigationBar.jsp"></jsp:include> 
<header> 
	<div class="container text-center mt-5">
		<h1 class="display-2">Timeline</h1>
		<hr class="hrsmall">  
	</div>  
		
	<div class="container text-center mt-5">
		<h3>차곡 차곡 쌓아가는 지식들</h3> 
	</div>
	<div class="container text-center mt-5">
		<h5>현재까지  ${boardCount}개의 포스트를 작성했어요</h5> 
	</div>
</header> 
<div class="container mt-5">  
	<div class="row justify-content-md-center"> 
		<div class="col-10">
			<c:set var="beforeDate" value="<%=new java.util.Date()%>"></c:set>
			<c:set var="reportToggle" value="false"></c:set>
			<c:forEach items="${boardlist}" var="boardlist">
				<c:set var="reportingDate" value="${boardlist.formatDate}"></c:set>
				<c:if test="${reportingDate != beforeDate}"> 
					<c:set var="reportToggle" value="${!reportToggle}"></c:set>
				</c:if>
				<c:choose> 
					<c:when test="${reportToggle == true }">
						<div class="timeline-box"> 
							<div class="timeline-container left">
								<div class="timeline-content">
									<a href="/boardDetails/${boardlist.bno}" class="timeline-title">${boardlist.title}</a>
									<div class="timeline-date"> 
										<fmt:formatDate value="${boardlist.reportingDate }" pattern="yyyy.MM.dd"/>
									</div>
								</div>
							</div>
						</div>
						<c:set var="beforeDate" value="${boardlist.formatDate}"></c:set>
					</c:when>
					<c:otherwise>
						<div class="timeline-box">
							<div class="timeline-container right">
								<div class="timeline-content">
									<a href="/boardDetails/${boardlist.bno}" class="timeline-title">${boardlist.title}</a>
									<div class="timeline-date"> 
										<fmt:formatDate value="${boardlist.reportingDate }" pattern="yyyy.MM.dd"/>
									</div>
								</div>
							</div>
						</div>
						<c:set var="beforeDate" value="${boardlist.formatDate}"></c:set>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</div>
	<br>
</div>










<jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>
</body>
</html>