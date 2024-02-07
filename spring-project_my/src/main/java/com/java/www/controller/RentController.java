package com.java.www.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.www.dto.ProductDto;
import com.java.www.service.RentService;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



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
	
	@PostMapping("/cp_Cart")
	public String cp_Cart(@RequestParam() String[] pro_id, Model model) {
		List list = null;
		for (int i = 0; i < pro_id.length; i++) {
	        String proId = pro_id[i]; 
	        list = rentService.rentCart(proId);
	    }
		model.addAttribute("list",list);
		System.out.println("asdfijasdlkfjasdofi : "+list.get(0));
	    return "/rent/cp_Cart";
	}
	
	@PostMapping("/cpRent")
	public String cpRent(@RequestParam() String[] pro_id, Model model) {
		List list = null;
		for (int i = 0; i < pro_id.length; i++) {
			String proId = pro_id[i]; 
			list = rentService.rentCart(proId);
		}
		model.addAttribute("list",list);
		System.out.println("asdfijasdlkfjasdofi : "+list.get(0));
		return "/rent/cp_Cart";
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
