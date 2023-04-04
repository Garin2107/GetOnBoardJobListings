//
//  TabBarViewController.swift
//  GetOnBoardJobListings
//
//  Created by Antonio Garin on 22-03-23.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
	 
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		view.backgroundColor = .systemMint
		UITabBar.appearance().barTintColor = .systemMint
		tabBar.tintColor = .label
		setupVCs()
	}
	
	fileprivate func createNavController(for rootViewController: UIViewController,
										 title: String,
										 image: UIImage) -> UIViewController {
		let navController = UINavigationController(rootViewController: rootViewController)
		navController.tabBarItem.title = title
		navController.tabBarItem.image = image
		navController.navigationBar.prefersLargeTitles = true
		navController.navigationBar.backgroundColor = .systemMint
		rootViewController.navigationItem.title = title
		
		return navController
	}
	
	func setupVCs() {
		  viewControllers = [
			createNavController(for: CategoriesViewController(),
								title: NSLocalizedString("Categories", comment: ""),
								image: UIImage(systemName: "list.bullet")!),
			createNavController(for: CompaniesViewController(),
								title: NSLocalizedString("Job Listings", comment: ""),
								image: UIImage(systemName: "person.3.sequence")!),
			  
		  ]
		
	}
}

