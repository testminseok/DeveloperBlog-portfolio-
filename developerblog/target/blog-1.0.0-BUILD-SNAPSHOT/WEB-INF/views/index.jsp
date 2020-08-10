<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개발자의 길</title>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- font-awesome -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/indexCss.css">
</head> 
<body> 
	<jsp:include page="/WEB-INF/include/navigationBar.jsp"></jsp:include>
	<header>
		<div class="container text-center">
			<h1 class="display-1"><strong>Hello, World!</strong></h1> 
		</div>
		
		<div class="container text-center">
			<h2>나비효과, 시작은 미약하나 끝은 창대하리라</h2> 
		</div>
	</header> 
	<!-- 10개 단위마다 페이징 -->	
	<!-- Main Content --> 
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
	 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

function checkUserData() {
	
/* 	var userId = $("#userId").val();
	var userPassword = $("#userPassword").val();
	
	if(userId == "개발자1" && userPassword == "123123")
	{
		$("#checkId").text("");
		$("#checkPassword").text("");
		$("#userId").val("");
		$("#userPassword").val("");
		$("#loginButton").contents.unwrap().wrap('<span></span>');
		$("#loginButton").text("개발자님 반갑습니다.");  
	}else{
		if(userId != "개발자1"){
			
			$("#checkId").text("아이디를 확인해주세요").css("color","red");
			
		}else {
			$("#checkId").text("");
		}
		if(userPassword != "123123"){
			$("#checkPassword").text("비밀번호를 확인해주세요").css("color","red");
		}else {
			$("#checkPassword").text("");
		}
	} */
	
	$.ajax({
		
		type:"POST",
		url:"/checkUserData",
		data:{ "userId" : $("#loginUserid").val(),
			   "userPassowrd" :$("#loginUserpassword").val()
		},
		success:function(check){
			
			if(check == "true"){
				alert("로그인성공");
				location.reload();
			}else{
				alert("아이디또는비밀번호를 확인해주세요");
			}
			
		},
		error:function(){
			alert("실패");
		}
	});
}

$("#idOverlapCheck").click(function () {
	
	if($("#userid").val().length < 4 ){
		alert("아이디는 4글자 이상입력해주세요");		
		return;
	}
	
	$.ajax({
		type:"POST",
		url:"/idOverlapCheck", 
		data:{
				"userid" : $("#userid").val()
			},
		success:function(check){
			if (check == "true") {
				$("#signUpIdCheck").text("사용하실 수 있는 아이디입니다.").css("color","green");
				$("#beforeOverlapid").val($("#userid").val());
				$("#signUpCheck").val("true");
			}else{
				$("#signUpIdCheck").text("이미 존재하는 아이디입니다").css("color","red");
				$("#signUpCheck").val("false");
			}
		},
		error:function(){
			alert($("#overlapCheck").val());
		}
	});
});

function signUpSubmit() {
	if($("#signUpCheck").val() == "true" && $("#beforeOverlapid").val() == $("#userid").val()){
		$("#signUpUserData").submit();
	}else{
		alert("아이디중복체크를 해주세요");
		return;
	}
	
}




</script>
</body>
</html>