/*
 * ParseBridge: https://github.com/sbarron/ParseBridge
 *
 * Copyright (c) 2013 Spencer Barron & Matt Hudson
 *
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

#import "ParseFile.h"

@implementation ParseFile

 //Constructors
 //*- Java: public ParseFile(byte[] data)
 //Creates a new file from a byte array.

  //*- Java: public ParseFile(String name,byte[] data)
  //Creates a new file from a byte array and a name. Giving a name with a proper file extension (e.g. ".png") is ideal because it allows Parse to deduce the content type of the file and set appropriate HTTP headers when it is fetched.

  //Methods
   //*- Java: public String getName()
   //The filename. Before save is called, this is just the filename given by the user (if any). After save is called, that name gets prefixed with a unique identifier.
 
	 //*- Java: public boolean isDirty()
	//Whether the file still needs to be saved.
 

	 //*- Java: public boolean isDataAvailable()
 
	 //*- Java: public String getUrl()

	 //*- Java: public void save()
 
	 //*- Java: public void saveInBackground(SaveCallback saveCallback,ProgressCallback progressCallback)
	//Saves the file to the Parse cloud in a background thread. progressCallback is guaranteed to be called with 100 before saveCallback is called.
 

	 //*- Java: public void saveInBackground(SaveCallback callback)
	//Saves the file to the Parse cloud in a background thread.

	 //*- Java: public void saveInBackground()
	//Saves the file to the Parse cloud in a background thread.

	 //*- Java: public byte[] getData()
	//Synchronously gets the data for this object. You probably want to use ParseFile.getDataInBackground(com.parse.GetDataCallback, com.parse.ProgressCallback) instead unless you're already in a background thread.

	 //*- Java: public void getDataInBackground(GetDataCallback dataCallback,ProgressCallback progressCallback)
	//Gets the data for this object in a background thread. progressCallback is guaranteed to be called with 100 before dataCallback is called.

	//*- Java: public void getDataInBackground(GetDataCallback dataCallback)

	//*- Java: public void cancel()
 //Cancels the current network request and callbacks whether it's uploading or fetching data from the server.

@end
