package com.kh.finalproject.bookboard.model.service;

import java.util.List;
import java.util.Map;

import com.kh.finalproject.common.util.PageInfo;
import com.kh.finalproject.freeboard.model.vo.Board;

public interface BookBoardService {

	int saveBoard(Board board);

	int getBoardCount(Map<String, String> param);

	List<Board> getBoardList(PageInfo pageInfo, Map<String, String> param);

	Board findByNo(int boardNo);

	int deleteBoard(int no);
}