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

@Service
public class BookBoardServiceImpl implements BookBoardService {
	
	@Autowired
	private BookBoardMapper mapper;

}
