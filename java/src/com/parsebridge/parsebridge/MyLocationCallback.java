package com.parsebridge;

import com.parse.ParseException;
import com.parse.ParseGeoPoint;
import com.parse.LocationCallback;

public class MyLocationCallback extends LocationCallback {
	public native void done(ParseGeoPoint geoPoint, ParseException ex);
	public MyLocationCallback() {}
}