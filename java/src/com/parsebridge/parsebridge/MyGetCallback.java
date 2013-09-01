package com.parsebridge;
 
import com.parse.ParseObject;
import com.parse.ParseException;
import com.parse.GetCallback;

public class MyGetCallback<T extends ParseObject> extends GetCallback {
	public native void done(T object, ParseException ex);
	public MyGetCallback() {}
}
