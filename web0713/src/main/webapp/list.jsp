<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/notice_list.css">
</head>
<body>
<section>
    <h1>NOTICE</h1>
    <div class="wrapper">
      <form action="/search" name="search" method="post">
        <select name="category" id="category">
          <option value="0">전체</option>
          <option value="title">제목</option>
          <option value="content">내용</option>
        </select>

        <div class="title">
          <input type="text" size="16">
        </div>
  
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
    </div>

    <table>
      <colgroup>
        <col width="15%">
        <col width="45%">
        <col width="15%">
        <col width="15%">
        <col width="10%">
      </colgroup>
      <!-- 제목부분 -->
      <tr>
        <th>No.</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
      <!-- 내용부분 -->
      
      <%
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				
				try{
				
					Class.forName("oracle.jdbc.driver.OracleDriver");
					
					conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ora_user","1234");
					
					stmt = conn.createStatement();
					
					String sql="select bid,btitle,bname,to_char(bdate,'yyyy-mm-dd') as bdate,bhit from board ";
					rs=stmt.executeQuery(sql);
					
					while(rs.next()){
						int bid=rs.getInt("bid");
						String btitle=rs.getString("btitle");
						String bname=rs.getString("bname");
						String bdate=rs.getString("bdate");
						int bhit=rs.getInt("bhit");
						%>
						      <tr>
						        <td><span class="table-notice"><%=bid %></span></td>
						        <td class="table-title">
						        <a href=""><%=btitle %></a>
						        </td>
						        <td><%=bname %></td>
						        <td><%=bdate %></td>
						        <td><%=bhit %></td>
						      </tr>
      <% 
					}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
						if(rs!=null)rs.close();
						if(stmt!=null)stmt.close();
						if(conn!=null)conn.close();
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			
			%>
      
    </table>

    <ul class="page-num">
      <li class="first"></li>
      <li class="prev"></li>
      <li class="num"><div>1</div></li>
      <li class="next"></li>
      <li class="last"></li>
    </ul>

    <a href="write_view.jsp"><div class="write">쓰기</div></a>
  </section>

</body>
</html>