package com.site.web0726.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.site.web0725.Vo.BVo;

public class BDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	DataSource ds = null;
	BVo bVo= null;
	
	
	public Connection getConnection() throws Exception {
		Context context = new InitialContext();
		ds=(DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		return ds.getConnection();
	}
	public int insertBoard(String btitle,String bcontent,String bname,String bupload) {
		int result=0;
		try {
			conn=this.getConnection();
			String sql="insert into board values(board_seq.nextval,?,?,?,board_seq.currval,0,0,sysdate,?,bhit)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, btitle);
			pstmt.setString(2, bcontent);
			pstmt.setString(3, bname);
			pstmt.setString(4, bupload);
			result=pstmt.executeUpdate();
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
		return result;
	}
	
	public BVo selectOne(int bid) {
		try {
			conn=this.getConnection();
			String sql="select * from board where bid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bVo=new BVo(rs.getInt("bid"),rs.getString("btitle"),rs.getString("bcontent"),rs.getString("bname")
						,rs.getInt("bgroup"),rs.getInt("bstep"),rs.getInt("bindent"),rs.getTimestamp("bdate"),
						rs.getString("bupload"),rs.getInt("bhit"));
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
		return bVo;
	}
	
	public ArrayList<BVo> selectAll(){
		BVo bVo = null;
		ArrayList<BVo> list = new ArrayList<BVo>();
		try {
			
			conn=this.getConnection();
			String sql="select * from board";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				bVo = new BVo(rs.getInt("bid"),rs.getString("btitle"),rs.getString("bcontent"),rs.getString("bname")
						,rs.getInt("bgroup"),rs.getInt("bstep"),rs.getInt("bindent"),rs.getTimestamp("bdate"),
						rs.getString("bupload"),rs.getInt("bhit"));
				list.add(bVo);
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
