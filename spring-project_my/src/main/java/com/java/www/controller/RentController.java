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
import com.java.www.dto.Rent_cartDto;
import com.java.www.dto.User_campDto;
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
	@PostMapping
	@ResponseBody
	public int deleteCart(
	       @RequestParam(value = "chbox[]") List<String> checkArr,
	       @RequestParam(value = "id") String id,
	       @RequestParam(value = "cart_id") String cart_id) throws Exception {
	   //logger.info("delete cart");
	   
	   Rent_cartDto rent_dto = (Rent_cartDto) session.getAttribute("id");
	   
	   int result = 0;
	   
	   if (rent_dto != null && rent_dto.getId().equals(id)) {
	      // 여기에서 cartNum, userId를 직접 사용하여 처리하거나,
		   rentService.deleteCart(id, cart_id); //형태로 서비스에 전달할 수 있습니다.
	      // service.deleteCart(cart);
	      result = 1;
	   }    
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
