//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import UIKit

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
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.configureView()
	}
}

