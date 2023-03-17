package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController	// @Controller + @ResponseBody
public class Lesson01Quiz02RestController {
	// @ResponseBody + return String => HttpMessageConverter		리턴된 String => response에 글자로 담긴다. text/html
	// @ResponseBody + return 객체 => HttpMessageConverter	jackson 라이브러리 => JSON String 응답에 담긴다. application/json
	
	@RequestMapping("/1")
	public List<Map<String, Object>> quiz02_1(){
		List<Map<String, Object>> move = new ArrayList<>();
		// 1)
		/*
		Map<String, Object> moveInfo1 = new HashMap<>();
		moveInfo1.put("rate", 15);
		moveInfo1.put("direct", "봉준호");
		moveInfo1.put("time", 131);
		moveInfo1.put("title", "기생충");
		move.add(moveInfo1);
		
		Map<String, Object> moveInfo2 = new HashMap<>();
		moveInfo2.put("rate", 0);
		moveInfo2.put("direct", "로베르토 베니니");
		moveInfo2.put("time", 116);
		moveInfo2.put("title", "인생은 아름다워");
		move.add(moveInfo2);
		
		Map<String, Object> moveInfo3 = new HashMap<>();
		moveInfo3.put("rate", 12);
		moveInfo3.put("direct", "크리스토퍼 논란");
		moveInfo3.put("time", 147);
		moveInfo3.put("title", "인셉션");
		move.add(moveInfo3);
		
		Map<String, Object> moveInfo4 = new HashMap<>();
		moveInfo4.put("rate", 19);
		moveInfo4.put("direct", "윤종빈");
		moveInfo4.put("time", 133);
		moveInfo4.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");
		move.add(moveInfo4);
		
		Map<String, Object> moveInfo5 = new HashMap<>();
		moveInfo5.put("rate", 15);
		moveInfo5.put("direct", "프란시스 로렌스");
		moveInfo5.put("time", 137);
		moveInfo5.put("title", "헝거게임");
		move.add(moveInfo5);
		*/
		// 2)
		Map<String, Object> map = new HashMap<>();
		map.put("rate", 15);
		map.put("direct", "봉준호");
		map.put("time", 131);
		map.put("title", "기생충");
		move.add(map);
		
		map = new HashMap<>();
		map.put("rate", 0);
		map.put("direct", "로베르토 베니니");
		map.put("time", 116);
		map.put("title", "인생은 아름다워");
		move.add(map);
		
		map = new HashMap<>();
		map.put("rate", 12);
		map.put("direct", "크리스토퍼 논란");
		map.put("time", 147);
		map.put("title", "인셉션");
		move.add(map);
		
		map = new HashMap<>();
		map.put("rate", 19);
		map.put("direct", "윤종빈");
		map.put("time", 133);
		map.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");
		move.add(map);
		
		map = new HashMap<>();
		map.put("rate", 15);
		map.put("direct", "프란시스 로렌스");
		map.put("time", 137);
		map.put("title", "헝거게임");
		move.add(map);
		return move;
	}
	
	@RequestMapping("/2")
	public List<Data> quiz02_2() {
		List<Data> result = new ArrayList<>();
		Data data = new Data();
		data.setTitle("안녕하세요 가입인사 드립니다.");
		data.setUser("hagulu");
		data.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다. 활동 열심히 하겠습니다.");
		result.add(data);
		
		data = new Data();
		data.setTitle("헐 대박");
		data.setUser("bada");
		data.setContent("오늘 목요일이 었어... 금요일인줄");
		result.add(data);
		
		data = new Data();
		data.setTitle("오늘 데이트 한 이야기 해드릴게요.");
		data.setUser("dulumary");
		data.setContent("...");
		result.add(data);
		
		return result;
	}
	
	@RequestMapping("/3")
	public ResponseEntity<Data> quiz02_3 () {
		Data data = new Data();
		data.setTitle("안녕하세요 가입인사 드립니다.");
		data.setUser("hagulu");
		data.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁드립니다. 활동 열심히 하겠습니다.");
		return new ResponseEntity<>(data, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
