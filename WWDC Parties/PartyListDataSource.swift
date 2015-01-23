//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import WWDCPartiesAPI
import UIKit

private let PartyListCellIdentifier = "PartyListCell"
private var PartyListDateFormatter :NSDateFormatter?

class PartyListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
	var parties = [Party]()
	class var dateFormatter: NSDateFormatter {
		if let dateFormatter = PartyListDateFormatter {
			return dateFormatter
		} else {
			PartyListDateFormatter = NSDateFormatter()
			PartyListDateFormatter!.dateStyle = .LongStyle
			return PartyListDateFormatter!
		}
	}
	
	func numberOfSectionsInTableView(UITableView) -> Int {
		return days().count
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return partiesForDate(days()[section]).count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let partyCell = tableView.dequeueReusableCellWithIdentifier(PartyListCellIdentifier, forIndexPath: indexPath) as PartyListCell
		partyCell.party = partyForIndexPath(indexPath)
		return partyCell
	}
	
	func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String {
		return PartyListDataSource.dateFormatter.stringFromDate(days()[section])
	}
	
	func days() -> [NSDate] {
		return parties.reduce([NSDate]()) { (contains($0, $1.listingDay) ? $0 : $0 + [$1.listingDay]) }
	}
	
	func partiesForDate(date: NSDate) -> [Party] {
		return parties.filter() { $0.listingDay.isEqualToDate(date) }
	}
	
	func partyForIndexPath(indexPath: NSIndexPath) -> Party {
		return partiesForDate(days()[indexPath.section])[indexPath.row]
	}
}
