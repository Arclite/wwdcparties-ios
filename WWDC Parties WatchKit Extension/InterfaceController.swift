//  Created by Geoff Pado on 1/23/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import WatchKit
import Foundation

private let PartyTableRowType = "PartyTableRow"

class InterfaceController: WKInterfaceController {
	@IBOutlet weak var favoritesTable: WKInterfaceTable!
	
	override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
		favoritesTable.setNumberOfRows(1, withRowType: PartyTableRowType)
		
		for i in 0..<favoritesTable.numberOfRows {
			if let row = favoritesTable.rowControllerAtIndex(i) as? PartyRow {
				row.partyNameLabel.setText("Introducing Mapbox GL")
			}
		}
    }
}
