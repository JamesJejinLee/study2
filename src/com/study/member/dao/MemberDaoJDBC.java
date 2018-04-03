package com.study.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.study.member.vo.Member;

public class MemberDaoJDBC implements IMemberDao {
	// 회원 목록
	@Override
	public List<Member> getMemberList(Connection conn) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList<>();
		StringBuilder sb = new StringBuilder();  //StringBuidler나 StringBuffer나 똑같과 상관없다.
		sb.append(" SELECT	");
		sb.append("			mem_id		");
		sb.append("		,	mem_name		");
		sb.append("		,	mem_pwd		");
		sb.append("		,	mem_phone		");
		sb.append("		,	mem_email		");
		sb.append("		,	TO_CHAR(reg_date, 'YYYY/MM/DD') AS reg_date ");
		sb.append("	FROM tb_member		");
	//	sb.append("	ORDER BY mem_id ASC ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			//select을 한 쿼리를 다른 그릇에 담을 준비를 한다. Member이용해서.
			Member member = null;
			while (rs.next()) {
				member = new Member();
				member.setMem_id(rs.getString("mem_id"));
				member.setMem_name(rs.getString("mem_name"));
				member.setMem_pwd(rs.getString("mem_pwd"));
				member.setMem_phone(rs.getString("mem_phone"));
				member.setMem_email(rs.getString("mem_email"));
				member.setReg_date(rs.getString("reg_date"));
				list.add(member);
			}
			return list;
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e){}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}
		}
	}
	
	// 회원상세 정보 조회
	@Override
	public Member getMember(Connection conn, String mem_id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();  //StringBuidler나 StringBuffer나 똑같과 상관없다.
		sb.append(" SELECT	");
		sb.append("			mem_id		");
		sb.append("		,	mem_name		");
		sb.append("		,	mem_pwd		");
		sb.append("		,	mem_phone		");
		sb.append("		,	mem_email		");
		sb.append("		,	TO_CHAR(reg_date, 'YYYY/MM/DD HH24:MI') AS reg_date ");
		sb.append("	FROM tb_member		");
		sb.append("	WHERE  mem_id = ?	");
		
		try{
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery(); //실행
			Member member = null;
			if(rs.next()) {
				member = new Member();
				member.setMem_id(rs.getString("mem_id"));
				member.setMem_name(rs.getString("mem_name"));
				member.setMem_pwd(rs.getString("mem_pwd"));
				member.setMem_phone(rs.getString("mem_phone"));
				member.setMem_email(rs.getString("mem_email"));
				member.setReg_date(rs.getString("reg_date"));
			}
			return member;
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e){}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}
		}
	}
	
	// 회원등록 
	@Override
	public int insertMember(Connection conn, Member member) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();  //StringBuidler나 StringBuffer나 똑같과 상관없다.
		
		sb.append(" INSERT 	INTO tb_member(mem_id, mem_name, mem_pwd, mem_phone, mem_email, reg_date) ");
		sb.append("		VALUES(?, ?, ?, ?, ? , sysdate) ");
		
		try{
			pstmt = conn.prepareStatement(sb.toString());
			
			int i = 1;
			pstmt.setString(i++, member.getMem_id());
			pstmt.setString(i++, member.getMem_name());
			pstmt.setString(i++, member.getMem_pwd());
			pstmt.setString(i++, member.getMem_phone());
			pstmt.setString(i++, member.getMem_email());
			int cnt = pstmt.executeUpdate(); // mybatis에서 <select id = ""></select> 가 executeUpdate() 역할을 한다.
			return cnt;
			
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException e){}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}
		}
	}
	
	// 회원수정 , String mem_id, String mem_name, String mem_pwd 이렇게 하지 않고 Member member로 하나로 해결!!
	/* (non-Javadoc)
	 * @see com.study.member.dao.IMemberDao#updateMember(java.sql.Connection, com.study.member.vo.Member)
	 */
	@Override
	public int updateMember(Connection conn, Member member) throws SQLException { 	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		sb.append(" UPDATE tb_member	");
		sb.append("		SET mem_name = ? ");
		sb.append("		, 	 mem_phone = ? ");
		sb.append("		, 	 mem_email = ? ");
		sb.append("	WHERE mem_id = ? ");
		
		try{
			pstmt = conn.prepareStatement(sb.toString());
			int i = 1;
			pstmt.setString(i++, member.getMem_name());
			pstmt.setString(i++, member.getMem_phone());
			pstmt.setString(i++, member.getMem_email());
			pstmt.setString(i++, member.getMem_id());
			int cnt = pstmt.executeUpdate();
			return cnt;
		}finally {
			//PreparedStatement 꼭 닫기 위해서 finally를 써야 한다.
			if(rs!=null) try {rs.close();} catch(SQLException e){}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}
		}
	}
	
	/* (non-Javadoc)
	 * @see com.study.member.dao.IMemberDao#deleteMember(java.sql.Connection, com.study.member.vo.Member)
	 */
	@Override
	public int deleteMember(Connection conn, Member member) throws SQLException { 	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		sb.append(" DELETE FROM tb_member	");
		sb.append("	WHERE mem_id = ? ");
		
		try{
			pstmt = conn.prepareStatement(sb.toString());
			int i = 1;
			pstmt.setString(i++, member.getMem_id());
			
			int cnt = pstmt.executeUpdate();
			return cnt;
		}finally {
			//PreparedStatement 꼭 닫기 위해서 finally를 써야 한다.
			if(rs!=null) try {rs.close();} catch(SQLException e){}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException e){}
		}
	}
}