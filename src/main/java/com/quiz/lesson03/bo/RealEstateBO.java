package com.quiz.lesson03.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateMapper;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	@Autowired
	private  RealEstateMapper realEstateMapper;
	
	public RealEstate getRealEstate(int id) {
		return realEstateMapper.selectRealEstate(id);
	}
	
	public RealEstate getRealEstate(Integer rentPrice) {
		return realEstateMapper.selectRealEstate2(rentPrice);
	}
}
