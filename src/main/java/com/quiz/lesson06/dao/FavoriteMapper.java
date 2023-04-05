package com.quiz.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Favorite;

@Repository
public interface FavoriteMapper {
	
	public int insertFavoriteField(
			@Param("name") String name,
			@Param("url") String url);
	
	public List<Favorite> selectFavoriteList();
	
	public Favorite selectFavoriteByUrl(String url);
	
	public int deleteFavoriteById(int id);
}
