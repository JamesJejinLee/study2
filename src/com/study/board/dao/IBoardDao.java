package com.study.board.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.study.board.vo.Board;
import com.study.board.vo.BoardSearch;

public interface IBoardDao {

	int getBoardCount(Connection conn, BoardSearch boardSearch) throws SQLException;

	List<Board> getBoardList(Connection conn, BoardSearch boardSearch) throws SQLException;

	Board getBoard(Connection conn, int bo_no) throws SQLException;

	int insertBoard(Connection conn, Board board) throws SQLException;

	int updateBoard(Connection conn, Board board) throws SQLException;

}