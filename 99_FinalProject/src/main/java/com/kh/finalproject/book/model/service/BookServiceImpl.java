package com.kh.finalproject.book.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalproject.book.model.mapper.BookMapper;
import com.kh.finalproject.book.model.vo.Book;
import com.kh.finalproject.book.model.vo.Score;
import com.kh.finalproject.common.util.PageInfo;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookMapper mapper;

	@Override
	public int getBookCount() {
		return mapper.selectBookCount();
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<Book> getAllBookList(PageInfo pageInfo) {
		List<Book> list = mapper.selectAllBookList();	// 전체 도서 검색
		
		for (Book book : list) {	// 각 도서 별로 평점의 평균을 계산하여 입력
			book.setBAvgScore(mapper.selectBookAvgScore(book.getBNo()));
			
			int result = mapper.updateBookAvgScore(book);
			
			if (result > 0) {
				System.out.println("도서 평점 업데이트 성공!");
			} else {
				System.out.println("도서 평점 업데이트 실패...");
			}
		}
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectAllBookList(rowBounds);
	}

	@Override
	public int getBookCount(String option, String query) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("option", option);
		map.put("query", query);
		
		return mapper.selectBookCountByOption(map);
	}

	@Override
	public List<Book> getBookList(String category, String option, String query, String sort, PageInfo pageInfo) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("category", category);
		map.put("option", option);
		map.put("query", query);
		map.put("sort", sort);
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectBookList(map, rowBounds);
	}

	@Override
	public Book findBookByNo(int bNo) {
		return mapper.selectBook(bNo);
	}

	@Override
	public List<Score> getScoreList(int bNo) {
		return mapper.selectScoreList(bNo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertScore(int bNo, int uNo, String sContent, int score) {
		Score s = new Score();
		s.setBNo(bNo);
		s.setUNo(uNo);
		s.setSContent(sContent);
		s.setScore(score);
		
		return mapper.insertScore(s);
	}
	
	
}
