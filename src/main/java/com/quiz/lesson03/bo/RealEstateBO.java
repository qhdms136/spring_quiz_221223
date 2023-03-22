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
	
	public List<RealEstate> getRealEstateListByRentPrice(Integer rentPrice) {
		return realEstateMapper.selectRealEstateListByRentPrice(rentPrice);
	}
	
	public List<RealEstate> getRealEstateListByAreaAndPrice(int area, int price){
		return realEstateMapper.selectRealEstateListByAreaAndPrice(area, price);
	}
	
	public int addRealEstate(RealEstate realEstate) {
		return realEstateMapper.insertRealEstate(realEstate);
	}
	
	public int addRealEstateAsField(
			int realTorId,
			String address,
			int area,
			String type,
			int price,
			Integer rentPrice) {
		return realEstateMapper.insertRealEstateAsField(realTorId, address, area, type, price, rentPrice);
	}
}
