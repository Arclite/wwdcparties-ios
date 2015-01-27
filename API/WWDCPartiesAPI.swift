//  Created by Geoff Pado on 1/23/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import UIKit

private let LocalAPIBaseURL = "http://localhost:8080"
private let RemoteAPIBaseURL = "https://2015.wwdcparties.com"

// if anyone knows how to correctly get environment variables from
// inside a framework, please let me know. For whatever reason,
// something seems to be prepending $SRCROOT(?) to my custom
// environment variables, which I couldn't figure out how to strip.

public var APIBaseURL: NSURL! {
	if NSProcessInfo.processInfo().environment["USE_LOCAL"] != nil {
		return NSURL(string: LocalAPIBaseURL)
	}
	
	return NSURL(string: RemoteAPIBaseURL)
}

private let WWDCPartiesAppGroupID = "group.com.cocoatype.wwdcparties"
public let Wormhole = MMWormhole(applicationGroupIdentifier: WWDCPartiesAppGroupID, optionalDirectory: "wormhole")