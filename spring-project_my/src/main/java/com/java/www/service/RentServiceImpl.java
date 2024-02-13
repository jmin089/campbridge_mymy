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
	
	@Override
	public List<Product_rentcartDto> rentCart(String proId) {
		List<Product_rentcartDto> list = rentMapper.rentCart(proId);
		System.out.println("RentServiceIm plrentCart : "+proId);
		return list;
	}

	//선택상품 삭제하기
	@Override
	public String cart_delete(String cart_id) {
		String result = "";
		int re_rent = rentMapper.cart_delete(cart_id);
		System.out.println("RentServiceImpl cart_delete cart_id :"+cart_id);
		return result+re_rent;
	}

	@Override
	public void rentCart_list(String proId, String id) {
		rentMapper.rentCart_list(proId, id);
	}

}
