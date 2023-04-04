package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.FavoriteMapper;
import com.quiz.lesson06.model.Favorite;

@Service
public class FavoriteBO {
	
	@Autowired
	private FavoriteMapper favoriteMapper;
	
	public int addFavoriteField(String name, String url) {
		return favoriteMapper.insertFavoriteField(name, url);
	}
	
	public List<Favorite> getFavoriteList(){
		return favoriteMapper.selectFavoriteList();
	}
	
	public boolean existFavoriteByUrl(String url) {
		return favoriteMapper.existFavoriteByUrl(url);
	}
}
