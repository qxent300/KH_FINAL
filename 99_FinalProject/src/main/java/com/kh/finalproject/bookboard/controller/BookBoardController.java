package com.kh.finalproject.bookboard.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalproject.bookboard.model.service.BookBoardService;
import com.kh.finalproject.bookboard.model.vo.BookBoard;
import com.kh.finalproject.common.util.PageInfo;
import com.kh.finalproject.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/bookboard")
@Controller
public class BookBoardController {

	@Autowired
	private BookBoardService service;

	@GetMapping("/list")
	public ModelAndView list(ModelAndView model,
			@RequestParam(value="page", required = false, defaultValue = "1") int page) {

		List<BookBoard> list1 = service.getBookBoardListByRecommendCount();
		List<Integer> bbNoList = new ArrayList<Integer>();
		
		for (BookBoard bb : list1) {
			bbNoList.add(bb.getBbNo());
		}
		
		PageInfo pageInfo = new PageInfo(page, 10, service.getBookBoardCount(), 8);
		List<BookBoard> list2 = service.getAllBookBoardList(pageInfo, bbNoList);

		model.addObject("list1", list1);
		model.addObject("list2", list2);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/bookboard/list");
		
		return model;
	}
	
	@GetMapping("/view")
	public ModelAndView view(ModelAndView model, int bbNo) {
		BookBoard bookBoard = service.getBookBoardByNo(bbNo);

		model.addObject("bookBoard", bookBoard);
		model.addObject("recommendCount", bookBoard.getBbRecommendCount());
		model.setViewName("/bookboard/view");

		return model;
	}
	
	@PostMapping("/recommendPlus")
	@ResponseBody
	public int recommendPlus(int bbNo) {
		return service.updateRecommendPlus(bbNo);
		
	}
	
	@PostMapping("/recommendMinus")
	@ResponseBody
	public int recommendMinus(int bbNo) {
		return service.updateRecommendMinus(bbNo);
		
	}
	
	@GetMapping("/write")
	public void writeView() {
		log.info("게시글 작성 요청페이지");
		//return "bookboard/write"; 
	}
	
	@PostMapping("/write")
	public ModelAndView write(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, 
			@ModelAttribute BookBoard bookBoard) {
		log.info("게시글 작성 요청");

		if (loginMember.getUNo() == (bookBoard.getUNo()) == false) {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/");
			model.setViewName("/common/msg");
			return model;
		}
		
		bookBoard.setUNo(loginMember.getUNo());
		
		System.out.println(bookBoard);

		int result = service.saveBookBoard(bookBoard);

		if (result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/bookboard/list");
		} else {
			model.addObject("msg", "게시글이 등록을 실패하였습니다.");
			model.addObject("location", "/bookboard/list");
		}

		model.setViewName("/common/msg");
		
		return model;
	}
	
	@GetMapping("/update")
	public ModelAndView updateView(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("no") int bbNo) {
		
		BookBoard bookboard = service.getBookBoardByNo(bbNo);
		
		if (loginMember.getUNo() == bookboard.getUNo()) {
			model.addObject("bookboard", bookboard);
			model.setViewName("bookboard/update");
		} else {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/bookBoard/list");
			model.setViewName("/common/msg");
		}
		
		return model;
	}
	
	@PostMapping("/update")
	public ModelAndView update(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, 
			@ModelAttribute BookBoard bookBoard) {
		
		log.info("게시글 업데이트 요청");
		
		if (loginMember.getUNickName().equals(bookBoard.getUNickName()) == false) {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/bookboard/list");
			model.setViewName("/common/msg");
			return model;
		}
		
		System.out.println(bookBoard);
		
		int result = service.saveBookBoard(bookBoard);
		
		if (result > 0) {
			model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
			model.addObject("location", "/bookboard/view?no=" + bookBoard.getBbNo());
		} else {
			model.addObject("msg", "게시글이 수정에 실패하였습니다.");
			model.addObject("location", "/bookboard/update?no=" + bookBoard.getBbNo());
		}
		
		model.setViewName("/common/msg");
		
		return model;
	}
	
	@RequestMapping("/delete")
	public ModelAndView deleteBoard(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, 
			int bbNo) {
//		log.info("글 삭제 요청");
		
		int result = service.deleteBookBoard(bbNo);
		
		if (result > 0) {
			model.addObject("msg", "게시글이 삭제되었습니다.");
			model.addObject("location", "/bookboard/list");
		} else {
			model.addObject("msg", "게시글 삭제에 실패하였습니다.");
			model.addObject("location", "/bookboard/list");
		}
		model.setViewName("/common/msg");
		
		return model;
	}
	
//	@RequestMapping("/updateLike")
//	public ModelAndView updateLike(ModelAndView model,
//			@SessionAttribute(name = "loginMember", required = false) Member loginMember, 
//			@ModelAttribute Like like
//			) {
////		log.info("추천 요청");
//		
//			int likeCheck = service.lCheck(bbNo, uNo);
//			
//			if(likeCheck == 0) {
//				//좋아요 처음누름
//				service.insertLike(bbNo, uNo); //like테이블 삽입
//				service.updateLike(bbNo);	//게시판테이블 +1
//				service.updateLikeCheck(bbNo, uNo);//like테이블 구분자 1
//			}else if(likeCheck == 1) {
//				service.updateLikeCheckCancel(bbNo, uNo); //like테이블 구분자0
//                service.updateLikeCancel(bbNo); //게시판테이블 - 1
//				service.deleteLike(bbNo, uNo); //like테이블 삭제
//			}
//			return likeCheck;
//	}

}
