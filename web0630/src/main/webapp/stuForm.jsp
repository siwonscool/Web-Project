<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function formCheck(){
	var result = Number($("#kor").val()) + Number($("#eng").val()) + Number($("#math").val());
	$("#total").val(result);
	$("#avg").val(result/3.0);
	 
	if($("#stuNo").val()==""||$("#stuNo").val()==null){
		alert("학번을 입력하세요");
		$("#stuNo").focus();
		return false;
	}
	
	if($("#name").val()==""||$("#name").val()==null){
		alert("이름을 입력하세요");
		$("#name").focus();
		return false;
	}
	
	if($("#kor").val()==""||$("#kor").val()==null){
		alert("국어점수를 입력하세요");
		$("#kor").focus();
		return false;
	}
	
	if($("#eng").val()==""||$("#eng").val()==null){
		alert("영어점수를 입력하세요");
		$("#eng").focus();
		return false;
	}
	
	if($("#math").val()==""||$("#math").val()==null){
		alert("수학점수를 입력하세요");
		$("#math").focus();
		return false;
	}
	
	return document.form1.submit();
}

</script>
</head>
<body>
<form action="J0630_03.jsp" method="post" name="form1">
<label for="stuNo">학번</label>
<input type="text" id="stuNo" name="stuNo"> <br>
<label for="name">이름</label>
<input type="text" id="name" name="name"> <br>
<label for="kor" >국어</label>
<input type="text" id="kor" name="kor"> <br>
<label for="eng">영어</label>
<input type="text" id="eng" name="eng"> <br>
<label for="math">수학</label>
<input type="text" id="math" name="math"> <br>

<input type="hidden" id="total" name="total">
<input type="hidden" id="avg" name="avg">

<input type="button" onclick="formCheck();" value="전송">
<input type="reset" value="취소">
</form>

</body>
</html>