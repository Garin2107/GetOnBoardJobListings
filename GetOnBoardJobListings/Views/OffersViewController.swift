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
		let activity = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
		activity.center = view.center
		activity.style = .large
		
		view.addSubview(offersTable)
		view.addSubview(activity)
		offersTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
		offersTable.delegate = self
		offersTable.dataSource = self
		offersTable.backgroundColor = .white
		presenter.getOffers(type: type)
		presenter.setViewDelegate(delegate: self)
		
		DispatchQueue.main.asyncAfter(deadline: .now()) {
			activity.startAnimating()
		}
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			activity.stopAnimating()
		}
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
		guard let jobOffer = offers?.data?[indexPath.row].attributes?.title else { return }
		guard let jobDescription = offers?.data?[indexPath.row].attributes?.description else { return }
		
		let viewController = OfferDetail()
		viewController.header = jobOffer
		viewController.body	= jobDescription
		self.navigationController?.pushViewController(viewController, animated: true)
	}
}

extension OffersViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let countOffers = offers?.data?.count else { return 0 }
		return countOffers
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		guard var descriptionText = offers?.data?[indexPath.row].attributes?.description else { return cell }
		
		var listContentConfiguration = UIListContentConfiguration.cell()
		listContentConfiguration.text = offers?.data?[indexPath.row].attributes?.title

		descriptionText = descriptionText.replacingOccurrences(of: "<li>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "</li>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "</div>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "<div>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "</ul>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "<ul>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "</p>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "<p>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "</em>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "<em>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "</strong>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "<strong>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "<br>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "</br>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "</h3>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "<h3>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "</ol>", with: "")
		descriptionText = descriptionText.replacingOccurrences(of: "<ol>", with: "")
		
		listContentConfiguration.secondaryText = descriptionText
		cell.contentConfiguration = listContentConfiguration
		cell.backgroundColor = .white
		
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

