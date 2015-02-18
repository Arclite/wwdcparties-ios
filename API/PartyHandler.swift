//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import UIKit

public typealias PartyListCompletionHandler = ([Party], NSError!) -> Void

public class PartyHandler {
	class var request: NSURLRequest? {
		if let partiesURL = NSURL(string: "/parties/", relativeToURL: APIBaseURL) {
			return NSURLRequest(URL: partiesURL)
		} else {
			return nil
		}
	}

	public func fetchParties(completionHandler: PartyListCompletionHandler) {
		if let request = PartyHandler.request {
			NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
				let partiesJSONArray = JSON(data: data).arrayValue
				let parties = map(partiesJSONArray) { Party($0) }.sorted(){ $0.startDate.compare($1.startDate) == NSComparisonResult.OrderedAscending }
				completionHandler(parties, error)
			}.resume()
		}
	}
	
	public init() {}
}
