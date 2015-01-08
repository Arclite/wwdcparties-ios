//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import UIKit

struct Party: Printable {
	let name :String
	var description: String {
		return name
	}
	
	init(_ partyJSON: JSON) {
		name = partyJSON["name"].stringValue
	}
}

typealias PartyListCompletionHandler = ([Party], NSError!) -> Void

private let _SharedPartyHandler = PartyHandler()

class PartyHandler {
	class var sharedHandler: PartyHandler {
		return _SharedPartyHandler
	}
	
	class var request: NSURLRequest? {
		if let partiesURL = NSURL(string: "/parties", relativeToURL: APIBaseURL) {
			return NSURLRequest(URL: partiesURL)
		} else {
			return nil
		}
	}

	func fetchParties(completionHandler: PartyListCompletionHandler) {
		if let request = PartyHandler.request {
			NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
				let partiesJSONArray = JSON(data: data).arrayValue
				let parties = map(partiesJSONArray) { Party($0) }
				completionHandler(parties, error)
			}.resume()
		}
	}
}
