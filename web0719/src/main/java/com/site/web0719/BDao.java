package com.site.web0719;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BDao {
	   Connection conn = null;
	   DataSource ds = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   ArrayList<BDto> list = new ArrayList<BDto>();
	   
	   public BDao() {}
	   
	   //connection 객체 가져오기
	   public Connection getConnection() throws Exception{
	      Context context = new InitialContext();
	      ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
	      return ds.getConnection();
	   }
	   
	   public ArrayList<BDto> boardSelect(){
		   try {
			conn=this.getConnection();
			String sql="select * from board";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BDto bDto = new BDto();
				bDto.setBid(rs.getInt("bid"));
				bDto.setBtitle(rs.getString("btitle"));
				bDto.setBupload(rs.getString("bupload"));
				bDto.setBcontent(rs.getString("bcontent"));
				bDto.setBname(rs.getString("bname"));
				bDto.setBdate(rs.getTimestamp("bdate"));
				bDto.setBhit(rs.getInt("bhit"));
				list.add(bDto);
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
		   return list;
	   }
	   
	   
}
