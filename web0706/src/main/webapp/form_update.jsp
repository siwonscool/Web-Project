<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<%
request.setCharacterEncoding("utf-8");

%>
<form action="formOk.jsp" name="form">
<table>
		<tr>
			<td>아이디</td>
			<td> <input type="text" name="id" id="id" value="<%=request.getParameter("id") %>"> </td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td> <input type="password" name="pw1" id="pw1" value="<%=request.getParameter("pw") %>"> </td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td> <input type="password" name="pw2" id="pw2" value="<%=request.getParameter("pw") %>"> </td>
		</tr>
		<tr>
			<td>소식지 수신여부</td>
			<td> 
				수신<input type="radio" name="newsletter" value="receive" <%=(request.getParameter("newsletter").equals("receive"))?"checked":"" %>>
				미수신<input type="radio" name="newsletter" value="not receive" <%=(request.getParameter("newsletter").equals("not receive"))?"checked":"" %>>
			</td>
		</tr>
	</table>
	<br><br>
	
	<table>
		<tr>
			<td>관심연령</td>
			<td>
				<select name="interest">
					<option value="none" <%=(request.getParameter("interest").equals("none"))?"selected":"" %>>상관없음</option>
					<option value="10대" <%=(request.getParameter("interest").equals("10대"))?"selected":"" %>>10대</option>
					<option value="20대" <%=(request.getParameter("interest").equals("20대"))?"selected":"" %>>20대</option>
					<option value="30대" <%=(request.getParameter("interest").equals("30대"))?"selected":"" %>>30대</option>
				</select>			
			</td>
			<td>성별</td>
			<td>
				선택안함<input type="radio" name="gender" value="none" <%=(request.getParameter("gender").equals("none"))?"checked":"" %>>			
				남자<input type="radio" name="gender" value="male" <%=(request.getParameter("gender").equals("male"))?"checked":"" %>>			
				여자<input type="radio" name="gender" value="female" <%=(request.getParameter("gender").equals("female"))?"checked":"" %>>			
			</td>			
		</tr>
		<tr>
			<td>결혼여부</td>
			<td>
				선택안함<input type="radio" name="marriage" value="none" <%=(request.getParameter("marriage").equals("none"))?"checked":"" %>>			
				미혼<input type="radio" name="marriage" value="marriged" <%=(request.getParameter("marriage").equals("marriged"))?"checked":"" %>>			
				기혼<input type="radio" name="marriage" value="not marriged" <%=(request.getParameter("marriage").equals("not marriged"))?"checked":"" %>>			
			</td>
			<td>자녀유무</td>
			<td>
				선택안함<input type="radio" name="children" value="none" <%=(request.getParameter("children").equals("none"))?"checked":"" %>>			
				없음<input type="radio" name="children" value="have" <%=(request.getParameter("children").equals("have"))?"checked":"" %>> 			
				있음<input type="radio" name="children" value="not have" <%=(request.getParameter("children").equals("not have"))?"checked":"" %>>
			</td>
		</tr>
		
		<tr>
			<td>직업</td>
			<td colspan=3>
				<select name="job">
					<option value="none" <%=(request.getParameter("job").equals("none"))?"selected":"" %>>상관없음</option>
					<option value="student" <%=(request.getParameter("job").equals("student"))?"selected":"" %>>학생</option>
					<option value="salary man" <%=(request.getParameter("job").equals("salary man"))?"selected":"" %>>회사원</option>
					<option value="soldier" <%=(request.getParameter("job").equals("soldier"))?"selected":"" %>>군인</option>
				</select>
			</td>
		</tr>
	</table>
	<br><br>
	
	<table>
		<tr>
			<td> 
				<input type="checkbox" name="hobby" value="familyLaw" <%=(request.getParameter("hobby").contains("familyLaw"))?"checked":"" %>> 가정법률 
				<input type="checkbox" name="hobby" value="childrenEdu" <%=(request.getParameter("hobby").contains("childrenEdu"))?"checked":"" %>> 아동 청소년/교육 
				<input type="checkbox" name="hobby" value="real estate" <%=(request.getParameter("hobby").contains("real estate"))?"checked":"" %>> 부동산/임대차
				<input type="checkbox" name="hobby" value="financial" <%=(request.getParameter("hobby").contains("financial"))?"checked":"" %>> 금융/금전 
				<input type="checkbox" name="hobby" value="company" <%=(request.getParameter("hobby").contains("company"))?"checked":"" %>> 사업 
				<input type="checkbox" name="hobby" value="founded" <%=(request.getParameter("hobby").contains("founded"))?"checked":"" %>> 창업 <br>
				<input type="checkbox" name="hobby" value="trade" <%=(request.getParameter("hobby").contains("trade"))?"checked":"" %>> 무역/출입국 
				<input type="checkbox" name="hobby" value="buyer" <%=(request.getParameter("hobby").contains("buyer"))?"checked":"" %>> 소비자
				<input type="checkbox" name="hobby" value="culture" <%=(request.getParameter("hobby").contains("culture"))?"checked":"" %>> 문화/여가생활 
				<input type="checkbox" name="hobby" value="lawsuit" <%=(request.getParameter("hobby").contains("lawsuit"))?"checked":"" %>> 민형사/소송 
				<input type="checkbox" name="hobby" value="traffic" <%=(request.getParameter("hobby").contains("traffic"))?"checked":"" %>> 교통/운전 
				<input type="checkbox" name="hobby" value="work" <%=(request.getParameter("hobby").contains("work"))?"checked":"" %>> 근로/노동 <br>
				<input type="checkbox" name="hobby" value="welfare" <%=(request.getParameter("hobby").contains("welfare"))?"checked":"" %>> 복지 
				<input type="checkbox" name="hobby" value="defense" <%=(request.getParameter("hobby").contains("defense"))?"checked":"" %>> 국방/보훈 
				<input type="checkbox" name="hobby" value="technology" <%=(request.getParameter("hobby").contains("technology"))?"checked":"" %>> 정보통신/기술
				<input type="checkbox" name="hobby" value="environment" <%=(request.getParameter("hobby").contains("environment"))?"checked":"" %>> 환경/에너지 
				<input type="checkbox" name="hobby" value="criminal" <%=(request.getParameter("hobby").contains("criminal"))?"checked":"" %>> 사회안전/범죄 
				<input type="checkbox" name="hobby" value="national" <%=(request.getParameter("hobby").contains("national"))?"checked":"" %>> 국가 및 지자체 
			</td>
		</tr>
	</table>
	<br><br>
	
	<input type="button" value="저장" onclick="formCheck()">
</form>
</body>
</html>