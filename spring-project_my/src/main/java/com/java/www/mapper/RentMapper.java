package com.java.www.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.java.www.dto.Product_rentcartDto;

@Mapper
public interface RentMapper {

	// 선택상품 장바구니에 넘기기
	void rentCart_list(String proId, String id);
	
	// 장바구니에 리스트
	List<Product_rentcartDto> rentCart(String proId);

	// 품목삭제 버튼으로 해당품목만 삭제
	void deleteOneCart(String cart_id);

	// 선택상품 삭제하기
	void deleteCart(String cart_id);

	// 수량변경
	void updatecount_up(String cart_id, int cart_count);
	void updatecount_down(String cart_id, int cart_count);
	void updatecount(String cart_id);
	
}
