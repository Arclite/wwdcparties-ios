//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import Foundation

class APIRequest: NSURLRequest {
	class func baseURL() -> NSURL! {
		if let baseURLString = NSProcessInfo.processInfo().environment["API_BASE"] as? String {
			return NSURL(string: baseURLString)
		}
		
		return NSURL(string: "http://api.wwdcparties.com")
	}
}
