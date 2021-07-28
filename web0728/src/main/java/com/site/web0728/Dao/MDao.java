package com.site.web0728.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.site.web0728.Vo.MVo;

public class MDao {
	DataSource ds = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	MVo mVo = null;
	
	public MVo mLoginSelect(String id, String pw) {
		try {
			conn=this.getConnection();
			String sql="select * from member where id=? and pw=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mVo=new MVo(rs.getString("id"),rs.getString("pw"),
						rs.getString("name"),rs.getString("nickname"),
						rs.getString("gender"),rs.getString("tel"),rs.getString("address1"),
						rs.getString("address2"),rs.getString("hobby"));
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
		return mVo;
	}
	
	
	//connection 접근
	public Connection getConnection() throws Exception {
		Context context = new InitialContext();
		ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		return ds.getConnection();
	}//getConnection()
	
	
}
