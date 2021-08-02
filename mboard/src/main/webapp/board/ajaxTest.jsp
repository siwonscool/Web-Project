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
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		   //100개의 json 가져오기
		   function ajaxDo(){
			   $.ajax({
				   url:"../js/board_data.json", //받아올 url
				   type:"get",                  //요청방식
				   dataType:"json",             //리턴타입
				   data:{                       
					   "bid":"1"   //url로 데이터 전달할게 있으면 입력
				   },
				   success:function(data){
					   alert("성공");
					   var html="";
					   for(var i=0;i<data.length;i++){
						   html=html+"<tr>";
						   html=html+"<td>"+data[i].bid+"</td>";
						   html=html+"<td>"+data[i].btitle+"</td>";
						   html=html+"<td>"+data[i].bname+"</td>";
						   html=html+"<td>"+data[i].bgroup+"</td>";
						   html=html+"</tr>";
					   }
					   $("#ajaxData").html(html);
				   },
				   error:function(){
					   alert("실패");
				   }
			   });
		   }
		   
		   //list 1개 데이터 추가
		   function ajaxAdd(){
			   $.ajax({
				   url:"#", //받아올 url
				   type:"get",                  //요청방식
				   dataType:"json",             //리턴타입
				   data:{                       //url로 데이터 전달할게 있으면 입력
					   /* "bid":$("#bid").val(), 
					   "btitle":$("#btitle").val(), 
					   "bname":$("#bname").val(), 
					   "bgroup":$("#bgroup").val() */ 
				   },
				   success:function(data){
					   alert("성공");
					   var html="";
					   html=html+"<tr>";
					   html=html+"<td>"+$("#bid").val()+"</td>";
					   html=html+"<td>"+$("#btitle").val()+"</td>";
					   html=html+"<td>"+$("#bname").val()+"</td>";
					   html=html+"<td>"+$("#bgroup").val() +"</td>";
					   html=html+"</tr>";
					   $("#ajaxData").prepend(html);
				   },
				   error:function(){
					   alert("실패");
				   }
			   });
		   }
		</script>
	</head>
	<body>
	  <h3>ajax 테스트</h3>
	  <button type="button" onclick="ajaxDo()">데이터가져오기</button>
	  <br><br><br>
	  <form action="">
	  	<label>번호</label>
	  	<input type="text" id="bid" name="bid"><br>
	  	<label>제목</label>
	  	<input type="text" id="btitle" name="btitle"><br>
	  	<label>작성자</label>
	  	<input type="text" id="bname" name="bname"><br>
	  	<label>조회수</label>
	  	<input type="text" id="bgroup" name="bgroup"><br>
	  </form>
	  <input type="button" onclick="ajaxAdd()" value="데이터추가"><br>
	  <table>
	  	<tr>
	  	  <th>번호</th>
	  	  <th>성</th>
	  	  <th>이름</th>
	  	  <th>조회수</th>
	  	</tr>
	  	<tbody id="ajaxData">	  	
	  	  <!-- 데이터 출력부분 -->
	  	</tbody>
	  </table>
	</body>
</html>