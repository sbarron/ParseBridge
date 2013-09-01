package com.parsebridge;
 
import java.util.List;
import com.parse.ParseException;
import com.parse.FindCallback;
import com.parse.ParseObject;

public class MyFindCallback<T extends ParseObject> extends FindCallback {
	public native void done(List<T> objects, ParseException ex);
	public MyFindCallback() {}
}