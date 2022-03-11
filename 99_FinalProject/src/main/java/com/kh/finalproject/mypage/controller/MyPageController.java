package com.kh.finalproject.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.member.model.service.MemberService;


@RequestMapping("/mypage")
@Controller
public class MyPageController {

	@Autowired
	private MemberService service;
	
	@GetMapping("/rent")
	public void rent() {
	}

	@GetMapping("/cart")
	public void cart() {
	}
	
	@GetMapping("/updatePwd")
	public void updatePwd() {
	}
	
	@GetMapping("/delete")
	public void delete() {
	}
	
}