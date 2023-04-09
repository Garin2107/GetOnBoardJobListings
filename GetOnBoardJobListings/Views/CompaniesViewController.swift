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
		companiesTable.register(CompanyTableViewCell.self, forCellReuseIdentifier: "cell")
		
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
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
}

extension CompaniesViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let countOfCompanies = companies?.data?.count else { return 0 }
		return countOfCompanies
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CompanyTableViewCell
		guard let companyName = companies?.data?[indexPath.row].attributes?.name else { return UITableViewCell() }
		guard let companyDescription = companies?.data?[indexPath.row].attributes?.description else { return UITableViewCell()}
		guard let companyImage = companies?.data?[indexPath.row].attributes?.logo else {return UITableViewCell()}
		cell.companyLabel.text = companyName
		cell.companyDetailedLabel.text = companyDescription
		cell.companyImage.image = UIImage(named: companyImage)
		 
		//var listContentConfiguration = UIListContentConfiguration.cell()
		//listContentConfiguration.text = companies?.data?[indexPath.row].attributes?.name
		//listContentConfiguration.secondaryText = companies?.data?[indexPath.row].attributes?.description
		//cell.contentConfiguration = listContentConfiguration
		//cell.backgroundColor = .systemOrange
		
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
