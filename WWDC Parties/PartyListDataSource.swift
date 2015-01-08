//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import UIKit

private let PartyListCellIdentifier = "PartyListCell"

class PartyListDataSource: NSObject, UITableViewDataSource {
	var parties = [Party]()
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return parties.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier(PartyListCellIdentifier, forIndexPath: indexPath) as UITableViewCell
		
		let party = parties[indexPath.row]
		cell.textLabel.text = party.name
		return cell
	}
}
