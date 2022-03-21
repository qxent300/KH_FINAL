package com.kh.finalproject.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalproject.member.model.service.MemberService;
import com.kh.finalproject.member.model.vo.Member;
import com.kh.finalproject.mypage.model.service.MyPageBookBoardService;
import com.kh.finalproject.mypage.model.vo.MyPageBookVo;
import com.kh.finalproject.mypage.model.vo.MyPagePagingVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/myPageBook")
@Controller
public class MyPageBookBoardController {

	
	@Autowired
    private MyPageBookBoardService service;
	
	@Autowired
	private MemberService memberService;
	
	//마이페이지-독서일지 list
    @RequestMapping(value="/MyPageBookBoardList.do", method=RequestMethod.GET)
    public ModelAndView MyPageBookBoardList(ModelAndView model, 
    										MyPagePagingVo vo,
    										@RequestParam(value="nowPage", required=false)String nowPage,
    										@RequestParam(value="cntPerPage", required=false)String cntPerPage,
    										@RequestParam(value="loginMember", required=false)String loginMember) {
        
    	
        List<MyPageBookVo> list = service.myPageBookBoardList(nowPage, cntPerPage, loginMember);
        int total = service.countBoard();
        vo = new MyPagePagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        model.addObject("list", list);
        model.addObject("paging", vo);
        model.setViewName("mypage/myPageBookBoard");
        
        return model;
    }
    
    //마이페이지 독서일지 삭제버튼
    @ResponseBody
    @RequestMapping(value="/delete.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public int folderDelete(HttpServletRequest request, 
    						@RequestParam(value="valueArr[]") List<String> valueArr) throws Exception {
        int result = 0;
        String checkNum = "";

        for(String str : valueArr){
        checkNum = str;
        service.deleteMyPage(checkNum);
        
        }
      return result;
    }
    
    //memberView
    @GetMapping("/myPageMemberView")
	public String myPageMemberView() {
		return "mypage/myPageMemberView";
	}
    
    //마이페이지 회원정보수정
    @RequestMapping(value="/myPageMemberUpdate.do", method=RequestMethod.POST)
    public ModelAndView MyPageMemberUpdate(ModelAndView model,
    										HttpServletRequest request,
    										@ModelAttribute Member member,
    										@SessionAttribute(name ="loginMember", required = false) Member loginMember) {
    	
    	int result = service.myPageMemberUpdate(request);
    	member.setUNo(loginMember.getUNo());
    	
    	if(result > 0) {
    		model.addObject("msg","회원정보를 수정하였습니다.");
    		model.addObject("loginMember", service.memberData(member.getUId()));
    		model.addObject("location", "/myPageBook/myPageMemberView");
    	}else {
    		model.addObject("msg","회원정보를 수정에 실패하였습니다.");
    		model.addObject("location", "/myPageBook/myPageMemberView");
    	}
		model.setViewName("common/msg");
        return model;
    }
    
    @ResponseBody
	@RequestMapping(value = "/pwdUpdate.do", produces = "application/json; charset=utf-8")
	public String pwdUpdate(@RequestParam(value="str") String str) {
    	
    	int result = service.pwdUpdate(str);
    	String strResult = service.pwdSearch(str);
    	
    	return strResult;
    	
    	
    }
    
    
    @GetMapping("/myPageBookReply")
	public String myPageBookReply() {
		return "mypage/myPageBookReply";
	}
    
    //reply
    /*@RequestMapping(value="/myPageBookReply.do", method=RequestMethod.GET)
   	public ModelAndView MyPageBookReply(ModelAndView model, 
										MyPagePagingVo vo,
										@RequestParam(value="nowPage", required=false)String nowPage,
										@RequestParam(value="cntPerPage", required=false)String cntPerPage,
										@RequestParam(value="loginMember", required=false)String loginMember) {
    		

				List<MyPageBookVo> listReply = service.myPageBookReply(nowPage, cntPerPage, loginMember);
				int total = service.countBoard();
				vo = new MyPagePagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				model.addObject("listReply", listReply);
				model.addObject("paging", vo);
				model.setViewName("mypage/myPageBookReply");
				
				return model;
   	}*/

    @ResponseBody
    @RequestMapping(value="/replyList.do", produces = "application/json; charset=utf-8")
    public Map<String, Object> replyList(@RequestParam(value="uNo", required=false)int uNo,
    									 @RequestParam(value="clickPage", required=false)int clickPage) {
    	Map<String, Object> resultMap = service.replyMap(uNo, clickPage);
    	
    	return resultMap;
    }
   
    
}
