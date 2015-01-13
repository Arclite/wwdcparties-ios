//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import Foundation

struct Party: Printable {
	let name: String
	let startTimeInterval: NSTimeInterval
	let endTimeInterval: NSTimeInterval
	let sponsorName: String
	let sponsorURLString: String
	let slug: String
	
	var startDate: NSDate { return NSDate(timeIntervalSince1970: startTimeInterval) }
	var endDate: NSDate { return NSDate(timeIntervalSince1970: endTimeInterval) }
	var sponsorURL: NSURL? { return NSURL(string: sponsorURLString) }
	var shareURL: NSURL {
		if let partyURL = NSURL(string: "/parties/\(slug)", relativeToURL: APIBaseURL) {
			return partyURL
		} else {
			return APIBaseURL
		}
	}
	var listingDay: NSDate {
		let components = NSCalendar.currentCalendar().components((.YearCalendarUnit | .MonthCalendarUnit | .DayCalendarUnit), fromDate: startDate)
		if let listingDay = NSCalendar.currentCalendar().dateFromComponents(components) {
			return listingDay
		} else {
			return NSDate()
		}
	}
	
	var description: String {
		return name
	}
	
	init(_ partyJSON: JSON) {
		name = partyJSON["name"].stringValue
		startTimeInterval = partyJSON["start_time"].doubleValue
		endTimeInterval = partyJSON["end_time"].doubleValue
		sponsorName = partyJSON["sponsor_name"].stringValue
		sponsorURLString = partyJSON["sponsor_url"].stringValue
		slug = partyJSON["slug"].stringValue
	}
}