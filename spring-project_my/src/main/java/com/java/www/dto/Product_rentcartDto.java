package com.java.www.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Product_rentcartDto {
	
	private Rent_cartDto cartDto;
	private ProductDto proDto;
	
}
