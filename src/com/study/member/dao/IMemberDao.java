package com.study.member.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.study.member.vo.Member;

public interface IMemberDao {

	// 회원 목록
	List<Member> getMemberList(Connection conn) throws SQLException;

	// 회원상세 정보 조회
	Member getMember(Connection conn, String mem_id) throws SQLException;

	// 회원등록 
	int insertMember(Connection conn, Member member) throws SQLException;

	// 회원수정 , String mem_id, String mem_name, String mem_pwd 이렇게 하지 않고 Member member로 하나로 해결!!
	int updateMember(Connection conn, Member member) throws SQLException;

	int deleteMember(Connection conn, Member member) throws SQLException;

}