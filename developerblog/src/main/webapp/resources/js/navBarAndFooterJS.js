
//로그인함수
function checkUserData() {
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

//아이디 중복체크함수
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


//회원가입함수
function signUpSubmit() {
	if($("#signUpCheck").val() == "true" && $("#beforeOverlapid").val() == $("#userid").val()){
		$("#signUpUserData").submit();
	}else{
		alert("아이디중복체크를 해주세요");
		return;
	}
	
}


//로그인 enter키 이벤트함수
function loginEnter(){
	if(window.event.keyCode ==13 ){
		checkUserData();
	}
	
}