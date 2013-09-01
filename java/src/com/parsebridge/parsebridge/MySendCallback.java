package com.parsebridge;

import com.parse.ParseUser;
import com.parse.ParseException;
import com.parse.SendCallback;

public class MySendCallback extends SendCallback {
	public native void done(ParseException ex);
	public MySendCallback() {}
}