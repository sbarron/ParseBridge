package com.parsebridge;
 
import com.parse.ParseException;
import com.parse.SaveCallback;

public class MySaveCallback extends SaveCallback {
	public native void done(ParseException ex);
	public MySaveCallback() {}
}
