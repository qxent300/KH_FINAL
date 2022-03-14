package com.kh.finalproject.bookboard.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalproject.bookboard.model.mapper.BookBoardMapper;
import com.kh.finalproject.bookboard.model.vo.BookBoard;
import com.kh.finalproject.common.util.PageInfo;

@Service
public class BookBoardServiceImpl implements BookBoardService {
	
	@Autowired
	private BookBoardMapper mapper;

	@Override
	public int getBookBoardCount() {
		return mapper.selectBookBoardCount();
	}

	@Override
	public List<BookBoard> getBookBoardListByRecommendCount() {
		return mapper.selectBookBoardListByRecommendCount();
	}

	@Override
	public List<BookBoard> getAllBookBoardList(PageInfo pageInfo, List<Integer> bbNoList) {
		Map<String, List<Integer>> map = new HashMap<>();
		map.put("filterList", bbNoList);
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectAllBookBoardList(map, rowBounds);
	}

	@Override
	public BookBoard getBookBoardByNo(int bbNo) {
		return mapper.selectBookBoardByNo(bbNo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertBookBoard(BookBoard bb) {
		return mapper.insertBookBoard(bb);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateBookBoard(BookBoard bb) {
		return mapper.updateBookBoard(bb);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteBookBoard(int bbNo) {
		return mapper.deleteBookBoard(bbNo);
	}

}
