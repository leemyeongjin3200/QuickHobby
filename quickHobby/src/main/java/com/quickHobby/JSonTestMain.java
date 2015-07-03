package com.quickHobby;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class JSonTestMain { 
	final static String topURL = "http://www.kma.go.kr/DFSROOT/POINT/DATA/top.json.txt"; 
	final static String mdlURL = "http://www.kma.go.kr/DFSROOT/POINT/DATA/mdl.%s.json.txt"; 
	final static String leafURL = "http://www.kma.go.kr/DFSROOT/POINT/DATA/leaf.%s.json.txt"; 

	final static String KEY_CODE = "code"; 
	final static String KEY_VALUE = "value"; 
	final static String KEY_X = "x"; 
	final static String KEY_Y = "y"; 

	static ArrayList<CityDTO> topList = new ArrayList<CityDTO>(); 
	static ArrayList<CityDTO> mdlList = new ArrayList<CityDTO>(); 
	static ArrayList<CityDTO> leafList = new ArrayList<CityDTO>(); 
	static ArrayList<CityDTO> finalList = new ArrayList<CityDTO>();

	static String startNum;
	static String start;
	
	public JSonTestMain(String start){
		this.start=start;
    }
 
    public String xmlRssParser() throws Exception {
		JSONArray jsonArray = null; 

		jsonArray = getJSON(topURL); 
		parseJSON(topList, jsonArray, null, null, false); 

		for (CityDTO dto : topList) { 
			jsonArray = null; 
			jsonArray = getJSON(String.format(mdlURL, dto.getCode())); 
			parseJSON(mdlList, jsonArray, dto.getCode(), dto.getName(), false); 
		} 

		for (CityDTO dto : mdlList) { 
			jsonArray = null; 
			jsonArray = getJSON(String.format(leafURL, dto.getCode())); 
			parseJSON(leafList, jsonArray, dto.getCode(), dto.getName(), true); 
		} 
		
		return finalList.get(0).getCode();
	} 

	private static JSONArray getJSON(final String urlStr) { 
		URL url = null; 
		HttpURLConnection conn = null; 
		StringBuilder jsonHtml = new StringBuilder(); 

		try { 
			url = new URL(urlStr); 
			conn = (HttpURLConnection) url.openConnection(); 

			if (conn != null) { 
				conn.setConnectTimeout(10000); 
				conn.setUseCaches(false); 

				if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) { 
					BufferedReader br = new BufferedReader( 
							new InputStreamReader(conn.getInputStream())); 

					String line = null; 
					while ((line = br.readLine()) != null) { 
						jsonHtml.append(line + "\n"); 
					} 
					br.close(); 
				} 
				conn.disconnect(); 
			} 
		} catch (MalformedURLException e) { 
			e.printStackTrace(); 
		} catch (IOException e) { 
			e.printStackTrace(); 
		} 
		JSONArray jsonobj = (JSONArray) JSONValue.parse(jsonHtml.toString()); 
		return jsonobj; 
	} 

	private static void parseJSON(ArrayList<CityDTO> list, JSONArray array, 
			String parentCode, String parentName, boolean isLast) { 
		JSONObject data; 
		CityDTO city = null; 
		for (int i = 0; i < array.size(); i++) { 
			data = (JSONObject) array.get(i); 

			if (!isLast) { 
				city = new CityDTO(data.get(KEY_CODE).toString(), data.get(KEY_VALUE).toString(), parentCode, parentName); 
				
				if(city.getName().contains(start)){
					startNum=city.getCode().trim();
				}
			} else { 
				city = new CityDTO(data.get(KEY_CODE).toString(), data.get( 
						KEY_VALUE).toString(), data.get(KEY_X).toString(), data 
						.get(KEY_Y).toString(), parentCode, parentName); 
				
				if(city.getCode().startsWith(startNum)){
					finalList.add(city);
				}
			} 
	
			list.add(city); 
		} 
	}
} 


