package com.quickHobby.weather;

/*
 * @name        : WeatherDTO
 * @date        : 2015. 7. 2.
 * @author      : 서인구
 * @description : 날씨 정보 DTO
 */
public class WeatherDTO {
	private String city,mode,tmEf,wf,tmn,tmx,reliability;
	 
    public String getCity() {
        return city;
    }
 
    public void setCity(String city) {
        this.city = city;
    }
 
    public String getMode() {
        return mode;
    }
 
    public void setMode(String mode) {
        this.mode = mode;
    }
 
    public String getTmEf() {
        return tmEf;
    }
 
    public void setTmEf(String tmEf) {
        this.tmEf = tmEf;
    }
 
    public String getWf() {
        return wf;
    }
 
    public void setWf(String wf) {
        this.wf = wf;
    }
 
    public String getTmn() {
        return tmn;
    }
 
    public void setTmn(String tmn) {
        this.tmn = tmn;
    }
 
    public String getTmx() {
        return tmx;
    }
 
    public void setTmx(String tmx) {
        this.tmx = tmx;
    }
 
    public String getReliability() {
        return reliability;
    }
 
    public void setReliability(String reliability) {
        this.reliability = reliability;
    }
    
}
