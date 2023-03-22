package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateMapper {
	public RealEstate selectRealEstate(@Param("id") int id);
	public List<RealEstate> selectRealEstateListByRentPrice(Integer rentPrice);
	public List<RealEstate> selectRealEstateListByAreaAndPrice(@Param("area") int area, @Param("price") int price);
	public int insertRealEstate(RealEstate realEstate);
	public int insertRealEstateAsField(
			@Param("realTorId") int realTorId,
			@Param("address") String address,
			@Param("area") int area,
			@Param("type") String type,
			@Param("price") int price,
			@Param("price") Integer rentPrice);
}
