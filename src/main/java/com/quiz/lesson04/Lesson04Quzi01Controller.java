package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quzi01Controller {
	
	@Autowired
	private SellerBO sellerBO;
	
	// http://localhost:8080/lesson04/quiz01/add_seller_view
	@GetMapping("/add_seller_view")
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	
	// <form method="post" action="/lesson04/quiz01/add_seller">에서 값 받아옴
	@PostMapping("/add_seller")
	public String Seller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required=false) String profileImageUrl,
			@RequestParam(value="temperature", required=false)Double temperature) {
		
		// insertDB
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		return "lesson04/afterAddSeller";
	}
	
	// http://localhost:8080/lesson04/quiz01/seller_info
	@GetMapping("/seller_info")
	public String getLatestSeller(Model model) {
		Seller seller = sellerBO.getLatestSeller();
		model.addAttribute("seller", seller);
		model.addAttribute("title", "판매자 정보");
		return "lesson04/getLatestSeller";
	}
	
	public String getLatestSeller(
			@RequestParam("id") int id) {
		Seller seller = sellerBO.getLatestSeller(id);
		return "lesson04/getLatestSeller";
	}
}
