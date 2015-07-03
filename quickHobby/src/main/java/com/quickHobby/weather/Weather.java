package com.quickHobby.weather;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.StringTokenizer;

public class Weather {
	private WeatherDTO weather;

	public Weather(String str, Date close){
		String addr=null;
		String sAddr=null;
		StringTokenizer st=new StringTokenizer(str);
		
		GregorianCalendar closeDate=new GregorianCalendar(2015, close.getMonth(), close.getDate());		// 마감일
		GregorianCalendar today=new GregorianCalendar(2015, new Date().getMonth(), new Date().getDate());			// 오늘
		long diff=closeDate.getTimeInMillis()-today.getTimeInMillis();
		long diffDays=diff / (24*60*60*1000);	// 날짜 차이
//		System.out.println(diffDays);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		String temp=st.nextToken();
		if(temp.endsWith("시")){						// 광역시, 특별시일 경우
			sAddr=temp.substring(0, 2);
//			System.out.println(sAddr);
		}else if(temp.endsWith("도")){				// 그 외
			addr=temp;
			if(addr.equals("제주자치도")){
				addr=addr.substring(0, 2);
			}
			sAddr=st.nextToken().substring(0, 2);
//			System.out.println(addr + sAddr);
		}
		try{
		
			if(diffDays > 9){
				System.out.println("10일 이상은 날짜 정보 없음.");
			}else if(diffDays > 2){
				KMARssMain kma;
				if(addr != null)
					kma=new KMARssMain(addr, sAddr, sdf.format(close)+" 00:00");		// 광역시, 특별시일 경우
				else
					kma=new KMARssMain(sAddr, sAddr, sdf.format(close)+" 00:00");		// 그 외

				setWeather(kma.getWeather());
			}else if(diffDays >= 0){
				String code=new JSonTestMain(sAddr).xmlRssParser();
				System.out.println(code);
				ExactRssMain erm=new ExactRssMain(code, diffDays);
				setWeather(erm.getWeather());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public WeatherDTO getWeather() {
		return weather;
	}

	public void setWeather(WeatherDTO weather) {
		this.weather = weather;
	}

}
