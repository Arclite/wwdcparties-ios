//  Created by Geoff Pado on 1/23/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import WatchKit
import Foundation

class PartyInfoController: WKInterfaceController {
	@IBOutlet weak var nameLabel: WKInterfaceLabel!
	@IBOutlet weak var dateLabel: WKInterfaceLabel!
	@IBOutlet weak var addressLabel: WKInterfaceLabel!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
		
		nameLabel.setText("Introducing Mapbox GL")
		dateLabel.setText("Monday, 6:00 PM–8:00 PM")
		addressLabel.setText("Mapbox HQ\n149 9th Street")
    }
}
