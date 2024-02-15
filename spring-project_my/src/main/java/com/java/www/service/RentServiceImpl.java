package com.java.www.service;

import java.util.List;

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
	// 장바구니에 리스트
	@Override
	public List<Product_rentcartDto> rentCart(String proId) {
		List<Product_rentcartDto> list = rentMapper.rentCart(proId);
		System.out.println("RentServiceIm plrentCart : "+proId);
		return list;
	}
	// 선택상품 삭제하기
	@Override
	public void deleteCart(String id, String cart_id) {
		rentMapper.cart_delete(id, cart_id);
		
	}

}
