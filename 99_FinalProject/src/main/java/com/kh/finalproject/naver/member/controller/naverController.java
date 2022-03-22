package com.kh.finalproject.naver.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.finalproject.book.model.service.BookService;
import com.kh.finalproject.book.model.vo.Book;
import com.kh.finalproject.member.model.service.MemberService;
import com.kh.finalproject.member.model.vo.Member;
import com.kh.finalproject.naver.member.NaverLoginBO;

@SessionAttributes("loginMember")
@Controller
public class naverController {
	@Autowired
	private BookService service2;
	
	@Autowired
	private MemberService service;
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView callback(ModelAndView model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
	System.out.println("여기는 callback");
	OAuth2AccessToken oauthToken;
	oauthToken = naverLoginBO.getAccessToken(session, code, state);
	//1. 로그인 사용자 정보를 읽어온다.
	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	/** apiResult json 구조
	{"resultcode":"00",
	"message":"success",
	"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
	**/
	//2. String형식인 apiResult를 json형태로 바꿈
	JSONParser parser = new JSONParser();
	Object obj = parser.parse(apiResult);
	JSONObject jsonObj = (JSONObject) obj;
	//3. 데이터 파싱
	//Top레벨 단계 _response 파싱
	JSONObject response_obj = (JSONObject)jsonObj.get("response");
	//response의 nickname값 파싱
	String nickname = (String)response_obj.get("nickname");
	String id = (String)response_obj.get("id");
	String name = (String)response_obj.get("name");
	String phone = (String)response_obj.get("mobile");
	Member member = new Member();
	Member findid = service.findById(id);
	if(findid == null) {
		member.setUNickName(nickname);
		member.setUId(id);
		member.setUName(name);
		member.setUPhone(phone);
		int result = service.save(member);
	}
	List<Book> todayBookList = service2.getAllTodayBookList();
	model.addObject("todayBookList", todayBookList);
	
	List<Book> bestsellerList = service2.getBestsellerList();
	model.addObject("bestsellerList", bestsellerList);
	
	List<Book> newBookList = service2.getNewBookList();
	model.addObject("newBookList", newBookList);
	
	model.setViewName("home");
	System.out.println(member.toString());

	//4.파싱 닉네임 세션으로 저장
	model.addObject("loginMember",findid); //세션 생성
	model.addObject("result", apiResult);
	return model;
	
	}


}
