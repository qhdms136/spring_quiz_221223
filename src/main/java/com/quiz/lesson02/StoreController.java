package com.quiz.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson02.bo.NewReviewBO;
import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.NewReview;
import com.quiz.lesson02.model.Store;

@RequestMapping("/store")
@Controller
public class StoreController {
	
	@Autowired
	private StoreBO storeBO;
	private NewReviewBO newReviewBO;
	
	@GetMapping("/store_template")
	public String store_template(Model model) {
		List<Store> storeList = storeBO.getStoreList();
		model.addAttribute("storeList", storeList);
		
		return "store/store_template";
	}
	
	@GetMapping("/review_list")
	public String review_list(Model model) {
		List<NewReview> reviewList = newReviewBO.getNewReviewList();
		model.addAttribute("reviewList", reviewList);
		return "store/reviews";
	}
}
