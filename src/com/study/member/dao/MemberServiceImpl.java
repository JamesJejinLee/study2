package com.study.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import com.study.member.vo.Member;
import com.study.member.dao.MemberDaoJDBC;

public class MemberServiceImpl {
	IMemberDao memberDao = new MemberDaoMyBatis();
	
	public List<Member> getMemberList() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			List<Member> list = memberDao.getMemberList(conn);
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("회원 조회 오류 ", e);
		}
		finally {
			if(conn!=null) try {conn.close();} catch(SQLException e){}
		}
	}
	
	public Member getMember(String mem_id) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			Member member = memberDao.getMember(conn, mem_id);
			return member;
		}catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("회원 상세 오류 ", e);
		}
		finally {
			if(conn!=null) try {conn.close();} catch(SQLException e){}
		}
	}
	
	public int modifyMember(Member member) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			int cnt = memberDao.updateMember(conn, member);
			return cnt;
		}catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("회원수정 오류 ", e);
		}
		finally {
			if(conn!=null) try {conn.close();} catch(SQLException e){}
		}
	}
	
	public int insertMember(Member member) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			int cnt = memberDao.insertMember(conn, member);
			return cnt;
		}catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("회원수정 오류 ", e);
		}
		finally {
			if(conn!=null) try {conn.close();} catch(SQLException e){}
		}
	}
	//
	public int deleteMember(Member member) {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
			int cnt = memberDao.deleteMember(conn, member);
			return cnt;
		}catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("회원수정 오류 ", e);
		}
		finally {
			if(conn!=null) try {conn.close();} catch(SQLException e){}
		}
	}
}