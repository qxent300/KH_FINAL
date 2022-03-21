package com.kh.finalproject.mypage.model.service;

import java.util.List;

import com.kh.finalproject.common.util.PageInfo;
import com.kh.finalproject.mypage.model.vo.Cart;
import com.kh.finalproject.mypage.model.vo.Library;
import com.kh.finalproject.mypage.model.vo.Rent;

public interface MyPageService {

	int addCart(int bNo, int uNo);	// 도서 번호와 사용자 번호를 가져와서 장바구니에 저장
	
	List<Cart> getAllCartList(int uNo);	// 사용자 번호를 통해 해당 사용자의 장바구니 목록을 조회
	
	int deleteCartByNo(Cart cart);	// 장바구니 목록에서 선택한 도서 삭제
	
	List<Library> getLibraryList(String address);	// 주소 검색을 통한 도서관 목록 조회
	
	int insertRent(Cart cart);	// 장바구니에 있는 도서 대여하기
	
	int deleteAllCart(int uNo);	// 대여 후 장바구니 비우기
	
	int getOverdueCount(int uNo);	// 대여현황에서 미반납인 도서 권수 확인(대여현황 목록 조회시 가장 먼저 실행)
	
	int getRentCount(int uNo);	// 대여현황 목록 갯수 확인
	
	List<Rent> getAllRentList(PageInfo pageInfo, int uNo);	// 대여현황 목록 조회(페이징 적용)
	
	int updateRentStatusToReturn(int rNo);	// 도서 반납하기
	
}
