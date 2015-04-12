//  Created by Geoff Pado on 1/23/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import UIKit

#if USE_LOCAL_API
	public let APIBaseURL = NSURL(string: "http://localhost:8080")
#else
	public let APIBaseURL  = NSURL(string: "https://2015.wwdcparties.com")
#endif

private let WWDCPartiesAppGroupID = "group.com.cocoatype.wwdcparties"
public let Wormhole = MMWormhole(applicationGroupIdentifier: WWDCPartiesAppGroupID, optionalDirectory: "wormhole")