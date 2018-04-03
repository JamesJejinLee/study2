package com.study.member.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.study.member.vo.Member;
import com.study.util.MyBatisFactory;

public class MemberDaoMyBatis implements IMemberDao {
	
	private String namespace = "com.study.member.dao.IMemberDao.";
	@Override
	public List<Member> getMemberList(Connection conn) throws SQLException {
		// TODO Auto-generated method stub
		SqlSession session = MyBatisFactory.getSqlSession().openSession();
		//openSession() openSession()은 항상 새로운 트랜잭션의 Session을 돌려주며
		try {
			//Dao 구현체를 생성하지 않고, 서비스 단에서 바로 MyBatis 객체를 이용
			//mybatis에서 추가만 mapping 방법
			
			//dao interface = IMemberDao
			IMemberDao memberDao = session.getMapper(IMemberDao.class);
			List<Member> list = memberDao.getMemberList(conn);
			//List<Member> list = session.selectList(namespace + "getMemberList");
			return list;
		} finally {
			session.close();
		}
	}

	@Override
	public Member getMember(Connection conn, String mem_id) throws SQLException {
		SqlSession session = MyBatisFactory.getSqlSession().openSession();
		try {
			Member member = session.selectOne(namespace + "getMember", mem_id);
			return member;
		} finally {
			session.close();
		}
	}

	@Override
	public int insertMember(Connection conn, Member member) throws SQLException {
		SqlSession session = MyBatisFactory.getSqlSession().openSession();
		try {
			int cnt = session.insert(namespace + "insertMember", member); //insert update delete 는 내부 구분용
			// 실제로 실행 될때는 executeExecute? 가 실행 되어야 한다.
			//정보가 담겨 있는 member를 넘겨줘야 update가 작업을 진행 할 수 있다.
			return cnt;
		} finally {
			session.close();
		}
	}

	@Override
	public int updateMember(Connection conn, Member member) throws SQLException {
		SqlSession session = MyBatisFactory.getSqlSession().openSession();
		try {
			int cnt = session.update(namespace + "updateMember", member);
			//정보가 담겨 있는 member를 넘겨줘야 update가 작업을 진행 할 수 있다.
			session.commit(); //DB에 커밋을 때려주고 실행 , 오토커밋이 아닐때는 대비해서
			return cnt;
		} finally {
			session.close();
		}
	}

	@Override
	public int deleteMember(Connection conn, Member member) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
}