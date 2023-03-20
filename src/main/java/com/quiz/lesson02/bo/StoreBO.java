package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.StoreMapper;
import com.quiz.lesson02.model.Store;

@Service
public class StoreBO {
	
	@Autowired
	private StoreMapper storeMapper;
	
	public List<Store> getStoreList(){
		return storeMapper.selectStoreList();
	}
}
