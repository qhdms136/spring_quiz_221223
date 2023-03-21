package com.quiz.lesson03.bo;

import java.util.List;

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
	
	public List<RealEstate> getRealEstate(Integer rentPrice) {
		return realEstateMapper.selectRealEstateList(rentPrice);
	}
	
	public List<RealEstate> getRealEstate(int area, int price){
		return realEstateMapper.selectRealEstateList2(area, price);
	}
}
