//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import UIKit

struct Party {
	let name :String
}

typealias PartyListCompletionHandler = ([Party], NSError!) -> Void

private let _SharedAPIHandler = APIHandler()

class APIHandler: NSObject {
	class var sharedHandler: APIHandler {
		return _SharedAPIHandler
	}

	func fetchParties(completionHandler: PartyListCompletionHandler) {
		if let request = self.partiesRequest() {
			let fetchTask = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
				println(data)
			}
			
			fetchTask.resume()
		}
	}
	
	func partiesRequest() -> NSURLRequest? {
		if let partiesURL = NSURL(string: "/parties", relativeToURL: APIRequest.baseURL()) {
			return NSURLRequest(URL: partiesURL)
		} else {
			return nil
		}
	}
}
