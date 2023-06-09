package com.quiz.lesson06;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/booking")
@Controller
public class BookingController {
	
	@Autowired
	private BookingBO bookingBO;
	
	// add_view
	// http://localhost:8080/booking/add_booking_view
	@GetMapping("/add_booking_view")
	public String addBookingView() {
		return "booking/add_booking";
	}
	
	@PostMapping("/add_booking")
	@ResponseBody
	public Map<String ,Object> addBooking(
			@RequestParam("name") String name,
			@RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd")Date date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber){
		int rowCount = bookingBO.addBookingField(name, date, day, headcount, phoneNumber);
		Map<String, Object> result = new HashMap<>();
		if(rowCount > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "데이터를 추가하는데 실패했습니다.");
		}
			return result;
	}
	
	// select view
	// http://localhost:8080/booking/booking_list
	@GetMapping("/booking_list")
	public String bookingList(Model model) {
		
		List<Booking> bookingList = bookingBO.getBookingList();
		
		// select
		model.addAttribute("bookingList",bookingList);
		
		return "booking/bookingList";
	}
	
	// delete
	@DeleteMapping("/delete_booking")
	@ResponseBody
	public Map<String, Object> deleteBooking(
			@RequestParam("id")int id){
		
		// delete 값 행 개수로 저장
		int rowCount = bookingBO.deleteBookingById(id);
		
		Map<String, Object> result = new HashMap<>();
		/*
		 * 성공 여부만 확인해도됨
		result.put("code", 1);
		result.put("result", "성공");
		 */
		if(rowCount > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "데이터를 삭제하는데 실패했습니다.");
		}
		
		return result;
	}
	
	// check view
	// http://localhost:8080/booking/check_booking_view
	@GetMapping("/check_booking_view")
	public String checkBookingView() {
		return "booking/booking_check";
	}
	
	// 예약 내역 조회 - ajax 요청
	@GetMapping("/check_booking")
	@ResponseBody
	public Map<String, Object> isDuplication(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber){
		Map<String, Object> result = new HashMap<>();
		
		// select check
		Booking booking = bookingBO.getBookingByNamePhoneNumber(name, phoneNumber);
		if(booking != null) {
			result.put("code", 1);
			result.put("booking", booking);
		} else {
			result.put("code", 500);
		}
		
		return result;
	}
}
