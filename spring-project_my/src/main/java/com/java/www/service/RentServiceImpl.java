package com.java.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.www.dto.Product_rentcartDto;
import com.java.www.mapper.RentMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class RentServiceImpl implements RentService{
	
	@Autowired RentMapper rentMapper;
	@Autowired HttpSession session;
	
	// 선택상품 장바구니에 넘기기
	@Override
	public void rentCart_list(String proId, String id) {
		rentMapper.rentCart_list(proId, id);
	}
	//중복품목 업데이트
	@Override
	public void rentUpdate(String proId) {
		rentMapper.updatecount(proId);
	}
	// 장바구니에 리스트
	@Override
	public List<Product_rentcartDto> rentCart(String proId) {
		List<Product_rentcartDto> list = rentMapper.rentCart(proId);
		System.out.println("RentServiceIm plrentCart : "+proId);
		return list;
	}
	// 품목삭제 버튼으로 해당품목만 삭제
	@Override
	public void deleteOneCart(String cart_id) {
		rentMapper.deleteOneCart(cart_id);
		System.out.println("del : "+cart_id);
	}
	// 선택상품 삭제하기
	@Override
	public void deleteCart(String cart_id) {
		rentMapper.deleteCart(cart_id);
		
	}
	// 수량변경
	@Override
	public Map<String, Object> updatecount(String cart_id, int cart_count, String stat) {
		if(stat.equals("countUp")) {
			rentMapper.updatecount_up(cart_id, cart_count);	
		} else {
			rentMapper.updatecount_down(cart_id, cart_count);			
		}
		Map<String, Object> map = new HashMap<>();
		return map;
	}

}
