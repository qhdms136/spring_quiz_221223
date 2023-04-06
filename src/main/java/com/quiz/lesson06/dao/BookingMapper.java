package com.quiz.lesson06.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Booking;

@Repository
public interface BookingMapper {
	
	public List<Booking> selectBookingList();
	
	public int insertBookingField(
			@Param("name") String name, 
			@Param("date") Date date, 
			@Param("day") int day, 
			@Param("headcount") int headcount, 
			@Param("phoneNumber") String phoneNumber);
	
	public int deleteBookingById(int id);
	
	// 다 가져온다.
	public List<Booking> selectBookingByNamePhoneNumber(
			@Param("name") String name,
			@Param("phoneNumber")String phoneNumber);
}
