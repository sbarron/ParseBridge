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

#import "ParseGeoPoint.h"

@implementation ParseGeoPoint



 //Constructors
 //*- Java: ParseGeoPoint()
	//Creates a new default point with latitude and longitude set to 0.0.
 //*- Java: ParseGeoPoint(double latitude, double longitude)
	//Creates a new point with the specified latitude and longitude.


 //Methods
	//*- Java: double	distanceInKilometersTo(ParseGeoPoint point)
	//Get distance between this point and another geopoint in kilometers.
	
	//*- Java:double	distanceInMilesTo(ParseGeoPoint point)
	//Get distance between this point and another geopoint in kilometers.

	//*- Java:double	distanceInRadiansTo(ParseGeoPoint point)
	//Get distance in radians between this point and another GeoPoint.

	//*- Java:static void	getCurrentLocationInBackground(long timeout, Criteria criteria, LocationCallback callback)
	//Fetches the user's current location and returns a new ParseGeoPoint via the provided LocationCallback.

	 //*- Java:static void	getCurrentLocationInBackground(long timeout, LocationCallback callback)
	//Fetches the user's current location and returns a new ParseGeoPoint via the provided LocationCallback.

	 //*- Java: double	getLatitude()
	//Get latitude.

	 //*- Java: double	getLongitude()
	//Get longitude.

	 //*- Java:void	setLatitude(double latitude)
	//Set latitude.

	 //*- Java: void	setLongitude(double longitude)
	//Set longitude.


@end
