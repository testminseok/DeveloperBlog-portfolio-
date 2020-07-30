<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://nhn.github.io/tui.grid/latest/dist/tui-grid.css">
</head>
<body>
<jsp:include page="/WEB-INF/include/navigationBar.jsp"></jsp:include> 
<button type="button" onclick="location.href='/boardWrite'">글쓰기</button>  
<button type="button">글수정</button>
<button type="button">글삭제</button>


   <div id="grid" class="text-center"></div>
   
   
<jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://nhn.github.io/tui.grid/latest/dist/tui-grid.js"></script>
<script type="text/javascript">

window.onload = function(){
	
	var userId = '${user.getUserid()}';
	
	if(userId != "admin"){
		alert('잘못된 접근입니다.');
		location.href = '/';
	}
	
	var grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    //data: gridData,
	    scrollX: false,
	    scrollY: false,
	    columns: [
	      {
	        header: 'title',
	        align:'center',
	        name: 'title'
	      },
	      {
	        header: 'subheading',
	        align:'center',
	        name: 'subheading'
	      },
	      { 
	        header: 'writer',
	        align:'center',
	        name: 'writer'
	      },
	      { 
	        header: 'reportingDate',
	        align:'center',
	        name: 'reportingDate'
	      }
	    ], 
	    header: {
	    	align:'center',
	    	valign:'middle'
	    }
	  });
	
	grid.on('click', function(ev) {
		var target = ev.columnName;
			
		if (target == 'title') {
			location.href = '/';
		}
		
	});
	
	$.ajax({
		
		url : "/toastList",
		type : "GET",
		dataType : "JSON",
		success : function(result){
			console.dir(result);
			grid.resetData(result); 
		}
		
	});
};
	
</script>
</body>
</html>