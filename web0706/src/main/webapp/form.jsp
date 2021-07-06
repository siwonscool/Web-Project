<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form</title>

<style type="text/css">

table,tr,td {
	border:1px solid;
	border-collapse: collapse;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	function formCheck(){
		if($("#id").val().length<3){
			alert('아이디를 3자리 이상 입력하세요');
			$("#id").val("");
			$("#id").focus();
			return false;
		}
		
		if($("#pw1").val()!=$("#pw2").val()){
			alert('비밀번호가 일치하지 않습니다.');
			$("#pw1").val("");
			$("#pw2").val("");
			$("#pw1").focus();
			return false;
		}
		return document.form.submit();
	}
</script>
</head>
<body>
<form action="formOk.jsp" name="form" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td> <input type="text" name="id" id="id"> </td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td> <input type="password" name="pw1" id="pw1"> </td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td> <input type="password" name="pw2" id="pw2"> </td>
		</tr>
		<tr>
			<td>소식지 수신여부</td>
			<td> 
				수신<input type="radio" name="newsletter" value="receive" checked>
				미수신<input type="radio" name="newsletter" value="not receive">
			</td>
		</tr>
	</table>
	<br><br>
	
	<table>
		<tr>
			<td>관심연령</td>
			<td>
				<select name="interest">
					<option value="none">상관없음</option>
					<option value="10대">10대</option>
					<option value="20대">20대</option>
					<option value="30대">30대</option>
				</select>			
			</td>
			<td>성별</td>
			<td>
				선택안함<input type="radio" name="gender" value="none" checked>			
				남자<input type="radio" name="gender" value="male">			
				여자<input type="radio" name="gender" value="female">			
			</td>			
		</tr>
		<tr>
			<td>결혼여부</td>
			<td>
				선택안함<input type="radio" name="marriage" value="none" checked>			
				미혼<input type="radio" name="marriage" value="marriged">			
				기혼<input type="radio" name="marriage" value="not marriged">			
			</td>
			<td>자녀유무</td>
			<td>
				선택안함<input type="radio" name="children" value="none" checked>			
				없음<input type="radio" name="children" value="have">			
				있음<input type="radio" name="children" value="not have">
			</td>
		</tr>
		
		<tr>
			<td>직업</td>
			<td colspan=3>
				<select name="job">
					<option value="none">상관없음</option>
					<option value="student">학생</option>
					<option value="salary man">회사원</option>
					<option value="soldier">군인</option>
				</select>
			</td>
		</tr>
	</table>
	<br><br>
	
	<table>
		<tr>
			<td> 
				<input type="checkbox" name="hobby" value="familyLaw"> 가정법률 
				<input type="checkbox" name="hobby" value="childrenEdu"> 아동 청소년/교육 
				<input type="checkbox" name="hobby" value="real estate"> 부동산/임대차
				<input type="checkbox" name="hobby" value="financial"> 금융/금전 
				<input type="checkbox" name="hobby" value="company"> 사업 
				<input type="checkbox" name="hobby" value="founded"> 창업 <br>
				<input type="checkbox" name="hobby" value="trade"> 무역/출입국 
				<input type="checkbox" name="hobby" value="buyer"> 소비자
				<input type="checkbox" name="hobby" value="culture"> 문화/여가생활 
				<input type="checkbox" name="hobby" value="lawsuit"> 민형사/소송 
				<input type="checkbox" name="hobby" value="traffic"> 교통/운전 
				<input type="checkbox" name="hobby" value="work"> 근로/노동 <br>
				<input type="checkbox" name="hobby" value="welfare"> 복지 
				<input type="checkbox" name="hobby" value="defense"> 국방/보훈 
				<input type="checkbox" name="hobby" value="technology"> 정보통신/기술
				<input type="checkbox" name="hobby" value="environment"> 환경/에너지 
				<input type="checkbox" name="hobby" value="criminal"> 사회안전/범죄 
				<input type="checkbox" name="hobby" value="national"> 국가 및 지자체 
			</td>
		</tr>
	</table>
	
	<br><br>
	
	<input type="button" value="저장" onclick="formCheck()">
	<input type="reset" value="취소">
</form>
</body>
</html>