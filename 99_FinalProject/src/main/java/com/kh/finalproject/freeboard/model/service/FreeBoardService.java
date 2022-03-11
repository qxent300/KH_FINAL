package com.kh.finalproject.freeboard.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.finalproject.freeboard.model.vo.Board;
import com.kh.finalproject.freeboard.model.vo.Reply;
import com.kh.finalproject.common.util.PageInfo;

public interface FreeBoardService {

	int saveBoard(Board board);

	int saveReply(Reply reply);

	String saveFile(MultipartFile upfile, String savePath);

	int getBoardCount(Map<String, String> param);

	List<Board> getBoardList(PageInfo pageInfo, Map<String, String> param);

	Board findByNo(int boardNo);

	void deleteFile(String filePath);

	int deleteBoard(int no);

	int deleteReply(int no);

}
