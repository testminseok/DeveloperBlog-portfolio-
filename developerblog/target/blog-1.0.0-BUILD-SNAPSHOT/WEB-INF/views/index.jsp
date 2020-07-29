<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개발자의 길</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/indexCss.css">
</head> 
<body> 
	<!-- 상단 네비게이션 -->
	<nav> 
		<div class="container-fluid">
			<div class="row">
				<div class="col-sm-4"> 
					<a href="/">개발자의 길</a> 
				</div>
				<div class="col-sm-4">
					<button type="button" id="loginButton" data-toggle="modal" data-backdrop="false" data-target="#loginModal">login</button>
				</div>
				<!-- loginModal -->
				<div class="modal" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalTitle" aria-hidden="true"> 
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							 
							<!-- loginModal header -->  
							<div class="modal-header">
								<h4 class="modal-title" id="loginModalTitle">로그인</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							
							<!-- loginModal body --> 
							<div class="modal-body">
								<div class="container">
									아이디 : <input type="text"  id="userId"></input><br>
									<span id="checkId"></span><br>
									비밀번호 : <input type="password" id="userPassword"></input><br>
									<span id="checkPassword"></span>
								</div>
							</div>
							<!-- loginModal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-danger float-left" onclick="checkUserData()">로그인</button>
								<button type="button" class="btn btn-danger" data-toggle="modal" data-backdrop="false" data-target="#SignUpModal" data-dismiss="modal">회원가입</button>
							</div>
						</div>
					</div>
				</div>
				<!-- SignUpModal -->
				<div class="modal" id="SignUpModal"> 
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<!-- SignUpModal header -->  
							<div class="modal-header">
								<h4 class="modal-title">회원가입</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							
							<form id="signUpUserData" action="/signUp" method="post">
								<!-- SignUpModal body -->
								<div class="modal-body">
									<div class="container">
											아이디 : <input type="text"  id="userid"></input><br>
											<button type="button">중복확인</button>
											<span id="checkId"></span><br>
											비밀번호 : <input type="password" id="password"></input><br>
											<span id="checkPassword"></span>
											이메일 : <input type="email" id="email"></input><br>
									</div>
								</div>
								<!-- SignUpModal footer -->
								<div class="modal-footer">
									<button type="submit" class="btn btn-danger float-left" onclick="location.href= '/signUp'" >회원가입</button>
								</div>
							</form>
						</div>
					</div>
				</div>				
				
				<div class="col-sm-4 row">
					<div class="col-sm-3">
						<a href="/">Home</a>
					</div> 
					<div class="col-sm-3"> 
						<a href="/">About Me</a>
					</div>
					<div class="col-sm-3">
						<a href="/">Category</a>
					</div>
					<div class="col-sm-3">
						<a href="/">Time Line</a>
					</div>
				</div>
			</div>
		</div>
		 
	</nav>
	
	
	<header>
		<div class="container text-center">
			<h2>Hello, World!</h2>
			<h5>나비효과, 시작은 미약하나 끝은 창대하리라</h5>
		</div>
	</header>
	
	<!-- 10개 단위마다 페이징 -->	
	<!-- Main Content -->
	<div class="container">
		<article class="post-preview">
	        <a href="/post/what-is-new-in-java-14">
	            <h2 class="post-title">자바 14 버전에서는 어떤 새로운 기능이 추가됐을까?</h2>
	        </a>
	        
	            <h3 class="post-subtitle">JDK 14 버전에서는 어떤 기능이 새롭게 등장했을까? 그리고 어떤 기능이 사라졌을까?</h3>
	        
	        <p class="post-meta">Posted on June 19, 2020</p>
	        
	        <div class="blog-tags">#java  #jdk14  #openjdk</div>
	        
	    </article>
	</div> 
	
	<footer>
		<div class="container text-center">
			<ul>
				<li>
					<a href="#"><i class="fa fa-github fa-5x" aria-hidden="true"></i></a>	
				</li>
				<li>
					<a href="#"><i class="fa fa-facebook-square fa-5x" aria-hidden="true"></i></a>	
				</li>
				<li>
					<a href="#"><i class="fa fa-twitter fa-5x" aria-hidden="true"></i></a>
				</li>
				<li>
					<a href="#"><i class="fa fa-instagram fa-5x" aria-hidden="true"></i></a>	
				</li>
			</ul>
			
		</div>
	</footer>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

function checkUserData() {
	
	var userId = $("#userId").val();
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
	}
}

function signUp() {
	
	 
}


</script>
</body>
</html>