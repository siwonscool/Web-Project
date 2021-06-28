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
				if($("#pw").val()==""||$("#pw").val()==null){
					alert("비밀번호를 입력하지 않았습니다 입력하세요");
					$("#pw").focus();
					return false;
				}
				if($("#pw").val()!=$("#pw2").val()){
					alert("비밀번호가 일치하지 않습니다.");
					$("#pw").val()="";
					$("#pw2").val()="";
					$("#pw").focus();
					return false;
				}
				
				return document.form1.submit();
			}
		</script>
	</head>
	<body>
		<h3>회원가입</h3>
		<form action="./FormOk.jsp" method="post" name="form1">
			<label for="name">이름</label>
				<input type="text" id="name" name="name"> <br>
			<label for="id">ID</label>
				<input type="text" id="id" name="id"> <br>
			<label for="pw">비밀번호</label>
				<input type="password" id="pw" name="pw"> <br>
			<label for="pw2">비밀번호 확인</label>
				<input type="password" id="pw2" name="pw2"> <br>
				
			<label>성별</label>
			<label for="male">남자</label>
				<input type="radio" id="male" name="gender" value="male"> 
			<label for="female">여자</label>
				<input type="radio" id="female" name="gender" value="female"> <br>
			
			<label>취미</label>
			<label for="jogging">조깅</label>
			<input type="checkbox" id="jogging" name="hobby" value="jogging">		
			<label for="game">게임</label>
			<input type="checkbox" id="game" name="hobby" value="game">				
			<label for="read">독서</label>
			<input type="checkbox" id="read" name="hobby" value="read">				
			<label for="soccer">축구</label>
			<input type="checkbox" id ="soccer" name="hobby" value="soccer"> <br>
			
			<label>전공</label>
			<select name="major">
				<option value="computer">컴퓨터공학</option>
				<option value="korea">국문학</option>
				<option value="math">수학</option>
			</select> <br>
			
			<input type="button" value="저장" onclick="formCheck();">
			<input type="reset" value="취소"> <br>
		</form>
	</body>
</html>