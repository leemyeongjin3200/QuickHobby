package com.quickHobby;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.Vector;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

public class ExactRssMain {
	private URL url;
	private long diffDays;

	private Vector<ExactWeatherDTO> list = new Vector<ExactWeatherDTO>();

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
					ExactWeatherDTO entity = new ExactWeatherDTO();
					if(day.equals(String.valueOf(diffDays))){	
						entity.setHour(hour);
						entity.setTemp(temp);
						entity.setTmn(tmn);
						entity.setTmx(tmx);
						entity.setWfKor(wfKor);
						entity.setTemp(temp);

						list.removeAllElements();
						list.add(entity);
						break;
					}
				}
			}
			eventType = xpp.next();
		}

		printResult(list);
	}

	private void printResult(Vector<ExactWeatherDTO> list) {
		System.out.println(" 날씨 : "+ list.get(0).getWfKor() + " 최저 : " + list.get(0).getTmn() + " 최고 : " + list.get(0).getTmx() + " 평균 : " + list.get(0).getTemp());
	} 
}
