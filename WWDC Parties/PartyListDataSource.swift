//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import UIKit

private let PartyListCellIdentifier = "PartyListCell"

class PartyListDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
	var parties = [Party]()
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return parties.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let partyCell = tableView.dequeueReusableCellWithIdentifier(PartyListCellIdentifier, forIndexPath: indexPath) as PartyListCell
		partyCell.party = parties[indexPath.row]
		return partyCell
	}
	
	func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
		let sectionView = PartyListSectionHeaderView()
		
		return sectionView
	}
	
	func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 83.0
	}
}
