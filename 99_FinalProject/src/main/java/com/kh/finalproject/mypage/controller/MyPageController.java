package com.kh.finalproject.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalproject.book.model.service.BookService;
import com.kh.finalproject.book.model.vo.Book;
import com.kh.finalproject.member.model.vo.Member;
import com.kh.finalproject.mypage.model.service.MyPageService;
import com.kh.finalproject.mypage.model.vo.Cart;
import com.kh.finalproject.mypage.model.vo.Rent;

@RequestMapping("/mypage")
@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	@Autowired
	private BookService service2;
	
	@GetMapping("/rent")
	public void rent() {
	}

	@GetMapping("/cart")
	public void cart() {
	}
	
	@PostMapping("/cart")
	public ModelAndView insertCart(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, @ModelAttribute Cart cart) {
		cart.setUNo(loginMember.getUNo());

		int result = service.addCart(cart);

		if (result > 0) {
			Book book = service2.findBookByNo(cart.getBNo());
			model.addObject("book", book);
			model.setViewName("/mypage/cart");
		} else {
			model.addObject("msg", "카트에 담을 수 없습니다.");
			model.addObject("location", "/");
			model.setViewName("/common/msg");
		}
		return model;
	}
	
	@PostMapping("/rent")
	public ModelAndView insertRent(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, @ModelAttribute Rent rent) {
		rent.setUNo(loginMember.getUNo());

		int result = service.insertRent(rent);

		if (result > 0) {
			Book book = service2.findBookByNo(rent.getBNo());
			model.addObject("book", book);
			model.setViewName("/mypage/rent");
		} else {
			model.addObject("msg", "카트에 담을 수 없습니다.");
			model.addObject("location", "/");
			model.setViewName("/common/msg");
		}
		return model;
	}
	
	@GetMapping("/updatePwd")
	public void updatePwd() {
	}
	
	@GetMapping("/delete")
	public void delete() {
	}
	
}