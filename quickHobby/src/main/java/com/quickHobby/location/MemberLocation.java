package com.quickHobby.location;

import java.io.File;
import java.io.IOException;

import com.maxmind.geoip.LookupService;
import com.maxmind.geoip.regionName;
import com.maxmind.geoip.Location;
import com.quickHobby.ServerLocation;

public class MemberLocation {

	public static void main(String[] args) {
		MemberLocation loc = new MemberLocation();

		ServerLocation serverLoc = loc.getLocation("192.168.7.166");
		System.out.println(serverLoc);
	}

	public ServerLocation getLocation(String ipAddress) {

		File file = new File("C:\\resources\\location\\GeoLiteCity.dat");
		return getLocation(ipAddress, file);
	}

	public ServerLocation getLocation(String ipAddress, File file) {

		ServerLocation serverLocation = null;

		try {

			serverLocation = new ServerLocation();

			LookupService lookup = new LookupService(file,
					LookupService.GEOIP_MEMORY_CACHE);
			Location locationServices = lookup.getLocation(ipAddress);

			serverLocation.setCountryCode(locationServices.countryCode);
			serverLocation.setCountryName(locationServices.countryName);
			serverLocation.setRegion(locationServices.region);
			serverLocation.setRegionName(regionName.regionNameByCode(
					locationServices.countryCode, locationServices.region));
			serverLocation.setCity(locationServices.city);
			serverLocation.setPostalCode(locationServices.postalCode);
			serverLocation.setLatitude(String
					.valueOf(locationServices.latitude));
			serverLocation.setLongitude(String
					.valueOf(locationServices.longitude));

		} catch (IOException e) {
			System.err.println(e.getMessage());
		}

		return serverLocation;

	}
}
