package com.apportable.demo;

import android.util.Log;

public class HelloBridge {

    private int mIntValue;
    private double mDoubleVal;

    private static final String TAG = "HelloBridge";

    private native void bridgeCallback(int i, double d);

    public HelloBridge(int i, double d) {
        
        mIntValue = i;
        mDoubleVal = d;
    }

    public void setIntValue(int i) {
        mIntValue = i;
        Log.d(TAG, "Java int value changed " + i);
        bridgeCallback(mIntValue, mDoubleVal);
    }

    public int getIntValue() {
        return mIntValue;
    }

    public void setDoubleValue(double d) {
        mDoubleVal = d;
        Log.d(TAG, "Java double value changed " + d);
        bridgeCallback(mIntValue, mDoubleVal);
    }

    public double getDoubleValue() {
        return mDoubleVal;
    }
}