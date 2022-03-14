package com.kh.finalproject.freeboard.model.service;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalproject.freeboard.model.mapper.FreeBoardMapper;
import com.kh.finalproject.freeboard.model.vo.FreeBoard;
import com.kh.finalproject.freeboard.model.vo.Reply;
import com.kh.finalproject.common.util.PageInfo;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	@Autowired
	private FreeBoardMapper mapper;

	@Override
	public int saveBoard(FreeBoard board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int saveReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String saveFile(MultipartFile upfile, String savePath) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getBoardCount(Map<String, String> param) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<FreeBoard> getBoardList(PageInfo pageInfo, Map<String, String> param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FreeBoard findByNo(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteFile(String filePath) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int deleteBoard(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(int no) {
		// TODO Auto-generated method stub
		return 0;
	}


}
