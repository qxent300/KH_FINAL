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
	public int getFreeBoardCount() {
		return mapper.selectFreeBoardCount();
	}

	@Override
	public void getAllFreeBoardList() {	// 게시글 별로 댓글 수를 업데이트하여 전체 게시글을 조회하는 코드로 반드시 먼저 실행해야 한다.
		List<FreeBoard> list = mapper.selectAllFreeBoardList();
		
		for (FreeBoard freeBoard : list) {
			int replyCount = mapper.selectReplyCount(freeBoard.getFbNo());
			
			freeBoard.setFbReplyCount(replyCount);
			
			int result = mapper.updateReplyCount(freeBoard);
			
			if (result > 0) {
				System.out.println("댓글 수 업데이트 성공!");
			} else {
				System.out.println("댓글 수 업데이트 실패...");
			}
		}
	}

	@Override
	public List<FreeBoard> getFreeBoardListByCategory(String fbCategory) {
		getAllFreeBoardList();	// 게시글 조회시 먼저 실행
		
		return mapper.selectFreeBoardListByCategory(fbCategory);
	}

	@Override
	public List<FreeBoard> getFreeBoardList(PageInfo pageInfo) {
		getAllFreeBoardList();	// 게시글 조회시 먼저 실행
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectFreeBoardList(rowBounds);
	}

	@Override
	public FreeBoard getFreeBoardDetail(int fbNo) {
		return mapper.selectFreeBoardDetail(fbNo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertFreeBoard(FreeBoard fb) {
		return mapper.insertFreeBoard(fb);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateFreeBoard(FreeBoard fb) {
		return mapper.updateFreeBoard(fb);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertReply(Reply r) {
		int result = mapper.insertReply(r);
		
		if (result > 0) {
			System.out.println("댓글 입력 성공!");
		} else {
			System.out.println("댓글 입력 실패...");
		}
		
		int replyCount = mapper.selectReplyCount(r.getFbNo());	// 댓글 입력 후 댓글 수 변경을 위한 코드
		FreeBoard fb = new FreeBoard();
		fb.setFbNo(r.getFbNo());
		fb.setFbReplyCount(replyCount);

		return mapper.updateReplyCount(fb);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateReply(Reply r) {
		return mapper.updateReply(r);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteReply(Reply r) {
		int result = mapper.deleteReply(r);
		
		if (result > 0) {
			System.out.println("댓글 삭제 성공!");
		} else {
			System.out.println("댓글 삭제 실패...");
		}
		
		int replyCount = mapper.selectReplyCount(r.getFbNo());	// 댓글 삭제 후 댓글 수 변경을 위한 코드
		FreeBoard fb = new FreeBoard();
		fb.setFbNo(r.getFbNo());
		fb.setFbReplyCount(replyCount);

		return mapper.updateReplyCount(fb); 
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteFreeBoard(FreeBoard fb) {
		return mapper.deleteFreeBoard(fb);
	}
	
}
