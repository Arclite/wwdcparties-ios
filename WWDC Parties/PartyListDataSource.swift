//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import UIKit

private let PartyListCellIdentifier = "PartyListCell"

class PartyListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
	var parties = [Party]()
	
	func numberOfSectionsInTableView(UITableView) -> Int {
		return days().count
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return min(1, parties.count)
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let partyCell = tableView.dequeueReusableCellWithIdentifier(PartyListCellIdentifier, forIndexPath: indexPath) as PartyListCell
		partyCell.party = parties[indexPath.row]
		return partyCell
	}
	
	func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String {
		return "Sunday, June 1st"
	}
	
	func days() -> [NSDate] {
		return parties.reduce([NSDate]()) { (contains($0, $1.listingDay!) ? $0 : $0 + [$1.listingDay!]) }
	}
}
