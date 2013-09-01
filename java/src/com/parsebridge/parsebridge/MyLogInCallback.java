package com.parsebridge;

import com.parse.*;

public class MyLogInCallback extends LogInCallback {
	public native void done(ParseUser user, ParseException ex);
	public MyLogInCallback() {}
}
