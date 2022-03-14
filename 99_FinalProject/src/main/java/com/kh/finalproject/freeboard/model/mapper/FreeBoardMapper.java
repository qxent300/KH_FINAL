package com.kh.finalproject.freeboard.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.finalproject.freeboard.model.vo.FreeBoard;
import com.kh.finalproject.freeboard.model.vo.Reply;

@Mapper
public interface FreeBoardMapper {

	// paging 처리를 위한 RowBounds 셋팅!
	List<FreeBoard> selectBoardList(RowBounds rowBounds, Map<String, String> map);
	
	int selectBoardCount(Map<String, String> map);
	
	FreeBoard selectBoardByNo(int boardNo);
	
	int insertBoard(FreeBoard board);

	int insertReply(Reply reply);

	int updateBoard(FreeBoard board);
	
	int updateReadCount(FreeBoard board);
	
	int deleteReply(int no);
	
	int deleteBoard(int no);
	
}
