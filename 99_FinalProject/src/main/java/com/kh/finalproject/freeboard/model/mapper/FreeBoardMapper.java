package com.kh.finalproject.freeboard.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.finalproject.freeboard.model.vo.FreeBoard;
import com.kh.finalproject.freeboard.model.vo.Reply;

@Mapper
public interface FreeBoardMapper {

	int selectFreeBoardCount();
	
	List<FreeBoard> selectAllFreeBoardList();
	
	int selectReplyCount(int fbNo);
	
	int updateReplyCount(FreeBoard freeBoard);
	
	List<FreeBoard> selectAllFreeBoardList(RowBounds rowBounds);
	
	List<FreeBoard> selectFreeBoardListByCategory(String fbCategory);
	
	List<FreeBoard> selectFreeBoardList(RowBounds rowBounds);
	
	FreeBoard selectFreeBoardDetail(int fbNo);
	
	int insertFreeBoard(FreeBoard fb);
	
	int updateFreeBoard(FreeBoard fb);
	
	int insertReply(Reply r);
	
	int updateReply(Reply r);
	
	int deleteReply(Reply r);
	
	int deleteFreeBoard(FreeBoard fb);
	
}
