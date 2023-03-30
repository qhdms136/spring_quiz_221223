package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.WeatherHistoryMapper;
import com.quiz.lesson05.model.WeatherHistory;

@Service
public class WeatherHistoryBO {
	@Autowired
	private WeatherHistoryMapper weaterHistoryMapper;
	
	public List<WeatherHistory> getWeatherHistory() {
		return weaterHistoryMapper.selectWeatherHistory();
	}

}
