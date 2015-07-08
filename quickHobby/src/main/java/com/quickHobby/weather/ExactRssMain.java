package com.quickHobby.weather;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.Vector;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

/*
 * @name        : ExactRssMain
 * @date        : 2015. 7. 2.
 * @author      : 서인구
 * @description : 오늘, 내일, 모레의 해당 지역의 자세한 날씨를 가져오는 클래스
 */
public class ExactRssMain {
	private URL url;
	private long diffDays;
	private WeatherDTO weather;

	private Vector<WeatherDTO> list = new Vector<WeatherDTO>();

	public ExactRssMain(String code, long diffDays) throws Exception {
		this.url=new URL("http://www.kma.go.kr/wid/queryDFSRSS.jsp?zone=" + code);
		this.diffDays=diffDays;
		
		xmlRssParser();
	}

	private void xmlRssParser() throws Exception {

		XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
		XmlPullParser xpp = factory.newPullParser();
		BufferedInputStream bis = new BufferedInputStream(url.openStream());
		xpp.setInput(bis, "utf-8");


		String tag = null;
		String hour = null, day = null, temp = null, wfKor = null, tmn = null, tmx = null;

		int eventType = xpp.getEventType();
		while (eventType != XmlPullParser.END_DOCUMENT) {
			if (eventType == XmlPullParser.START_TAG) {
				tag = xpp.getName();
			} else if (eventType == XmlPullParser.TEXT) {
				if (tag.equals("hour") && !xpp.getText().contains("\n")) {
					hour = xpp.getText();
				} else if (tag.equals("day") && !xpp.getText().contains("\n")) {
					day = xpp.getText();
				} else if (tag.equals("temp") && !xpp.getText().contains("\n")) {
					temp = xpp.getText();
				} else if (tag.equals("wfKor") && !xpp.getText().contains("\n")) {
					wfKor = xpp.getText();
				} else if (tag.equals("tmn") && !xpp.getText().contains("\n")) {
					tmn = xpp.getText();
				} else if (tag.equals("tmx") && !xpp.getText().contains("\n")) {
					tmx = xpp.getText();
				}
			} else if (eventType == XmlPullParser.END_TAG) {
				tag = xpp.getName();

				if (tag.equals("data")) {
					WeatherDTO entity = new WeatherDTO();
					if(day.equals(String.valueOf(diffDays))){	
						entity.setWf(wfKor);
            			entity.setTmn(tmn);
            			entity.setTmx(tmx);

						list.removeAllElements();
						list.add(entity);
						break;
					}
				}
			}
			eventType = xpp.next();
		}

		setWeather(list.get(0));
	}

//	private String printResult(Vector<ExactWeatherDTO> list) {
//		return " 날씨 : "+ list.get(0).getWfKor() + " 최저 : " + list.get(0).getTmn() + " 최고 : " + list.get(0).getTmx() + " 평균 : " + list.get(0).getTemp();
//	} 
	
	public void setWeather(WeatherDTO weather){
		this.weather=weather;
	}
	
	public WeatherDTO getWeather(){
		return weather;
	}
}
