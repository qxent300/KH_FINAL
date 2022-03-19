package com.kh.finalproject.freeboard.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.finalproject.freeboard.model.vo.Board;
import com.kh.finalproject.freeboard.model.vo.Reply;

@Mapper
public interface FreeBoardMapper {

	// paging 처리를 위한 RowBounds 셋팅!
	List<Board> selectBoardList(RowBounds rowBounds, Map<String, String> map);
	
	int selectBoardCount(Map<String, String> map);
	
	Board selectBoardByNo(int boardNo);
	
	int insertBoard(Board board);

	int insertReply(Reply reply);

	int updateBoard(Board board);
	
	int updateReadCount(Board board);
	
	int deleteReply(int no);
	
	int deleteBoard(int no);
	
}
