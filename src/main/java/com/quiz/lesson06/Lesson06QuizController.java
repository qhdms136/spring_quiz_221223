package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06QuizController {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	// http://localhost:8080/lesson06/quiz01/add_favorite_view
	@GetMapping("/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/addFavorite";
	}
	
	@PostMapping("/add_favorite")
	@ResponseBody
	public Map<String, Object> addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		// {"code":1, "result":"성공"}
		// {"code":500, "errorMessage":"추가하는데 실패했습니다."}
		
		// insert
		int rowCount = favoriteBO.addFavoriteField(name, url);
		Map<String, Object> result = new HashMap<>();
		if(rowCount > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "데이터를 추가하는데 실패했습니다.");
		}
		
		
		return result;	// JSON String 으로 응답
	}

	@GetMapping("/result_favorite")
	public String resultFavorite(Model model) {
		
		// select
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		model.addAttribute("favoriteList", favoriteList);
		
		return "lesson06/resultFavorite";
	}
	
	// ajax 요청 중복확인
	@PostMapping("/is_duplication")
	@ResponseBody // 꼭 써라
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url){
		Map<String, Boolean> result = new HashMap<>();
		Favorite favorite = favoriteBO.getFavoriteByUrl(url);
		if (favorite != null) {
			result.put("isDuplication", true);
		} else {
			result.put("isDuplication", false);
		}
		
		return result;
	}
	
	// id로 삭제 API 
	// AJAX 요청
	// delete_favorite?id=13  X -> 정보노출로 타인이 다른사람 댓글 삭제 가능 따라서 post
	@PostMapping("/delete_favorite")
	@ResponseBody
	public Map<String, Object> deleteFavorite(
			@RequestParam("id") int id){
		// delete
		int rowCount = favoriteBO.deleteFavoriteById(id);
		
		Map<String ,Object> result = new HashMap<>();
		
		if(rowCount > 0) {
			result.put("code", 1);
			result.put("result", "성공");	
		} else {
			result.put("code", 500);
			result.put("errorMessage", "삭제 하는데 실패했습니다.");
		}
		
		return result;
	}
}
