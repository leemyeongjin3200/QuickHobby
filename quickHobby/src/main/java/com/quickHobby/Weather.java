package com.quickHobby;

import java.util.GregorianCalendar;
import java.util.StringTokenizer;

public class Weather {
	public Weather() throws Exception{
		String str="충청북도 괴산시 강남구 한남동 75-9 203호";
		String addr=null;
		String sAddr=null;
		StringTokenizer st=new StringTokenizer(str);
		
		GregorianCalendar closeDate=new GregorianCalendar(2015, 6, 2);		// 마감일
		GregorianCalendar today=new GregorianCalendar(2015, 6, 2);			// 오늘
		long diff=closeDate.getTimeInMillis()-today.getTimeInMillis();
		long diffDays=diff / (24*60*60*1000);	// 날짜 차이
//		System.out.println(diffDays);
		
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
		
		
		if(diffDays > 9){
			System.out.println("10일 이상은 날짜 정보 없음.");
		}else if(diffDays > 2){
			if(addr != null)
				new KMARssMain(addr, sAddr);		// 광역시, 특별시일 경우
			else
				new KMARssMain(sAddr, sAddr);		// 그 외
		}else if(diffDays >= 0){
			String code=new JSonTestMain(sAddr).xmlRssParser();
			System.out.println(code);
			new ExactRssMain(code, diffDays);
		}
	}
		

	public static void main(String[] args) throws Exception{
		new Weather();
	}

}
