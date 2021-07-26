<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table,th,td{border: 1px solid; border-collapse: collapse;}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
var count=0;
function addFile(){
	count++;
	var html="";
	html=html+'<tr>';
	html=html+'<td><input type="checkbox" name="filecheck" id="filecheck"></td>';
	html=html+'<td><input type="file" name="file'+count+'" id="file'+count+'"></td>';
	html=html+'</tr>';
	$("#ftable").append(html);
}

function subFile(){
	if($("input:checkbox[name=filecheck]").length<=0){
			alert("파일첨부가 1개 이상 있어야 삭제가 가능합니다.");
			return false;
		}

		if($("input:checkbox[name=filecheck]:checked").length<=0){
			alert("체크가 1개 이상 되어야 삭제가 가능합니다.")
			return false;
		}
		
		$("input:checkbox[name=filecheck]").each(function(){
			if(this.checked){
				$("#"+this.value).remove();
			}else{
				alert("체크 안되어 있습니다.");
			}
		});
}

function formSubmit(){
	$("#fileCount").val($("input:checkbox[name=filecheck]").length);
	$("#form").submit();
}
</script>
</head>
<body>
	<h3>동적 다중 파일 업로드 하기</h3>
	<form action="testFormOk.jsp" name="form" id="form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="fileCount" id="fileCount">
		<table>
			<tr>
				<td>작성자</td>
				<td> <input type="text" name="name" id="name"> </td>
			</tr>
			<tr>
				<td>제목</td>
				<td> <input type="text" name="title" id="title"> </td> 
			</tr>
		</table>
		<br>
		<button type="button" onclick="addFile()">파일추가</button>
		<button type="button" onclick="subFile()">파일삭제</button>
		<table id="ftable">
			<tr>
				<td>check</td>
				<td>업로드할 파일이름</td>
			</tr>
			<!-- 파일추가시 추가되는 테이블 -->
		</table>
		<br>
		<button type="button" onclick="formSubmit()">저장</button>
	</form>
</body>
</html>