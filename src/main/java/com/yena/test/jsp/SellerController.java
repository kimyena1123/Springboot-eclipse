package com.yena.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yena.test.jsp.bo.SellerBO;
import com.yena.test.jsp.model.Seller;

@RequestMapping("/jsp/seller")
@Controller
public class SellerController {

	@Autowired
	private SellerBO sellerBO;
	
	
	@GetMapping("/show")
	public String showSeller(Model model, @RequestParam(value="id", required=false) Integer id) {
	
//		Seller seller = null; //객체. 없으면 null.
		
//		if(id == null) {			
//			seller = sellerBO.getLastSeller();
//			
//			//model.addAttribute("seller", seller);
//			
//		}else {
//			seller = sellerBO.getSellerById(id);
//			
//			//model.addAttribute("seller", seller);
//		}
		
		Seller seller = sellerBO.getSeller(id);
		
		model.addAttribute("seller", seller);

		return "jsp/seller";
	};
	
//	@GetMapping("/show/id")
//	public String sellerById(Model model, @RequestParam("id") int id) {
//		 
//		Seller seller = sellerBO.getSellerById(id);
//		
//		model.addAttribute("seller", seller);
//		
//		return "jsp/seller";
//	}
	
	
	@ResponseBody
	@GetMapping("/create")
	public String createSeller(
			String nickname
			,double temperature
			,String profileImgae) {
		
		int count = sellerBO.createSeller(nickname, temperature, profileImgae);
		
		return "insert 성공 >> " + count;
	};
	
	//입력 화면
	@GetMapping("/input")
	public String sellerInput() {
		
		return "jsp/sellerInput";
	}
	
}
