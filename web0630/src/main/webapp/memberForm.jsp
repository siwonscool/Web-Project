<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function formCheck(){

	var result = Number($("#salary").val())/10;
	$("#minus").val(result);
	
	if($("#id").val().length<3){
		alert("id를 3자리 이상 입력하세요");
		$("#id").focus();
		return false;
	}
	
	if($("#name").val()==""||$("#name").val()==null){
		alert("이름을 입력하세요");
		$("#name").focus();
		return false;
	}
	return document.form1.submit();
}
</script>
</head>

<body>
<!-- id 3자리이상 이름 들어가있는지 안들어가 있는지 -->
<form action="J0630_04.jsp" method="post" name="form1">
	<table>
		<tr>
			<td>번호</td>
			<td> <input type="text" id="num" name="num"> </td>
		</tr>
		<tr>
			<td>이름</td>
			<td> <input type="text" id="name" name="name"> </td>
		</tr>
		<tr>
			<td>id</td>
			<td> <input type="text" id="id" name="id"> </td>
		</tr>
		<tr>
			<td>pw</td>
			<td> <input type="text" id="pw" name="pw"> </td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td> <input type="text" id="tel" name="tel"> </td>
		</tr>
		<tr>
			<td>성별</td>
			<td> <input type="radio" id="gender" name="gender" value="male">남자 <input type="radio" id="gender" name="gender" value="female">여자 </td>
		</tr>
		<tr>
			<td>월급</td>
			<td> 
				<input type="text" id="salary" name="salary">
				<input type="hidden" id="minus" name="minus">
			 </td>
		</tr>
		<tr>
			<td> <input type="button" value="저장" onclick="formCheck()"> <input type="reset" value="취소"> </td>
		</tr>
		
	</table>
</form>

</body>
</html>