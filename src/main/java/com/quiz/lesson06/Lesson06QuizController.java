package com.quiz.lesson06;

import java.util.List;

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
	public String addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		// insert
		favoriteBO.addFavoriteField(name, url);
		return "성공";
	}

	@GetMapping("/result_favorite")
	public String resultFavorite(Model model) {
		
		// select
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		model.addAttribute("favoriteList", favoriteList);
		
		return "lesson06/resultFavorite";
	}
}
