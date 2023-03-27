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
	// http://localhost:8080/lesson04/quiz01/seller_info?id=5
	@GetMapping("/seller_info")
	public String getLatestSeller(@RequestParam(value="id", required=false) Integer id, Model model) {
		Seller seller = null;
		// 조건문은 BO에 만드는게 좋다.
		if(id == null) {
			// 최신 가입자
			seller = sellerBO.getLatestSeller();
		} else {
			// id에 해당하는 사용자를 가져온다.
			seller = sellerBO.getSellerByid(id);
		}
		
		model.addAttribute("seller", seller);
		model.addAttribute("title", "판매자 정보");
		return "lesson04/getLatestSeller";
	}
}
