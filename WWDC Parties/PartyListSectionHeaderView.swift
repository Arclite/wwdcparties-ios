//  Created by Geoff Pado on 1/7/15.
//  Copyright (c) 2015 Cocoatype, LLC. All rights reserved.

import UIKit

class PartyListSectionHeaderView: UIView {
	var sectionColor = UIColor.redColor()

	override func drawRect(rect: CGRect) {
		sectionColor.set()
		UIBezierPath(roundedRect: bounds, byRoundingCorners: .TopLeft | .TopRight, cornerRadii: CGSizeMake(16.0, 16.0)).fill()
	}
}
