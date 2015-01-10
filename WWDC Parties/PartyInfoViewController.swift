//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import UIKit

private let PartyInfoUserActivityType = "com.cocoatype.wwdcparties.party-view"

class PartyInfoViewController: UIViewController {
	@IBOutlet weak var nameLabel: UILabel!

	var party: Party? {
		didSet {
			self.configureView()
		}
	}

	func configureView() {
		if let representedParty = self.party {
			navigationItem.title = representedParty.name
			self.userActivity = viewActivityForParty(representedParty)
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.configureView()
	}
	
	func viewActivityForParty(party: Party) -> NSUserActivity {
		let userActivity = NSUserActivity(activityType: PartyInfoUserActivityType)
		userActivity.webpageURL = NSURL(string: "/parties/\(party.slug)", relativeToURL: APIBaseURL)
		
		return userActivity
	}
}

