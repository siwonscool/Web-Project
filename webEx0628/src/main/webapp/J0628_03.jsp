<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	function formCheck(){
		alert("테스트");
		if($("#name").val()==""|| $("#name").val() == null){
			alert("이름을 입력해야 합니다.");
			$("#name").focus();
			return false;
		}
		
		return document.form2.submit();
	}
</script>
</head>
<body>
<!-- 시험번호:1 이름:김시원 점수:70  -->
<!-- 60점이상 합격 60점미만 불합격  -->
<form action="test1.jsp" name="form2" method="post">
	<label for="stuNo">시험번호</label>
	<input type="text" id="stuNo" name="stuNo"> <br>
	<label for="name" >이름</label>
	<input type="text" id="name" name="name"> <br>
	<label for="score">점수</label>
	<input type="text" id="score" name="score"> <br>
	
	<input type="button" value="제출" onclick="formCheck();">
	<input type="reset" value="취소">
</form>
</body>
</html>