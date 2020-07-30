<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/navBarAndFooterCss.css" />
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
					<c:choose>
						<c:when test="${user != null}">
							${user.getUserid()} 님 반갑습니다. <button type="button" onclick="alert('로그아웃 되었습니다.'); location.href='/userLogout'" >로그아웃</button>
							<c:if test="${user.getUserid() eq 'admin' }">
								<button type="button" onclick="location.href='/adminPage'">글관리</button> 
							</c:if>
						</c:when> 
						<c:otherwise>
							<button type="button" id="loginButton" data-toggle="modal" data-backdrop="false" data-target="#loginModal">로그인</button>
						</c:otherwise>
					</c:choose> 
				</div>
				<!-- loginModal -->
				<div class="modal" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalTitle" aria-hidden="true"> 
					<div class="modal-dialog">
						<div class="modal-content">
							 
							<!-- loginModal header -->  
							<div class="modal-header">
								<h4 class="modal-title" id="loginModalTitle">로그인</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							
							<!-- loginModal body --> 
							<div class="modal-body">
								<div class="container">
									<table>
										<tr>
											<td>아이디 :</td>
											<td><input type="text"  id="loginUserid"></input></td>
											<td><input type="hidden"  id="beforeOverlapid" value=""></input></td>
										</tr>
										<tr>
											<td></td><td><span id="checkId"></span><br></td>
										</tr>
										<tr>
											<td>비밀번호 :</td>
											<td><input type="password" id="loginUserpassword"></input></td>
										</tr>
										<tr>
											<td></td><td><span id="checkPassword"></span><br></td>
										</tr>
									</table>
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
					<div class="modal-dialog">
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
										<table>
											<tr>
												<td>아이디 :</td>
												<td><input type="text"  id="userid" name="userid"></input></td>
												<td><button type="button" id="idOverlapCheck">중복확인</button></td>
											</tr>
											<tr>
												<td></td><td><span id="signUpIdCheck"></span></td><td></td>
											</tr>
											<tr>
												<td>비밀번호 :</td>
												<td><input type="password" id="password" name="password"></input></td>
											</tr>
											<tr>
												<td>이메일 :</td>
												<td><input type="email" id="email" name="email"></input></td>
											</tr>
										</table>
									</div>
								</div>
								<!-- SignUpModal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-danger float-left" onclick="signUpSubmit()">회원가입</button>
									<input type="hidden" id="signUpCheck" value="false">
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>
</html>