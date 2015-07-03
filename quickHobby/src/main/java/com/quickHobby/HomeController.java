package com.quickHobby;

import java.io.BufferedInputStream;
import java.net.URL;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/weather/weather.do", method=RequestMethod.GET)
	public String weather(HttpServletRequest request) throws Exception{
		URL url = new URL("http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108");
	 
	    Vector<WeatherDTO> list = new Vector<WeatherDTO>();
	    
	    XmlPullParserFactory factory = XmlPullParserFactory.newInstance();
        XmlPullParser xpp = factory.newPullParser();
        BufferedInputStream bis = new BufferedInputStream(url.openStream());
        xpp.setInput(bis, "utf-8");
        
        
        String tag = null;
        String city = null, mode = null, tmEf = null, wf = null, tmn = null, tmx = null, reliability = null;
 
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
                }
 
            } else if (eventType == XmlPullParser.END_TAG) {
                tag = xpp.getName();
                
                if (tag.equals("location")) {
                    break;
                }
 
                if (tag.equals("data")) {
                    WeatherDTO entity = new WeatherDTO();
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
            eventType = xpp.next();
        }
        
        for (WeatherDTO entity : list) {
            System.out.println("도시 : "+entity.getCity() +" 시간 : " + entity.getTmEf() 
                    +" 날씨 : "+ entity.getWf());
        }
	    
		return null;
	}
	
}
