package com.site.web0718;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

//db연결 class
public class MDao {
   MDto mDto = new MDto();
   Connection conn = null;
   DataSource ds = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   public MDao() {}
   
   //connection 객체 가져오기
   public Connection getConnection() throws Exception{
      Context context = new InitialContext();
      ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
      return ds.getConnection();
   }
   
   //회원정보 수정 메서드
   public int memberUpdate(String id,MDto mDto) {
      int resultNum=0;
      try {
         conn=getConnection();
         String sql = "update member2 set id=?,pw=?,name=?,nickname=?,gender=?,tel=?,address1=?,address2=?,hobby=? where id=?";
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, mDto.getId());
         pstmt.setString(2, mDto.getPw());
         pstmt.setString(3, mDto.getName());
         pstmt.setString(4, mDto.getNickname());
         pstmt.setString(5, mDto.getGender());
         pstmt.setString(6, mDto.getTel());
         pstmt.setString(7, mDto.getAddress1());
         pstmt.setString(8, mDto.getAddress2());
         pstmt.setString(9, mDto.getHobby());
         pstmt.setString(10, id);
         
         resultNum=pstmt.executeUpdate();
         
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         try {
            if(rs!=null)rs.close();
            if(pstmt!=null)pstmt.close();
            if(conn!=null)conn.close();
         } catch (Exception e2) {
            e2.printStackTrace();
         }
      }
      return resultNum;
   }
   
   //회원가입 추가 메서드
   public int memberInsert(MDto mDto) {
      int resultNum =0;
      try {
         conn=getConnection();
         String sql = "insert into member2 values(?,?,?,?,?,?,?,?,?)";
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, mDto.getId());
         pstmt.setString(2, mDto.getPw());
         pstmt.setString(3, mDto.getName());
         pstmt.setString(4, mDto.getNickname());
         pstmt.setString(5, mDto.getGender());
         pstmt.setString(6, mDto.getTel());
         pstmt.setString(7, mDto.getAddress1());
         pstmt.setString(8, mDto.getAddress2());
         pstmt.setString(9, mDto.getHobby());
         
         resultNum=pstmt.executeUpdate();
         
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         try {
            if(rs!=null)rs.close();
            if(pstmt!=null)pstmt.close();
            if(conn!=null)conn.close();
         } catch (Exception e2) {
            e2.printStackTrace();
         }
      }
      return resultNum;
   }
   
   
   //로그인id,pw체크
   public MDto loginSelect(String userId,String userPw) {
      
      try {
         conn=getConnection();
         String sql = "select * from member2 where id=? and pw=?";
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, userId);
         pstmt.setString(2, userPw);
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            mDto.setId(rs.getString("id"));
            mDto.setPw(rs.getString("pw"));
            mDto.setName(rs.getString("name"));
            mDto.setNickname(rs.getString("nickname"));
            mDto.setGender(rs.getString("gender"));
            mDto.setTel(rs.getString("tel"));
            mDto.setAddress1(rs.getString("address1"));
            mDto.setAddress2(rs.getString("address2"));
            mDto.setHobby(rs.getString("hobby"));
         }else {
            
         }
         
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         try {
            if(rs!=null)rs.close();
            if(pstmt!=null)pstmt.close();
            if(conn!=null)conn.close();
         } catch (Exception e2) {
            e2.printStackTrace();
         }
      }
      
      return mDto;
   }//loginSelect
}
