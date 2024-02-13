package com.java.www.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.www.dto.Product_rentcartDto;
import com.java.www.service.RentService;

import jakarta.servlet.http.HttpSession;



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
	public String cp_Cart(@RequestParam(name = "pro_id", required = false) String[] pro_id, Model model) { 
	    String id = (String) session.getAttribute("session_id");
	    String proId = "";
	    List<Product_rentcartDto> list = new ArrayList<>(); // 리스트 초기화
	    if (pro_id != null && pro_id.length > 0) { // pro_id가 null이 아니고 길이가 0보다 큰 경우에만 처리
	        for (int i = 0; i < pro_id.length; i++) { 
	            proId = pro_id[i]; 
	            rentService.rentCart_list(proId, id);
	            System.out.println("RentController cp_Cart 넘어오는 것 : " + list); 
	        }
	        list.addAll(rentService.rentCart(proId)); // 현재 list에 rentService.rentCart(proId)의 결과를 추가
	    }
	    model.addAttribute("list", list);
	    if (!list.isEmpty()) { // list가 비어있지 않은 경우에만 첫 번째 요소 출력
	        System.out.println("RentController cp_Cart list : " + list.get(0)); 
	    }
	    return "/rent/cp_Cart"; 
	}
	
	//선택상품 삭제하기
	@PostMapping("cart_delete")
	@ResponseBody
	public String cart_delete(String cart_id) {
		System.out.println("RentController cart_delete cart_id : "+cart_id);
		//서비스 연결
		String result = rentService.cart_delete(cart_id);
		System.out.println("result: "+result);
		return result;
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
