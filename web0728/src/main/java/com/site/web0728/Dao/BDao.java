package com.site.web0728.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.site.web0728.Vo.BVo;
import com.site.web0728.Vo.MVo;

public class BDao {
	DataSource ds = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<BVo> boardListSelect(int startrow, int endrow, String category, String keyword) {
		ArrayList<BVo> list = new ArrayList<BVo>();
		BVo bVo = null;
		String sql="";
		try {
			conn=this.getConnection();
			switch (category) {
			case "all":
				sql="select * from"
						+ "(select rownum as rnum,b.* from"
						+ "(select * from board order by bgroup desc,bid asc)b "
						+ "where btitle like ? or bcontent like ?)"
						+ "where rnum>=? and rnum<=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
				pstmt.setInt(3, startrow);
				pstmt.setInt(4, endrow);
				rs=pstmt.executeQuery();
				break;
			case "title":
				sql="select * from"
						+ "(select rownum as rnum,b.* from"
						+ "(select * from board order by bgroup desc,bid asc)b "
						+ "where btitle like ?) "
						+ "where rnum>=? and rnum<=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setInt(2, startrow);
				pstmt.setInt(3, endrow);
				rs=pstmt.executeQuery();
				break;
			case "content":
				sql="select * from"
						+ "(select rownum as rnum,b.* from"
						+ "(select * from board order by bgroup desc,bid asc)b "
						+ "where bcontent like ?) "
						+ "where rnum>=? and rnum<=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setInt(2, startrow);
				pstmt.setInt(3, endrow);
				rs=pstmt.executeQuery();
				break;

			default:
				sql="select * from "
						+ "(select rownum as rnum,b.* from "
						+ "(select * from board order by bgroup desc,bid asc)b) "
						+ "where rnum>=? and rnum<=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startrow);
				pstmt.setInt(2, endrow);
				rs=pstmt.executeQuery();
				break;
			}
			while(rs.next()) {
				bVo=new BVo(rs.getInt("bid"),rs.getString("btitle"),rs.getString("bcontent"),
						rs.getString("bname"),rs.getInt("bgroup"),rs.getInt("bstep"),
						rs.getInt("bindent"),rs.getTimestamp("bdate"),rs.getString("bupload"),
						rs.getInt("bhit"));
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
	
	//connection 접근
	public Connection getConnection() throws Exception {
		Context context = new InitialContext();
		ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		return ds.getConnection();
	}//getConnection()
	
	// 전체 게시물수 세는 메소드
	public int boardCountSelect(String keyword, String category) {
		int count=0;
		String sql="";
		try {
			conn=this.getConnection();
			switch (category) {
			case "all":
				sql="select count(*) count from board where btitle like ? or bcontent like ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
				rs=pstmt.executeQuery();
				break;
			case "title":
				sql="select count(*) count from board where btitle like ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				rs=pstmt.executeQuery();
				break;
			case "content":
				sql="select count(*) count from board where bcontent like ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				rs=pstmt.executeQuery();
				break;

			default:
				sql="select count(*) count from board";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				break;
			}
			while(rs.next()) {
				count=rs.getInt("count");
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
		
		return count;
	}
}
