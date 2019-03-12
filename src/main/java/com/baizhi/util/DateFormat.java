package com.baizhi.util;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat{
	public static Date getUtilDate(String date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date parse = null;
		try {
			parse = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return parse;
	}
	public static java.sql.Date toSqlDate(Date uDate){
		long time = uDate.getTime();
		java.sql.Date sqlDate = new java.sql.Date(time);
		return sqlDate;
	}
	public static String getSysdate(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());
		return date;
	}
}
