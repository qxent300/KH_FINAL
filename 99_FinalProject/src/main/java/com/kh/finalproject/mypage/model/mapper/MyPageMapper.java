package com.kh.finalproject.mypage.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.finalproject.mypage.model.vo.Cart;
import com.kh.finalproject.mypage.model.vo.Library;
import com.kh.finalproject.mypage.model.vo.Rent;

@Mapper
public interface MyPageMapper {

	int insertCart(Cart cart);
	
	List<Cart> selectAllCartList(int uNo);
	
	int deleteCartByNo(Cart cart);
	
	List<Library> selectLibraryList(String address);

	int insertRent(Cart cart);
	
	int deleteAllCart(int uNo);
	
	int selectRentCount(int uNo);
	
	int updateRentStatusToRent(Rent rent);
	
	int updateRentStatusToOverdue(Rent rent);
	
	List<Rent> selectAllRentList(int uNo);
	
	List<Rent> selectAllRentList(int uNo, RowBounds rowBounds);
	
	List<Rent> selectRentScoreList(int uNo);
	
	int updateRentStatusToReturn(int rNo);
	
}
