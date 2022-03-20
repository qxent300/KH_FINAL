package com.kh.finalproject.book.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalproject.book.model.service.BookService;
import com.kh.finalproject.book.model.vo.Book;
import com.kh.finalproject.book.model.vo.Score;
import com.kh.finalproject.common.util.PageInfo;
import com.kh.finalproject.member.model.vo.Member;

@RequestMapping("/book")
@Controller
public class BookController {
	
	@Autowired
	private BookService service;

	@GetMapping(value = "/search")
	public ModelAndView bookSearch(ModelAndView model, @RequestParam Map<String, String> param) {
		int page = 1;
		if (param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		
		String option = param.get("option");
		String query = param.get("query");
		String category = param.get("category");
		String sort = param.get("sort");
		
		if(query == null) {
			PageInfo pageInfo = new PageInfo(page, 10, service.getBookCount(), 12);
			List<Book> list = service.getAllBookList(pageInfo);
			
			System.out.println("list :" + list);
			
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
		}else {
			PageInfo pageInfo = new PageInfo(page, 10, service.getBookCount(category, option, query), 12);
			List<Book> list = service.getBookList(category, option, query, sort, pageInfo);
			System.out.println("list :" + list);
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
		}
		
		model.setViewName("book/search");
		return model;
	}
	
	@RequestMapping(value = "searchlist")    //세부적인 url mapping
	public ModelAndView list(// RequestParam으로 옵션, 키워드, 페이지의 기본값을 각각 설정해준다.
			@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "title") String search_option, // 기본 검색 옵션값을 작성자로 한다.
			@RequestParam(defaultValue = "") String keyword // 키워드의 기본값을 ""으로 한다.
	) throws Exception {
		
		// 레코드 갯수를 계산
		int count = 100;

//        int currentPage, int pageLimit, int listCount, int listLimit
		// 페이지 관련 설정, 시작번호와 끝번호를 구해서 각각 변수에 저장한다.
		PageInfo pageInfo = new PageInfo(currentPage, count, currentPage, count);
		int start = pageInfo.getStartPage();
		int end = pageInfo.getEndPage();

//map에 저장하기 위해 list를 만들어서 검색옵션과 키워드를 저장한다.
		List<Book> list = service.getAllBookList(pageInfo);
		ModelAndView model = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>(); // 넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를
																	// 지정
		map.put("list", list); // map에 list(게시글 목록)을 list라는 이름의 변수로 자료를 저장함.
		map.put("pageInfo", pageInfo);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);

		model.addObject("map", map); // modelandview에 map를 저장
		List<Book> searchList = service.getSearchBookList(keyword, search_option);
		model.addObject("list", searchList);
		System.out.println("map : " + map);
		model.setViewName("book/searchlist"); // 자료를 넘길 뷰의 이름

		return model; // 게시판 페이지로 이동
	}
	
	@GetMapping("/view")
	public ModelAndView view(ModelAndView model, int bNo) {
		Book book = service.findBookByNo(bNo);

		int scoreCount = 0;
		String scoreAvg = "0.0";
		int scoreAvgs = 0;
		try {
			int sum = 0;
			scoreCount = book.getReviews().size();
			for (Score s : book.getReviews()) {
				sum += s.getScore();
			}
			scoreAvg = String.format("%.1f", (double) sum / scoreCount);
			scoreAvgs = (int) ((double) sum / scoreCount);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addObject("scoreCount", scoreCount);
		model.addObject("scoreAvg", scoreAvg);
		model.addObject("scoreAvgs", scoreAvgs);
		model.addObject("book", book);
		model.addObject("scoreList", book.getReviews());
		model.setViewName("/book/view");

		return model;
	}

	@PostMapping("/score")
	public ModelAndView insertScore(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, @ModelAttribute Score score) {
		score.setUNo(loginMember.getUNo());

		int result = service.insertScore(score);

		if (result > 0) {
			Book book = service.findBookByNo(score.getBNo());
			model.addObject("book", book);
			model.addObject("scoreList", book.getReviews());
			model.setViewName("redirect:/book/view?bNo="+book.getBNo());
		} else {
			model.addObject("msg", "한줄평을 등록할 수 없습니다.");
			model.addObject("location", "/");
			model.setViewName("/common/msg");
		}
		return model;
	}
}
