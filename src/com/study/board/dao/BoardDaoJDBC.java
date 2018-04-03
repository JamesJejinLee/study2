package com.study.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.study.board.vo.Board;
import com.study.board.vo.BoardSearch;
public class BoardDaoJDBC implements IBoardDao {
		Board board = null;
		Connection conn = null;
		
		@Override
		public int getBoardCount(Connection conn, BoardSearch boardSearch) throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuilder sb = new StringBuilder();  //StringBuidler나 StringBuffer나 똑같과 상관없다.
			sb.append(" SELECT	 COUNT(*) FROM tb_board");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				rs = pstmt.executeQuery();
				rs.next();
				return rs.getInt(1);
			}finally {
				if(rs!=null) try {rs.close();} catch(SQLException e){}
				if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}
			}
		}
		
		//전자 정부쪽에는 map<String, object>이런식으로 받지만..!! 우리는 고쳐보겠다. BoardSearch boardSearch
		@Override
		public List<Board> getBoardList(Connection conn, BoardSearch boardSearch) throws SQLException{
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<Board> list = new ArrayList<>();
			StringBuilder sb = new StringBuilder();  //StringBuidler나 StringBuffer나 똑같과 상관없다.
			
			// 지금 이렇게 지져분해 보이겠지만 mybatis가 나중에는 깔끔하게 정리를 해줄 것이다. Paging Query
			// 
			sb.append("	SELECT	*			");
			sb.append("	FROM	( SELECT rownum rn, a.*	");
			sb.append("				FROM (					");
			
			sb.append(" 		SELECT					");
			sb.append("		 bo_no					"); 
			sb.append("		, bo_title				"); 
			sb.append("		, bo_writer			"); 
			sb.append("		, bo_passwd			"); 
			sb.append("		, bo_email				"); 
			sb.append("		, bo_content			"); 
			sb.append("		, bo_ip					"); 
			sb.append("		, bo_read_cnt			"); 
			sb.append("		, bo_reg_date			"); 
			sb.append("		, bo_mod_date			"); 
			sb.append("	FROM tb_board				");
			sb.append("					  ) a		");
			sb.append("			 ) b				");
			sb.append("	WHERE rn between ? and ?	");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				int i = 1;
				pstmt.setInt(i++, boardSearch.getStartRow());
				pstmt.setInt(i++, boardSearch.getEndRow());
				rs = pstmt.executeQuery();
				
				Board board = null; //select을 한 쿼리를 다른 그릇에 담을 준비를 한다. Board를 이용해서. 빈 클래스를 이용해서 
				
				while (rs.next()) {
					board = new Board();
					board.setBo_no(rs.getInt("bo_no"));
					board.setBo_title(rs.getString("bo_title"));
					board.setBo_writer(rs.getString("bo_writer"));
					board.setBo_passwd(rs.getString("bo_passwd"));
					board.setBo_email(rs.getString("bo_email"));
					board.setBo_content(rs.getString("bo_content"));
					board.setBo_ip(rs.getString("bo_ip"));
					board.setBo_read_cnt(rs.getInt("bo_read_cnt"));
					board.setBo_reg_date(rs.getString("bo_reg_date"));
					board.setBo_mod_date(rs.getString("bo_mod_date"));
					list.add(board);
				}
				return list;
			}finally {
				if(rs!=null) try {rs.close();} catch(SQLException e){}
				if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}
			}
		}
		
		@Override
		public Board getBoard(Connection conn, int bo_no) throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuilder sb = new StringBuilder();  //StringBuidler나 StringBuffer나 똑같과 상관없다.
			sb.append(" SELECT				 ");
			sb.append(" 		bo_no		 "); // 기억하자!!!!!
			sb.append("    , 	bo_title 	 ");
			sb.append("    ,	bo_writer	 ");
			sb.append("    ,	bo_content	 ");
			sb.append("    ,	bo_reg_date ");
			sb.append(" FROM 	tb_board  	 ");
			sb.append(" WHERE bo_no = ? ");
			
			try{
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, bo_no);
				rs = pstmt.executeQuery(); 
				Board board = null;
				if(rs.next()) {
					board = new Board();
					board.setBo_no(rs.getInt("bo_no"));    //빈 객체에 다 채워넣어야 나중에 또 쓸수 있지.
					board.setBo_title(rs.getString("bo_title"));
					board.setBo_writer(rs.getString("bo_writer"));
					board.setBo_content(rs.getString("bo_content"));
					board.setBo_reg_date(rs.getString("bo_reg_date"));
				}
				return board;
			}finally {
				if(rs!=null) try {rs.close();} catch(SQLException e){}
				if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}
			}
		}
		
		@Override
		public int insertBoard(Connection conn, Board board) throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuilder sb = new StringBuilder();  //StringBuidler나 StringBuffer나 똑같과 상관없다.
			
			sb.append(" insert into tb_board		");	 
	       sb.append("		(	bo_no			");
	       sb.append("		  , bo_title		"); 
	       sb.append("		  , bo_writer		"); 
	       sb.append("		  , bo_passwd		"); 		  
	       sb.append("      , bo_email		"); 		  
	       sb.append("      , bo_content		"); 		  
	       sb.append("      , bo_ip			"); 		  
	       sb.append("      , bo_read_cnt	"); 		  
	       sb.append("      , bo_reg_date	"); 		  
	       sb.append("      , bo_mod_date )  ");
	       sb.append("	VALUES (seq_board.nextval, ?, ? ,? ,? ,? ,? ,0 ,sysdate, sysdate)");   
			
			try{
				pstmt = conn.prepareStatement(sb.toString());
				
				int i = 1;
				//pstmt.setString(i++, member.getMem_name());
				pstmt.setString(i++, board.getBo_title());
				pstmt.setString(i++, board.getBo_writer());
				pstmt.setString(i++, board.getBo_passwd());
				pstmt.setString(i++, board.getBo_email());
				pstmt.setString(i++, board.getBo_content());
				pstmt.setString(i++, board.getBo_ip());
				int cnt = pstmt.executeUpdate();
				return cnt;
			}finally {
				if(rs!=null) try {rs.close();} catch(SQLException e){}
				if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}
			}
		}
		
		@Override
		public int updateBoard(Connection conn, Board board) throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuilder sb = new StringBuilder();  //StringBuidler나 StringBuffer나 똑같과 상관없다.
			
			sb.append(" UPDATE tb_board   	");
			sb.append(" SET bo_title = ?,		");
			sb.append(" bo_writer = ?,		");
			sb.append(" bo_content = ?		");
			sb.append(" WHERE bo_no= ?		");
			
			try{
				pstmt = conn.prepareStatement(sb.toString());
				int i = 1;
				pstmt.setString(i++, board.getBo_title());
				pstmt.setString(i++,board.getBo_writer());
				pstmt.setString(i++,board.getBo_content());
				pstmt.setInt(i++,board.getBo_no());
				int cnt = pstmt.executeUpdate();
				return cnt;
			}finally {
				if(rs!=null) try {rs.close();} catch(SQLException e){}
				if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}
			}
		}
}