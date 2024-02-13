package com.java.www.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.java.www.dto.Product_rentcartDto;

@Mapper
public interface RentMapper {

	List<Product_rentcartDto> rentCart(String proId);

	//선택상품 삭제하기
	int cart_delete(String cart_id);

	void rentCart_list(String proId, String id);

}
