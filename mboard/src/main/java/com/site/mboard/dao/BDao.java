package com.site.mboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.site.mboard.vo.BVo;
import com.site.mboard.vo.MVo;

public class BDao {
	DataSource ds = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//connection 연결 
	public Connection getConnection() throws Exception {
		Context context = new InitialContext();
		ds= (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
		return ds.getConnection();
	}
	
	//게시글 수정
	public int boardModifyUpdate(String bid,String btitle,String bcontent,String bupload) {
		int result=0;
		try {
			conn=this.getConnection();
			String sql="update board set btitle=?, bcontent=?, bupload=? where bid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, btitle);
			pstmt.setString(2, bcontent);
			pstmt.setString(3, bupload);
			pstmt.setString(4, bid);
			result=pstmt.executeUpdate();
			System.out.println("result2 : "+result);
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
	
	//게시글 삭제
	public int boardDelete(String bid) {
		int result=0;
		try {
			conn=this.getConnection();
			String sql="delete board where bid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bid);
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
	}//boardDelete
	
	//write insert
	public int boardWriteInsert(BVo bVo) {
		int result=0;
		try {
			conn=this.getConnection();
			String sql="insert into board values(board_seq.nextval,?,?,?,board_seq.currval,"
					+ "0,0,sysdate,?,0)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bVo.getBtitle());
			pstmt.setString(2, bVo.getBcontent());
			pstmt.setString(3, bVo.getBname());
			pstmt.setString(4, bVo.getBupload());
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
	}//boardWriteInsert
	
	//bview페이지 select
	public BVo boardOneSelect(String bid) {
		BVo bVo=null;
		String sql="";
		try {
			conn=this.getConnection();
			sql="select * from board where bid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bVo = new BVo(rs.getInt("bid"),rs.getString("btitle"),rs.getString("bcontent"),rs.getString("bname")
						,rs.getInt("bgroup"),rs.getInt("bstep"),rs.getInt("bindent"),rs.getTimestamp("bdate")
						,rs.getString("bupload"),rs.getInt("bhit"));
				sql="update board set bhit=bhit+1 where bid=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, bid);
				pstmt.executeQuery();
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
	}//boardOneSelect
	
	public ArrayList<BVo> boardAllSelect(String category,String keyword,int startrow,int endrow){
		ArrayList<BVo> list = new ArrayList<BVo>();
		
		try {
			conn=this.getConnection();
			switch (category) {
			case "all": {
				String sql = "select * from "
						+ "(select rownum rnum,b.* from "
						+ "(select * from board order by bgroup desc, bid asc)b "
						+ "where btitle like ? or bcontent like ?) "
						+ "where rnum>=? and rnum<=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
				pstmt.setInt(3, startrow);
				pstmt.setInt(4, endrow);
				break;
			}
			case "title": {
				String sql = "select * from "
						+ "(select rownum rnum,b.* from "
						+ "(select * from board order by bgroup desc, bid asc)b "
						+ "where btitle like ?) "
						+ "where rnum>=? and rnum<=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setInt(2, startrow);
				pstmt.setInt(3, endrow);
				break;
			}
			case "content": {
				String sql = "select * from "
						+ "(select rownum rnum,b.* from "
						+ "(select * from board order by bgroup desc, bid asc)b "
						+ "where bcontent like ?) "
						+ "where rnum>=? and rnum<=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setInt(2, startrow);
				pstmt.setInt(3, endrow);
				break;
			}
			default:
				String sql = "select * from "
						+ "(select rownum rnum,b.* from "
						+ "(select * from board order by bgroup desc, bid asc)b) "
						+ "where rnum>=? and rnum<=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startrow);
				pstmt.setInt(2, endrow);
				break;
			}
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BVo bVo = new BVo(rs.getInt("bid"),rs.getString("btitle"),rs.getString("bcontent"),rs.getString("bname")
						,rs.getInt("bgroup"),rs.getInt("bstep"),rs.getInt("bindent"),rs.getTimestamp("bdate")
						,rs.getString("bupload"),rs.getInt("bhit"));
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
	}//boardOneSelect
	
	//검색 or 전체 게시글수
	public int boardCountSelect(String category,String keyword) {
		int count=0;
		try {
			conn=this.getConnection();
			switch (category) {
			case "all": {
				String sql = "select count(*) count from board where btitle like ? or bcontent like ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
				break;
			}
			case "title": {
				String sql = "select count(*) count from board where btitle like ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				break;
			}
			case "content": {
				String sql = "select count(*) count from board where bcontent like ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				break;
			}
			default:
				String sql = "select count(*) count from board";
				pstmt=conn.prepareStatement(sql);
				break;
			}
			rs=pstmt.executeQuery();
			if(rs.next()) {
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
	}//boardCountSelect
	
}
