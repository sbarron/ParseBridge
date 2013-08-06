package com.parsebridge.parsebridge;

import android.util.Log;
import android.content.Context;

public class ParseManager {

    private static final String TAG = "ParseManager";

    private native void bridgeCallback(int i);

    public ParseManager(Context c) {
       bridgeCallback(1);
    }
}