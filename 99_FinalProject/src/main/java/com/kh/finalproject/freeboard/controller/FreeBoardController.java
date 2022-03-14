package com.kh.finalproject.freeboard.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalproject.freeboard.model.service.FreeBoardService;
import com.kh.finalproject.freeboard.model.vo.FreeBoard;
import com.kh.finalproject.freeboard.model.vo.Reply;
import com.kh.finalproject.common.util.PageInfo;
import com.kh.finalproject.member.model.vo.Member;
import com.kh.finalproject.freeboard.controller.FreeBoardController;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/freeboard")
@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService service;

	@Autowired
	private ResourceLoader resourceLoader; // 파일 다운로드 기능시 활용하는 loader


}
