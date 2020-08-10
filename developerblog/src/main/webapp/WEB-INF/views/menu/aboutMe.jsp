<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<link rel="stylesheet" href="/resources/css/publicCss.css">
</head>
<body>
<jsp:include page="/WEB-INF/include/navigationBar.jsp"></jsp:include> 
<header class="mt-5">
	<div class="container text-center">
		<h1 class="display-2">About Me</h1>
		<hr class="hrsmall">
	</div>
		
	<div class="container text-center mt-5">
		<h3>No one can be perfect from the beginning, and no one knows the end.So you can start.</h3> 
	</div>
</header> 
<div class="container mt-5">  
	<div class="row justify-content-center">
		<div class="col-sm text-center"> 
			<img id="profilebox"class="profilebox" alt="시간여행자의아내" src="/resources/images/시간여행자의아내.jpg">
		</div>
	</div>
	
	<div class="row justify-content-md-center"> 
		<div class="col-10">
			<h4>Kim Minseok</h4>
			<ul>
				<li>Software Engineer</li> 
				<li>Back-end Server Developer</li>
			</ul>
			<h4>Activities</h4>
			<ul>
				<li>Email : opso_@naver.com</li> 
				<li><a href="https://github.com/testminseok">Github</a></li>
			</ul>
		</div>
	</div>
</div>	
<jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>