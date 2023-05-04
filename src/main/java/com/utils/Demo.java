package com.utils;

import java.util.Calendar;
import java.util.Date;

public class Demo {

	public static void main(String[] args) {
		Calendar cal=Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DATE, 100);
		System.out.println(cal.getTime().toString());
	}

}
