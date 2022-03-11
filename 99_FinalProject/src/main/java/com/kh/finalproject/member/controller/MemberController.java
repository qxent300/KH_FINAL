package com.kh.finalproject.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalproject.member.controller.*;
import com.kh.finalproject.member.model.service.MemberService;
import com.kh.finalproject.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SessionAttributes("loginMember")
@Controller
public class MemberController {
	
	private MemberService service;
	
	@GetMapping(value ="/member/loginPage")
	public String loginPage() {
		log.info("로그인 페이지 이동");
		return "member/login";
	}
	
	@GetMapping(value ="/member/enrollPage")
	public String enrollPage() {
		log.info("로그인 페이지 이동");
		return "member/enroll";
	}
	
	@RequestMapping(value = "member/login", method= {RequestMethod.POST})
	public ModelAndView login(ModelAndView model, String U_ID, String U_PW) {
		log.info("{},{}", U_ID,U_PW);
		
//		Member loginMember = service.login(U_ID, U_PW);
		//test
		Member loginMember = new Member(0, "admin", "1234", U_PW, U_PW, U_PW, U_PW, U_PW);
		if(loginMember != null) {
			model.addObject("loginMember",loginMember); // 어노테이션을 통해 SEssion으로 처리되는 코드
			model.setViewName("redirect:/");
		}else {
			model.addObject("msg","아이디나 패스워드가 일치하지 않습니다.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		log.info("status : " + status.isComplete());
		status.setComplete(); // 세션을 종료하는 코드!
		log.info("status : " + status.isComplete());
		return "redirect:/";
	}
	
	@RequestMapping(value= "member/checkID", method= {RequestMethod.GET})
	public ResponseEntity<Map<String, Object>> checkId(String U_ID){
		log.info(U_ID);
		
		boolean result = service.checkID(U_ID);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("validate", result);
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	@RequestMapping(value= "member/checkNickName", method= {RequestMethod.GET})
	public ResponseEntity<Map<String, Object>> checkNickName(String U_NICKNAME){
		log.info(U_NICKNAME);
		
		boolean result = service.checkNickName(U_NICKNAME);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("confirm", result);
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	@RequestMapping(value = "member/enroll", method= {RequestMethod.POST})
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) {
		log.info("" +member);
		int result = service.userEnroll(member);
		
		if(result > 0) {
			model.addObject("msg", "회원가입이 완료되었습니다.");
			model.addObject("msg", "/");
		}else {
			model.addObject("msg", "회원가입에 실패하였습니다..");
			model.addObject("msg", "/");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	@RequestMapping(value = "member/findUserPwd",method= {RequestMethod.POST})
	public ModelAndView findUserPwd(ModelAndView model, String U_ID, String U_NAME) {
		log.info("{}, {}", U_ID, U_NAME);
		
		String result = service.FindUserPwd(U_ID, U_NAME);
		if(result != null) {
			model.addObject("msg",U_ID + "님의 비밀번호는 : "+ result + "입니다");
			model.addObject("msg", "/");
		}else {
			model.addObject("msg","아이디와 이름이 일치하지 않습니다.");
			model.addObject("msg", "/");
		}
		model.setViewName("common/msg");
		return model;
	}
	
//	naver callback처리
	@RequestMapping(value="/callback", method= {RequestMethod.GET, RequestMethod.POST})
	public String callback(ModelAndView model) {
		log.info("네이버 콜백처리");
		
		return null;
	}

}
