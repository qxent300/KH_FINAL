package com.kh.finalproject.bookboard.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.finalproject.freeboard.model.vo.Board;

@Mapper
public interface BookBoardMapper {

	// paging 처리를 위한 RowBounds 셋팅!
	List<Board> selectBoardList(RowBounds rowBounds, Map<String, String> map);

	int selectBoardCount(Map<String, String> map);

	Board selectBoardByNo(int boardNo);

	int insertBoard(Board board);

	int updateBoard(Board board);

	int updateReadCount(Board board);

	int deleteBoard(int no);
}
