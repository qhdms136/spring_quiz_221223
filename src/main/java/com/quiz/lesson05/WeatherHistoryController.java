package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson05.bo.WeatherHistoryBO;
import com.quiz.lesson05.model.WeatherHistory;

@RequestMapping("/lesson05")
@Controller
public class WeatherHistoryController {
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	// view
	@GetMapping("/weather_template")
	public String weather_template(Model model) {
		
		// select 
		List<WeatherHistory> weather = weatherHistoryBO.getWeatherHistory();
		model.addAttribute("weathers", weather);
		
		return "weather/weather_template";
	}
	
	@GetMapping("/add_weather")
	public String add_weather() {
		return "weather/add_weather";
	}
	
	@PostMapping("/add_weather")
	public String insert_weather() {
		return "";
	}
}
