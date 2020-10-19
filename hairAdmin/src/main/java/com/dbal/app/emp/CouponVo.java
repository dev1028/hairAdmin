package com.dbal.app.emp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CouponVo {

	String hsc_no;
	String hs_no;
	String hsc_issuedate;
	String hsc_expiredate;
	String hsc_coupon_quantity;
	String hsc_discount_rate;
	String hsc_maxdiscount_pay;
	String hsc_name;
	
	public int first;
	public int last;
	
	
	String hs_name;
	String hsc_status;
}
