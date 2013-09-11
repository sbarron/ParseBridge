package com.parsebridge;
 
import com.parse.*;

public class MySaveCallback extends SaveCallback {
	public native void done(ParseException ex);
	public MySaveCallback() {}
}
