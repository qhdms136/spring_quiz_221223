package com.quiz.lesson06.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Booking;

@Repository
public interface BookingMapper {
	
	public List<Booking> selectBookingList();
}
