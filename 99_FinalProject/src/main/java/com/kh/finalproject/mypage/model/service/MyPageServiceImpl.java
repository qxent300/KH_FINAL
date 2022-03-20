package com.kh.finalproject.mypage.model.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalproject.common.util.PageInfo;
import com.kh.finalproject.mypage.model.mapper.MyPageMapper;
import com.kh.finalproject.mypage.model.vo.Cart;
import com.kh.finalproject.mypage.model.vo.Library;
import com.kh.finalproject.mypage.model.vo.Rent;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageMapper mapper;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int addCart(int bNo, int uNo) {
		Cart cart = new Cart();
		cart.setBNo(bNo);
		cart.setUNo(uNo);
		
		return mapper.insertCart(cart);
	}

	@Override
	public List<Cart> getAllCartList(int uNo) {
		return mapper.selectAllCartList(uNo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteCartByNo(Cart cart) {
		return mapper.deleteCartByNo(cart);
	}

	@Override
	public List<Library> getLibraryList(String address) {
		return mapper.selectLibraryList(address);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertRent(Cart cart) {
		return mapper.insertRent(cart);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int deleteAllCart(int uNo) {
		return mapper.deleteAllCart(uNo);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int getOverdueCount(int uNo) {
		List<Rent> rentList = mapper.selectAllRentList(uNo);
		
		int overdueCount = 0;
		
		for (Rent rent : rentList) {
			if (rent.getRStatus().equals("반납완료") == false) {
				long diffHour = (new Date().getTime() - rent.getStartDate().getTime()) / (60 * 60 * 1000);	// 현재 시간 - 대여 시작 시간
				
				if (diffHour >= 24) {	// 대여한지 하루가 지난 경우 배송중 -> 대여중으로 상태 변경
					mapper.updateRentStatusToRent(rent);
				}
			
			
				if (new Date().getTime() - rent.getEndDate().getTime() > 0) {	// 반납 날짜가 오늘 기준으로 지난 경우 대여중 -> 미반납으로 상태 변경
					mapper.updateRentStatusToOverdue(rent);
				}
			}
			
			if (rent.getRStatus().equals("미반납")) {
				overdueCount++;
			}
		}
		
		return overdueCount;
	}

	@Override
	public int getRentCount(int uNo) {
		return mapper.selectRentCount(uNo);
	}

	@Override
	public List<Rent> getAllRentList(PageInfo pageInfo, int uNo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		List<Rent> rentList = mapper.selectAllRentList(uNo, rowBounds);
		
		List<Rent> rentScoreList = mapper.selectRentScoreList(uNo);
		
		for (Rent rent : rentList) {
			for (Rent rent2 : rentScoreList) {
				if (rent2.getRNo() == rent.getRNo()) {
					rent.setSNo(rent2.getSNo());
				}
			}
		}
		
		return rentList;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int updateRentStatusToReturn(int rNo) {
		return mapper.updateRentStatusToReturn(rNo);
	}

}
