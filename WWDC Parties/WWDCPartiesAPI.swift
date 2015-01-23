//  Created by Geoff Pado on 1/23/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import UIKit

var APIBaseURL: NSURL! {
	if let baseURLString = NSProcessInfo.processInfo().environment["API_BASE"] as? String {
		return NSURL(string: baseURLString)
	}
	
	return NSURL(string: "https://2015.wwdcparties.com")
}

private let WWDCPartiesAppGroupID = "group.com.cocoatype.wwdcparties"
let WWDCPartiesWormhole = MMWormhole(applicationGroupIdentifier: WWDCPartiesAppGroupID, optionalDirectory: "wormhole")