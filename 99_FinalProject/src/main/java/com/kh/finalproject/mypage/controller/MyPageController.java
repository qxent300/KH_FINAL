package com.kh.finalproject.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalproject.common.util.PageInfo;
import com.kh.finalproject.member.model.vo.Member;
import com.kh.finalproject.mypage.model.service.MyPageService;
import com.kh.finalproject.mypage.model.vo.Cart;
import com.kh.finalproject.mypage.model.vo.Library;
import com.kh.finalproject.mypage.model.vo.Rent;


@RequestMapping("/mypage")
@Controller
public class MyPageController {

	@Autowired
	private MyPageService service;

	@GetMapping("/cart")
	public ModelAndView cart(ModelAndView model, @SessionAttribute(name = "loginMember", required = false) Member loginMember, int bNo) {
		int result = service.addCart(bNo, loginMember.getUNo());
		
		if (result > 0) {
			model.addObject("msg", "장바구니에 추가되었습니다.");	
		} else {
			model.addObject("msg", "장바구니 추가에 실패하였습니다.");
		}
		
		model.addObject("location", "/book/view?bNo=" + bNo);
		model.setViewName("/common/msg");
		
		return model;
	}
	
	@GetMapping("/rent")
	public ModelAndView rent(ModelAndView model, @SessionAttribute(name = "loginMember", required = false) Member loginMember, int bNo) {
		int result = service.addCart(bNo, loginMember.getUNo());
		
		if (result > 0) {
			model.setViewName("redirect:/mypage/cartList");
		} else {
			model.addObject("msg", "대여하기에 실패하였습니다.");
			model.addObject("location", "/book/view?bNo=" + bNo);
			model.setViewName("/common/msg");
		}

		return model;
	}
	
	@GetMapping("/cartList")
	public ModelAndView cartList(ModelAndView model, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		List<Cart> cartList = service.getAllCartList(loginMember.getUNo());
		
		if (cartList.isEmpty()) {
			cartList = null;
		}
		
		model.addObject("cartList", cartList);
		model.setViewName("mypage/cart");
		
		return model;
	}
	
	@GetMapping("/deleteAllCart")
	public ModelAndView deleteAllCart(ModelAndView model, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		int result = service.deleteAllCart(loginMember.getUNo());
		
		if (result > 0) {
			model.addObject("msg", "전체 삭제하였습니다.");	
		} else {
			model.addObject("msg", "실패하였습니다.");
		}
		
		model.addObject("location", "/mypage/cartList");
		model.setViewName("/common/msg");
		
		return model;
	}
	
	@GetMapping("/deleteCart")
	public ModelAndView deleteCart(ModelAndView model, @SessionAttribute(name = "loginMember", required = false) Member loginMember, int cNo) {
		Cart cart = new Cart();
		cart.setCNo(cNo);
		cart.setUNo(loginMember.getUNo());
		
		int result = service.deleteCartByNo(cart);
		
		if (result > 0) {
			model.setViewName("redirect:/mypage/cartList");
		} else {
			model.addObject("msg", "실패하였습니다.");
			model.addObject("location", "/mypage/cartList");
			model.setViewName("/common/msg");
		}
		
		return model;
	}
	
	@PostMapping("/libAddr")
	@ResponseBody
	public List<Library> getLibraryList(String addr) {
		System.out.println(addr);
		
		List<Library> list = service.getLibraryList(addr);
		
		return list;
	}
	
	@GetMapping("/rentAll")
	public ModelAndView rentAll(ModelAndView model, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		List<Cart> cartList = service.getAllCartList(loginMember.getUNo());
		
		for (Cart cart : cartList) {
			int result = service.insertRent(cart);
			
			if (result <= 0) {
				model.addObject("msg", "장바구니 목록 대여하기에 실패하였습니다.");
				model.addObject("location", "/mypage/cartList");
				model.setViewName("/common/msg");
				
				return model;
			}
		}
		
		int result = service.deleteAllCart(loginMember.getUNo());
		
		if (result > 0) {
			model.addObject("msg", "대여하였습니다.");
			model.addObject("location", "/mypage/rentList");
			model.setViewName("/common/msg");
		} else {
			model.addObject("msg", "장바구니 비우기에 실패하였습니다.");
			model.addObject("location", "/mypage/cartList");
			model.setViewName("/common/msg");
		}
		
		return model;
	}
	
	@GetMapping("/rentList")
	public ModelAndView rentList(ModelAndView model, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		int overdueCount = service.getOverdueCount(loginMember.getUNo());
		
		int listCount = service.getRentCount(loginMember.getUNo());
		PageInfo pageInfo = new PageInfo(1, 10, listCount, 10);
		
		List<Rent> rentList = service.getAllRentList(pageInfo, loginMember.getUNo());
		
		if (overdueCount > 0) {
			model.addObject("overdueCount", overdueCount);
		}
		
		model.addObject("rentList", rentList);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("mypage/rent");
		
		return model;
	}
	
	@GetMapping("/returnBook")
	public ModelAndView returnBook(ModelAndView model, int rNo) {
		System.out.println("rNo = " + rNo);
		int result = service.updateRentStatusToReturn(rNo);
		
		if (result > 0) {
			model.addObject("msg", "반납하였습니다.");
		} else {
			model.addObject("msg", "반납에 실패하였습니다.");
		}
		
		model.addObject("location", "/mypage/rentList");
		model.setViewName("/common/msg");
		
		return model;
	}
	
}