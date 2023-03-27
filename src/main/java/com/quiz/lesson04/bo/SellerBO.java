package com.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.dao.SellerMapper;
import com.quiz.lesson04.model.Seller;

@Service
public class SellerBO {
	@Autowired
	private SellerMapper sellerMapper;
	
	public void addSeller(String nickname, String profileImageUrl, Double temperature) {
		sellerMapper.insertSeller(nickname, profileImageUrl, temperature);
	}
	
	public Seller getLatestSeller() {
		return sellerMapper.selectLatestSeller();
	}
	
	// 여기서는 아이디가 꼭 필요하므로 int
	public Seller getSellerByid(int id) {
		return sellerMapper.selectSellerById(id);
	}
}
