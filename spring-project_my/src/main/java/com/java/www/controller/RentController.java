package com.java.www.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	
	//대여목록 저장
	@PostMapping("/doCp_Cart")
	public String cp_Cart(@RequestParam(name = "pro_id", required = false) String[] pro_id, Model model) { 
		System.out.println("doCp_Cart");
		String id = (String) session.getAttribute("session_id");
		String proId = "";
		int check =0;
		if (pro_id != null && pro_id.length > 0) { // pro_id가 null이 아니고 길이가 0보다 큰 경우에만 처리
			for (int i = 0; i < pro_id.length; i++) { 
				proId = pro_id[i]; 
				List<Product_rentcartDto> list = rentService.rentCart(proId);
				check=0;
				for(int j=0;j<list.size();j++) {
					if( list.get(j).getCartDto().getId().equals(id) && list.get(j).getCartDto().getPro_id().equals(proId) ) {
						rentService.rentUpdate(proId);
						check =1;
					} 
				}
				if(check==0) {
					rentService.rentCart_list(proId, id);
				}
				System.out.println("RentController cp_Cart 넘어오는 것 : " + proId); 
			}
		}
		model.addAttribute("proId", proId);
		
		return "redirect:/rent/cp_Cart"; 
	}
	
	//대여목록
	@GetMapping("/cp_Cart")
	public String cp_Cart(Model model) {
		System.out.println("cp_Cart");
		//가져온것 - select
		String id = (String) session.getAttribute("session_id");
	    String proId = "";
	    List<Product_rentcartDto> list = new ArrayList<>(); // 리스트 초기화
	    
	    list.addAll(rentService.rentCart(proId)); // 현재 list에 rentService.rentCart(proId)의 결과를 추가
	    
	    model.addAttribute("list", list);
	    if (!list.isEmpty()) { // list가 비어있지 않은 경우에만 첫 번째 요소 출력
	        System.out.println("RentController cp_Cart list : " + list.get(0)); 
	    }
		return "/rent/cp_Cart";
	}
	
	//품목삭제 버튼으로 해당품목만 삭제
	@PostMapping("deleteOneCart")
	@ResponseBody
	public int deleteOneCart(@RequestParam(value = "cart_id") String cart_id) throws Exception {
	   int result = 0;
		  System.out.println("del"+cart_id);
	      rentService.deleteOneCart(cart_id);
	      result = 1;
	   return result;    
	}
	
	//선택상품 삭제하기
	@PostMapping("deleteCart")
	@ResponseBody
	public int deleteCart(@RequestParam(value = "cart_id[]") List<String> cart_id) {
	   int result = 0;
	   for(int i=0; i<cart_id.size(); i++) {
	   		rentService.deleteCart(cart_id.get(i));
	   }
	    result = 1;
	   return result;    
	}
	//
	@PostMapping("/updatecount")
	@ResponseBody
	public String updatecount(@RequestParam String cart_id, @RequestParam int cart_count, @RequestParam String stat) {
		Map<String, Object> result = rentService.updatecount(cart_id, cart_count, stat);
	    return "result";
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
