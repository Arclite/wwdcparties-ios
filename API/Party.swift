//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import Foundation

public struct Party: Printable {
	public let name: String
	public let startTimeInterval: NSTimeInterval
	public let endTimeInterval: NSTimeInterval
	public let sponsorName: String
	public let sponsorURLString: String
	public let slug: String
	
	public var startDate: NSDate { return NSDate(timeIntervalSince1970: startTimeInterval) }
	public var endDate: NSDate { return NSDate(timeIntervalSince1970: endTimeInterval) }
	public var sponsorURL: NSURL? { return NSURL(string: sponsorURLString) }
	public var shareURL: NSURL? {
		if let partyURL = NSURL(string: "/parties/\(slug)", relativeToURL: APIBaseURL) {
			return partyURL
		} else {
			return APIBaseURL
		}
	}
	public var listingDay: NSDate {
		let components = NSCalendar.currentCalendar().components((.CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay), fromDate: startDate)
		if let listingDay = NSCalendar.currentCalendar().dateFromComponents(components) {
			return listingDay
		} else {
			return NSDate()
		}
	}
	
	public var description: String {
		return name
	}
	
	internal init(_ partyJSON: JSON) {
		name = partyJSON["name"].stringValue
		startTimeInterval = partyJSON["start_time"].doubleValue
		endTimeInterval = partyJSON["end_time"].doubleValue
		sponsorName = partyJSON["sponsor_name"].stringValue
		sponsorURLString = partyJSON["sponsor_url"].stringValue
		slug = partyJSON["slug"].stringValue
	}
}