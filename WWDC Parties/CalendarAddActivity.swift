//
//  CalendarAddActivity.swift
//  WWDC Parties
//
//  Created by Geoff Pado on 4/12/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.
//

import EventKit
import UIKit
import WWDCPartiesAPI

private let CalendarAddActivityType = "com.cocoatype.wwdcparties.calendar-add"

class CalendarAddActivity: UIActivity {
	private var name : String?
	private var startDate : NSDate?
	private var endDate : NSDate?
	private let eventStore = EKEventStore()

	override func activityType() -> String? {
		return CalendarAddActivityType
	}
	
	override func activityTitle() -> String? {
		return NSLocalizedString("CALENDAR_ADD_ACTIVITY_TITLE", comment: "Title for the calendar add activity.")
	}
	
	override func activityImage() -> UIImage? {
		return UIImage(named: "AppIcon")
	}
	
	override func canPerformWithActivityItems(activityItems: [AnyObject]) -> Bool {
		return datesInArray(activityItems).count == 2
	}
	
	override func prepareWithActivityItems(activityItems: [AnyObject]) {
		let strings = activityItems.filter { item in
			return item is String
		} as! [String]
		
		name = strings.first

		let dates = datesInArray(activityItems)
		startDate = dates.first!.earlierDate(dates.last!)
		endDate = dates.first!.laterDate(dates.last!)
	}
	
	override func performActivity() {
		eventStore.requestAccessToEntityType(EKEntityTypeEvent, completion: { (granted, error) -> Void in
			if let startDate = self.startDate, endDate = self.endDate, name = self.name where granted {
				let event = EKEvent(eventStore: self.eventStore)
				event.title = name
				event.startDate = startDate
				event.endDate = endDate
				event.calendar = self.eventStore.defaultCalendarForNewEvents
				
				var err: NSError?
				if self.eventStore.saveEvent(event, span: EKSpanThisEvent, commit: true, error: &err) == false {
					if let error = err {
						NSLog("error saving calendar event: %@", error)
					}
				}
			}
		})
	}
	
	func datesInArray(array: [AnyObject]) -> [NSDate] {
		return array.filter { item in
			return item is NSDate
		} as! [NSDate]
	}
}
