package com.quickHobby.weather;

import java.io.BufferedInputStream;
import java.net.URL;
import java.util.Vector;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

/*
 * @name        : KMARssMain
 * @date        : 2015. 7. 2.
 * @author      : 서인구
 * @description : 3일 후부터 10일 후까지의 대략적인 날씨 정보를 가져오는 클래스
 */
public class KMARssMain {
	private URL url = new URL(
            "http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108");
 
    private Vector<WeatherDTO> list = new Vector<WeatherDTO>();
    
    private String addr;
    private String sAddr;
    private WeatherDTO weather;
    private String closeDate;
 
    public KMARssMain(String addr, String sAddr, String closeDate) throws Exception {
    	this.addr=addr;
    	this.sAddr=sAddr;
    	this.closeDate=closeDate;
    	
        xmlRssParser();
    }
 
    private void xmlRssParser() throws Exception {
 
        XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
        XmlPullParser xpp = factory.newPullParser();
        BufferedInputStream bis = new BufferedInputStream(url.openStream());
        xpp.setInput(bis, "utf-8");
        
        
        String tag = null;
        String city = null, mode = null, tmEf = null, wf = null, tmn = null, tmx = null, reliability = null, province=null;
 
        int eventType = xpp.getEventType();
        while (eventType != XmlPullParser.END_DOCUMENT) {
            if (eventType == XmlPullParser.START_TAG) {
                tag = xpp.getName();
            } else if (eventType == XmlPullParser.TEXT) {
                if (tag.equals("mode") && !xpp.getText().contains("\n")) {
                    mode = xpp.getText();
                } else if (tag.equals("tmEf") && !xpp.getText().contains("\n")) {
                    tmEf = xpp.getText();
                } else if (tag.equals("wf") && !xpp.getText().contains("\n")) {
                    wf = xpp.getText();
                } else if (tag.equals("tmn") && !xpp.getText().contains("\n")) {
                    tmn = xpp.getText();
                } else if (tag.equals("tmx") && !xpp.getText().contains("\n")) {
                    tmx = xpp.getText();
                } else if (tag.equals("reliability") && !xpp.getText().contains("\n")) {
                    reliability = xpp.getText();
                } else if (tag.equals("city") && !xpp.getText().contains("\n")) {
                    city = xpp.getText();
                } else if (tag.equals("province") && !xpp.getText().contains("\n")){
                	province = xpp.getText();
                }
 
            } else if (eventType == XmlPullParser.END_TAG) {
                tag = xpp.getName();
                
                if (tag.equals("location")) {
//                    break;
                }
 
                if (tag.equals("data")) {
                    WeatherDTO entity = new WeatherDTO();
                    if(province.contains(addr)){			
                    	if(city.contains(sAddr)){				
                    		if(tmEf.equals(closeDate)){
                    			entity.setMode(mode);
                    			entity.setTmEf(tmEf);
                    			entity.setWf(wf);
                    			entity.setTmn(tmn);
                    			entity.setTmx(tmx);
                    			entity.setReliability(reliability);
                    			entity.setCity(city);
                    			
                    			list.removeAllElements();
                    			list.add(entity);
                    			break;
                    		}
                    	} else {
                    		if(tmEf.equals(closeDate)){
                    	
                			entity.setMode(mode);
                			entity.setTmEf(tmEf);
                			entity.setWf(wf);
                			entity.setTmn(tmn);
                			entity.setTmx(tmx);
                			entity.setReliability(reliability);
                			entity.setCity(city);

                			list.add(entity);
                			}
                		}                  										
                    	
                    }

                }
            }
            eventType = xpp.next();
        }
        
        setWeather(list.get(0));
    }
 
//    private String printResult(Vector<WeatherDTO> list) {
//            return "도시 : "+ list.get(0).getCity() +" 날짜시간 : " + list.get(0).getTmEf() 
//                    +" 날씨 : "+ list.get(0).getWf() + " 최저 : " + list.get(0).getTmn() + " 최고 : " + list.get(0).getTmx();
//    }
    
    public WeatherDTO getWeather(){
    	return weather;
    }
    
    public void setWeather(WeatherDTO weather){
    	this.weather=weather;
    }
}
