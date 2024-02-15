package com.java.www.service;

import java.util.List;

import com.java.www.dto.Product_rentcartDto;

public interface RentService {

	// 선택상품 장바구니에 넘기기
	void rentCart_list(String proId, String id);
	
	// 장바구니에 리스트
	List<Product_rentcartDto> rentCart(String proId);

	// 선택상품 삭제하기
	void deleteCart(String id, String cart_id);




}
