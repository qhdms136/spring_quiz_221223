package com.quiz.lesson06.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingMapper;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingMapper bookingMapper;
	
	public List<Booking> getBookingList(){
		return bookingMapper.selectBookingList();
	}
	
	public int addBookingField(String name, Date date, int day, int headcount, String phoneNumber) {
		return bookingMapper.insertBookingField(name, date, day, headcount, phoneNumber);
	}
	
	public int deleteBookingById(int id) {
		return bookingMapper.deleteBookingById(id);
	}
	
	// input:name, phoneNumber
	// output: Booking
	public Booking getBookingByNamePhoneNumber(String name, String phoneNumber) {
		// 여러개가 있을 경우 마지막[1, 3, 5]
		// 비었을 경우	[]
		// 한개만 있을 경우 [3]
		List<Booking> bookingList = bookingMapper.selectBookingByNamePhoneNumber(name, phoneNumber);
		if(bookingList.isEmpty()) {
			return null;
		}
		// 비어있지 않으면 값이 있고, 마지막 인덱스에 있는 값을 돌려준다. (최신값)
		return bookingList.get(bookingList.size() - 1);
	}
}
