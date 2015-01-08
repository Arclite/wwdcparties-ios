//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import UIKit

class PartyListViewController: UITableViewController {
	@IBOutlet var dataSource: PartyListDataSource!
	var detailViewController: DetailViewController? = nil
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
		    self.detailViewController = controllers[controllers.count-1].topViewController as? DetailViewController
		}
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		partyHandler.fetchParties { (parties, error) in
			self.dataSource.parties = parties
			dispatch_async(dispatch_get_main_queue(), { self.tableView.reloadData() })
		}
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "showDetail" {
		    if let indexPath = self.tableView.indexPathForSelectedRow() {
		        let party = dataSource.parties[indexPath.row]
		        let controller = (segue.destinationViewController as UINavigationController).topViewController as DetailViewController
		        controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
		        controller.navigationItem.leftItemsSupplementBackButton = true
		    }
		}
	}
}
