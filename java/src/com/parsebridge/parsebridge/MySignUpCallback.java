package com.parsebridge;

import com.parse.ParseUser;
import com.parse.ParseException;
import com.parse.SignUpCallback;

public class MySignUpCallback extends SignUpCallback {
	public native void done(ParseException ex);
	public MySignUpCallback() {}
}
