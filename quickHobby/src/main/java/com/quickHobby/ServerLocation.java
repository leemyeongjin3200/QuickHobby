package com.quickHobby;

public class ServerLocation {
	private String countryCode;
	private String countryName;
	private String region;
	private String regionNameByCode;
	private String city;
	private String postalCode;
	private String lat;
	private String lng;

	public void setCountryCode(String countryCode) {
		System.out.println("CountryCode : " + countryCode);

	}

	public void setCountryName(String countryName) {
		System.out.println("CountryName : " + countryName);

	}

	public void setRegion(String region) {
		System.out.println("Region : " + region);

	}
	
	public void setRegionName(String regionNameByCode) {
		System.out.println("RegionName : "+regionNameByCode);

	}

	public void setCity(String city) {
		System.out.println("City : "+city);

	}

	public void setPostalCode(String postalCode) {
		System.out.println("PostalCode : "+postalCode);

	}

	public void setLatitude(String valueOf) {
		System.out.println("Latitude : "+valueOf);

	}

	public void setLongitude(String valueOf) {
		System.out.println("Longitude : "+valueOf);

	}
}
