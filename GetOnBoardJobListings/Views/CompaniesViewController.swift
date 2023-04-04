//
//  CompaniesViewController.swift
//  GetOnBoardJobListings
//
//  Created by Antonio Garin on 20-03-23.
//


import UIKit

class CompaniesViewController: UIViewController {
	
	let companiesTable = UITableView()
	let presenter = CompaniesPresenter()
	var companies: Companies?
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Companies"
		view.addSubview(companiesTable)
		companiesTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
		companiesTable.delegate = self
		companiesTable.dataSource = self
		companiesTable.backgroundColor = .systemMint
		
		presenter.getCompanies()
		presenter.setViewDelegate(delegate: self)
	
	}
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		companiesTable.frame = view.bounds
		companiesTable.reloadData()
		
	}
	
	
}
 
extension CompaniesViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
	}
}

extension CompaniesViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		if let countOfCompanies = companies?.data?.count {
			return countOfCompanies
		} else {
			return 10
		}
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		
		var listContentConfiguration = UIListContentConfiguration.cell()
		listContentConfiguration.text = companies?.data?[indexPath.row].attributes?.name
		listContentConfiguration.secondaryText = companies?.data?[indexPath.row].attributes?.description
		guard let companyImage = companies?.data?[indexPath.row].attributes?.logo else { return cell }
			//listContentConfiguration.image = UIImage(named: companyImage)
	
		
		
		if let url = URL(string: companyImage) {
			let task = URLSession.shared.dataTask(with: url) { data, response, error in
				guard let data = data, error == nil else { return }
				
				//DispatchQueue.main.async { /// execute on main thread
				//	self. = UIImage(data: data)
				//}
				listContentConfiguration.image = UIImage(data: data)
			}
			
			task.resume()
		}
		
		cell.contentConfiguration = listContentConfiguration
		cell.backgroundColor = .systemOrange
		
		
		return cell
	}

}

extension CompaniesViewController: CompaniesPresenterDelegate {
	func presentCompanies(company: Companies) {
		self.companies = company
		DispatchQueue.main.async {
			self.companiesTable.reloadData()
		}
	}
	
}
