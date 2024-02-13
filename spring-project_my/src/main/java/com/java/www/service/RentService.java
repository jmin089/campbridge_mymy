package com.java.www.service;

import java.util.List;

import com.java.www.dto.Product_rentcartDto;

public interface RentService {

	List<Product_rentcartDto> rentCart(String proId);

	//선택상품 삭제하기
	String cart_delete(String cart_id);

	void rentCart_list(String proId, String id);

}
