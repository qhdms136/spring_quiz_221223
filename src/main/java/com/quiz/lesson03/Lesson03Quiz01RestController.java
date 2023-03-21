package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RequestMapping("/lesson03/quiz01")
@RestController
public class Lesson03Quiz01RestController {
	@Autowired
	private RealEstateBO realEstateBO;
	
	@RequestMapping("/1")
	public RealEstate quiz01 (
			@RequestParam("id") int id
			) {
		return realEstateBO.getRealEstate(id);
	}
	
	@RequestMapping("/2")
	public RealEstate quiz01 (
			@RequestParam(value="rentPrice", required=false) Integer rentPrice
			) {
		return realEstateBO.getRealEstate(rentPrice);
	}
}
