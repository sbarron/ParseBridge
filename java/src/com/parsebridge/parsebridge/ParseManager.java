package com.parsebridge;

import java.util.List;
import java.lang.Integer;
import android.util.Log;
import android.content.Context;
import com.parse.Parse;
import com.parse.ParseUser;
import com.parse.ParseObject;
import com.parse.ParseGeoPoint;
import com.parse.ParseException;
import com.parse.LogInCallback;
import com.parse.CountCallback;
import com.parse.FindCallback;
import com.parse.FunctionCallback;
import com.parse.GetCallback;
import com.parse.LocationCallback;
import com.parse.LogInCallback;
import com.parse.ProgressCallback;
import com.parse.RefreshCallback;
import com.parse.SaveCallback;
import com.parse.RequestPasswordResetCallback;
import com.parse.SendCallback;
import com.parse.SignUpCallback;
 

public class MyLoginCallback implements LoginCallback {
	public native void done(ParseUser user, ParseException ex);
	public MyLoginCallback() {}
}

public class MyCountCallback implements CountCallback {
	public native void done(int count, ParseException ex);
	public MyCountCallback() {}
}

public class MyFindCallback implements FindCallback {
	public native void done(List<T> objects, ParseException ex);
	public MyFindCallback() {}
}

public class MyFunctionCallback implements FunctionCallback {
	public native void done(T object, ParseException ex);
	public MyFunctionCallback() {}
}

public class MyGetCallback implements GetCallback {
	public native void done(T object, ParseException ex);
	public MyGetCallback() {}
}

public class MyGetDataCallback implements GetDataCallback {
	public native void done(byte[] data, ParseException ex);
	public MyGetDataCallback() {}
}

public class MyLocationCallback implements LocationCallback {
	public native void done(ParseGeoPoint geoPoint, ParseException ex);
	public MyLocationCallback() {}
}

public class MyProgressCallback implements ProgressCallback {
	public native void done(Integer percentDone);
	public MyProgressCallback() {}
}

public class MyRefreshCallback implements RefreshCallback {
	public native void done(ParseObject object, ParseException ex);
	public MyRefreshCallback() {}
}

public class MyRequestPasswordResetCallback implements RequestPasswordResetCallback {
	public native void done(ParseException ex);
	public MyRequestPasswordResetCallback() {}
}

public class MySaveCallback implements SaveCallback {
	public native void done(ParseException ex);
	public MySaveCallback() {}
}

public class MySendCallback implements SendCallback {
	public native void done(ParseException ex);
	public MySendCallback() {}
}

public class MySignUpCallback implements SignUpCallback {
	public native void done(ParseException ex);
	public MySignUpCallback() {}
}