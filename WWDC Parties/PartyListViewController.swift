//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import UIKit

private let ShowPartyInfoSegueIdentifier = "ShowPartyInfo"

class PartyListViewController: UITableViewController {
	@IBOutlet var dataSource: PartyListDataSource!
	var partyInfoViewController: PartyInfoViewController?
	let partyHandler = PartyHandler()

	override func awakeFromNib() {
		super.awakeFromNib()
		if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
		    self.clearsSelectionOnViewWillAppear = false
		    self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		if let split = self.splitViewController {
		    let controllers = split.viewControllers
		    partyInfoViewController = controllers[controllers.count-1].topViewController as? PartyInfoViewController
		}
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		refreshPartyList(nil)
	}
	
	@IBAction func refreshPartyList(sender: UIRefreshControl?) {
		partyHandler.fetchParties { (parties, error) in
			self.dataSource.parties = parties
			dispatch_async(dispatch_get_main_queue()) {
				self.tableView.reloadData()
				if let refreshControl = sender {
					refreshControl.endRefreshing()
				}
			}
		}
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == ShowPartyInfoSegueIdentifier {
		    if let indexPath = tableView.indexPathForSelectedRow() {
		        let controller = (segue.destinationViewController as UINavigationController).topViewController as PartyInfoViewController
				controller.party = dataSource.partyForIndexPath(indexPath)
		        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
		        controller.navigationItem.leftItemsSupplementBackButton = true
		    }
		}
	}
}
