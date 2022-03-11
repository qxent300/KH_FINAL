package com.kh.finalproject.bookboard.model.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalproject.bookboard.model.mapper.BookBoardMapper;
import com.kh.finalproject.common.util.PageInfo;
import com.kh.finalproject.freeboard.model.vo.Board;

@Service
public class BookBoardServiceImpl implements BookBoardService {
	
	@Autowired
	private BookBoardMapper mapper;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int saveBoard(Board board) {
		int result = 0;

		if (board.getNo() == 0) {
			result = mapper.insertBoard(board);
		} else {
			result = mapper.updateBoard(board);
		}
		return result;
	}

	@Override
	public int getBoardCount(Map<String, String> param) {
		Map<String, String> searchMap = new HashMap<String, String>();
		String searchValue = param.get("searchValue");
		System.out.println("searchValue : " + searchValue);
		if (searchValue != null && searchValue.length() > 0) {
			String type = param.get("searchType");
			if (type.equals("title")) {
				searchMap.put("titleKeyword", searchValue);
			}
			else if (type.equals("content")) {
				searchMap.put("contentKeyword", searchValue);
			}
			else if(type.equals("writer")) {
				searchMap.put("writerKeyword", searchValue);
			}
		}
		System.out.println(searchMap);
		return mapper.selectBoardCount(searchMap);
	}

	@Override
	public List<Board> getBoardList(PageInfo pageInfo, Map<String, String> param) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());

		Map<String, String> searchMap = new HashMap<String, String>();
		String searchValue = param.get("searchValue");
		if (searchValue != null && searchValue.length() > 0) {
			String type = param.get("searchType");
			if (type.equals("title")) {
				searchMap.put("titleKeyword", searchValue);
			}
			else if (type.equals("content")) {
				searchMap.put("contentKeyword", searchValue);
			}
			else if(type.equals("writer")) {
				searchMap.put("writerKeyword", searchValue);
			}
		}

		return mapper.selectBoardList(rowBounds, searchMap);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Board findByNo(int boardNo) {
		Board board = mapper.selectBoardByNo(boardNo);
		board.setReadCount(board.getReadCount() + 1);
		mapper.updateReadCount(board);
		return board;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteBoard(int no) {
		Board board = mapper.selectBoardByNo(no);
		try {
			File file = new File(board.getRenamedFileName());
			if (file.exists()) {
				file.delete();
			}
		} catch (Exception e) {}
		return mapper.deleteBoard(no);
	}
}
