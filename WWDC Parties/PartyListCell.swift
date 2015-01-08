//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import UIKit

class PartyListCell: UITableViewCell {
	var party: Party? {
		didSet {
			textLabel.text = party?.name
		}
	}
}
