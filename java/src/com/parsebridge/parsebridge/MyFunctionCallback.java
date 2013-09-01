package com.parsebridge;
 
import java.lang.Object;
import com.parse.ParseException;
import com.parse.ParseObject;
import com.parse.FunctionCallback;

public class MyFunctionCallback<T> extends FunctionCallback {
	public native void done(T object, ParseException ex);
	public MyFunctionCallback() {}
}

