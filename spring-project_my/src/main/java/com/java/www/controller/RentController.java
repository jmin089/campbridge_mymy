package com.java.www.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.www.service.RentService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("rent")
public class RentController {
	
	@Autowired RentService rentService;
	@Autowired HttpSession session;
	
	//용품대여 페이지
	@GetMapping("cpRent")
	public String cpRent() {
		return "/rent/cpRent";
	}
	
	//2인용 상세페이지(구현x)
	@GetMapping("cpRent_v1")
	public String cpRent_v1() {
		return "/rent/cpRent_v1";
	}
	
	//3인용 상세페이지(구현x)
	@GetMapping("cpRent_v2")
	public String cpRent_v2() {
		return "/rent/cpRent_v2";
	}
	
	//4인용 상세페이지(구현x)
	@GetMapping("cpRent_v3")
	public String cpRent_v3() {
		return "/rent/cpRent_v3";
	}
	
	//장박구니 페이지
	@GetMapping("cp_Cart")
	public String cp_Cart() {
		return "/rent/cp_Cart";
	}
	
	//주문상세 페이지
	@GetMapping("cp_Cart02")
	public String cp_Cart02() {
		return "/rent/cp_Cart02";
	}
	
	//주문완료 페이지(구현x)
	@GetMapping("cp_Cart03")
	public String cp_Cart03() {
		return "/rent/cp_Cart03";
	}
	

}
