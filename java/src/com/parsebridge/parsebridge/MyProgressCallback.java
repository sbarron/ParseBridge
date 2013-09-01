package com.parsebridge;

import java.lang.Integer;
import com.parse.ProgressCallback;

public class MyProgressCallback extends ProgressCallback {
	public native void done(Integer percentDone);
	public MyProgressCallback() {}
}