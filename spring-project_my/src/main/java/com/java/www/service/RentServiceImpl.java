package com.java.www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.www.mapper.RentMapper;

import jakarta.servlet.http.HttpSession;

@Service
public class RentServiceImpl implements RentService{
	
	@Autowired RentMapper rentMapper;
	@Autowired HttpSession session;
	
	@Override
	public List rentCart(String proId) {
		List list = rentMapper.rentCart(proId);
		return list;
	}

}
