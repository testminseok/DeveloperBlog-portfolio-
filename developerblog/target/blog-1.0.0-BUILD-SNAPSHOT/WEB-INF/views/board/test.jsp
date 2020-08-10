<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${viewAll }

<c:forEach items="${viewAll}" var="list">
	<p>제목 : ${list.title}</p> 
	<p>소제목 : ${list.subheading}</p>
	<p>작성자 : ${list.writer}</p>
	<p>내용 : ${list.content}</p>
	<p>작성일 :<fmt:formatDate value="${list.reportingDate }" pattern="yyyy.MM.dd"/> </p>
	
</c:forEach>

</body>
</html>