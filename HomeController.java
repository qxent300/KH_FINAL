package com.kh.finalproject;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalproject.book.model.service.BookService;
import com.kh.finalproject.book.model.vo.Book;
import com.kh.finalproject.common.util.PageInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BookService service;

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	
	@RequestMapping(value = "searchlist")    //세부적인 url mapping
    public ModelAndView list(//RequestParam으로 옵션, 키워드, 페이지의 기본값을 각각 설정해준다.
            
            @RequestParam(defaultValue="1") int currentPage,
 
            @RequestParam(defaultValue="title") String search_option, //기본 검색 옵션값을 작성자로 한다.
 
            @RequestParam(defaultValue="") String keyword //키워드의 기본값을 ""으로 한다.
 
            )
             throws Exception{
        
        //레코드 갯수를 계산
        int count = 100;
        
//        int currentPage, int pageLimit, int listCount, int listLimit
        //페이지 관련 설정, 시작번호와 끝번호를 구해서 각각 변수에 저장한다.
        PageInfo pageInfo = new PageInfo(currentPage, count, currentPage, count);
        int start = pageInfo.getStartPage();
        int end =  pageInfo.getEndPage();
             
//map에 저장하기 위해 list를 만들어서 검색옵션과 키워드를 저장한다.
        List<Book> list = service.getAllBookList(pageInfo);
        
        ModelAndView mav = new ModelAndView();
        Map<String,Object> map = new HashMap<String, Object>();    //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정
        
        map.put("list", list);                         //map에 list(게시글 목록)을 list라는 이름의 변수로 자료를 저장함.
        map.put("pageInfo", pageInfo);
        map.put("count", count);
        map.put("search_option", search_option);
        map.put("keyword", keyword);
        mav.addObject("map", map);                    //modelandview에 map를 저장
        
        System.out.println("map : "+map);
        mav.setViewName("book/searchlist");                //자료를 넘길 뷰의 이름
        
        return mav;    //게시판 페이지로 이동
    
    }
	
}