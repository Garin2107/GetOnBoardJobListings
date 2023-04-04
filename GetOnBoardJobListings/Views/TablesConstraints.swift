//
//  TablesConstraints.swift
//  GetOnBoardJobListings
//
//  Created by Antonio Garin on 20-03-23.
//

import UIKit

extension UIView {
	func pin(to superView: UIView) {
		translatesAutoresizingMaskIntoConstraints = false
		topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
		leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
		trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
		bottomAnchor.constraint(equalTo: bottomAnchor.tableView).isActive = true
	}
}

