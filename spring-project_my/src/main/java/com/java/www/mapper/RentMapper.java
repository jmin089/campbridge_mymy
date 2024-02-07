package com.java.www.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RentMapper {

	List rentCart(String proId);

}
