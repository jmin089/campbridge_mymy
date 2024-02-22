package com.java.www.service;

import java.util.List;
import java.util.Map;

import com.java.www.dto.Product_rentcartDto;

public interface RentService {

	// 선택상품 장바구니에 넘기기
	void rentCart_list(String proId, String id);
	
	// 장바구니에 리스트
	List<Product_rentcartDto> rentCart(String proId);

	// 품목삭제 버튼으로 해당품목만 삭제
	void deleteOneCart(String cart_id);

	// 선택상품 삭제하기
	void deleteCart(String cart_id);

	// 수량변경
	Map<String, Object> updatecount(String cart_id, int cart_count, String stat);

	//중복품목 업데이트
	void rentUpdate(String proId);

}
