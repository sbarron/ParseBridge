package com.parsebridge.parsebridge;

import android.util.Log;
import android.content.Context;

import com.parse.Parse;
import com.parse.ParseAnalytics;
import com.parse.ParseObject;

public class ParseManager {

   // private int;
   // private double mDoubleVal;

    private static final String TAG = "ParseManager";

    private native void bridgeCallback(int i);

    //public ParseManager(){}
    
    public ParseManager(Context c) {
       Parse.initialize(c, "mANv6XA4LjD2mCEWqCI57Y1EiMUhwTZ2ljohI1oj", "9k2ANcaIUf5m9lgzwNzvQdGdqnLid8b5P7RYOXKd"); 
       bridgeCallback(1);
    }

	public void createTestObject(){
		ParseObject testObject = new ParseObject("TestObject");
		testObject.put("foo", "bar");
		testObject.saveInBackground();
		bridgeCallback(1);
	}
	
	public void testClass(){
		Log.i(TAG,"Testing ParseManager");
	}
}