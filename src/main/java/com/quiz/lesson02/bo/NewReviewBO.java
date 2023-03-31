package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.NewReviewMapper;
import com.quiz.lesson02.model.NewReview;

@Service
public class NewReviewBO {
	
	@Autowired
	private NewReviewMapper newReviewMapper;
	
	public List<NewReview> getNewReviewList(int storeId) {
		return newReviewMapper.selectNewReviewList(storeId);
	}
}
