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

	//선택상품 삭제하기
	void cart_delete(String id, String cart_id);

}
