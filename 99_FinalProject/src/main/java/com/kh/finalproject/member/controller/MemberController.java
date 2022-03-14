package com.kh.finalproject.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalproject.member.model.service.MemberService;
import com.kh.finalproject.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SessionAttributes("loginMember") //loginMember를 model에서 취급할때 Session으로 처리하는 파라미터!
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@GetMapping("/login")
	public void loginPage() {
	}
	
}
