package com.java.www.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class P_orderDto {
	
	private String order_id;
	private String id;
	private Timestamp o_date;
	private String o_name;
	private String o_phone;
	private String o_email;
	private String o_address;
	private int o_payment;
	private int o_price;
	private int o_delivery;
	private int o_totalprice;
	
}
