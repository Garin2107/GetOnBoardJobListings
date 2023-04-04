//
//  OffersViewController.swift
//  GetOnBoardJobListings
//
//  Created by Antonio Garin on 27-03-23.
//

import UIKit

class OffersViewController: UIViewController {
	
	let offersTable = UITableView()
	let presenter = OffersPresenter()
	var offers: OffersResponse?
	var categories: Categories?
	var type = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Offers"
		view.addSubview(offersTable)
		offersTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
		offersTable.delegate = self
		offersTable.dataSource = self
		presenter.getOffers(type: type)
		presenter.setViewDelegate(delegate: self)
		offersTable.backgroundColor = .systemMint
		
	}
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		offersTable.frame = view.bounds
		offersTable.reloadData()
	}
}

extension OffersViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let alert = UIAlertController(title: offers?.data?[indexPath.row].attributes?.title,
									  message: offers?.data?[indexPath.row].attributes?.functions,
									  preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
		}))
		self.present(alert, animated: true, completion: nil)
		alert.message = alert.message?.replacingOccurrences(of: "<li>", with: "")
		alert.message = alert.message?.replacingOccurrences(of: "</li>", with: "")
		alert.message = alert.message?.replacingOccurrences(of: "</div>", with: "")
		alert.message = alert.message?.replacingOccurrences(of: "<div>", with: "")
		alert.message = alert.message?.replacingOccurrences(of: "</ul>", with: "")
		alert.message = alert.message?.replacingOccurrences(of: "<ul>", with: "")
		alert.message = alert.message?.replacingOccurrences(of: "</p>", with: "")
		alert.message = alert.message?.replacingOccurrences(of: "<p>", with: "")
		alert.message = alert.message?.replacingOccurrences(of: "</em>", with: "")
		alert.message = alert.message?.replacingOccurrences(of: "<em>", with: "")
		alert.message = alert.message?.replacingOccurrences(of: "</strong>", with: "")
		alert.message = alert.message?.replacingOccurrences(of: "<strong>", with: "")
		alert.message = alert.message?.replacingOccurrences(of: "<br>", with: "")
		alert.message = alert.message?.replacingOccurrences(of: "</br>", with: "")
		alert.message = alert.message?.replacingOccurrences(of: "</h3>", with: "")
		alert.message = alert.message?.replacingOccurrences(of: "<h3>", with: "")
	}
	

}

extension OffersViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if let countOffers = offers?.data?.count {
			return countOffers
		} else {
			return 10
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		var descriptionText = offers?.data?[indexPath.row].attributes?.description
		descriptionText = descriptionText?.replacingOccurrences(of: "<li>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "</li>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "</div>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "<div>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "</ul>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "<ul>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "</p>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "<p>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "</em>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "<em>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "</strong>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "<strong>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "<br>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "</br>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "</h3>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "<h3>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "</ol>", with: "")
		descriptionText = descriptionText?.replacingOccurrences(of: "<ol>", with: "")
		
		
		
		var listContentConfiguration = UIListContentConfiguration.cell()
		listContentConfiguration.text = offers?.data?[indexPath.row].attributes?.title
		listContentConfiguration.secondaryText = descriptionText
		cell.contentConfiguration = listContentConfiguration
		cell.backgroundColor = .systemOrange
		
		
		return cell
	}
}

extension OffersViewController: OffersPresenterDelegate {
	func presentOffers(offers: OffersResponse) {
		self.offers = offers
		DispatchQueue.main.async {
			self.offersTable.reloadData()
		}
	}
	
	
}
