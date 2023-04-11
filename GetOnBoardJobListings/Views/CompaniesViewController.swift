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
		let activity = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
		activity.center = view.center
		activity.style = .large
		view.addSubview(companiesTable)
		view.addSubview(activity)
		companiesTable.register(CompanyTableViewCell.self, forCellReuseIdentifier: "cell")
		companiesTable.delegate = self
		companiesTable.dataSource = self
		companiesTable.backgroundColor = .white
		
		presenter.getCompanies()
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
		companiesTable.frame = view.bounds
		companiesTable.reloadData()
	}
}

extension CompaniesViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		guard let companyName = companies?.data?[indexPath.row].attributes?.name else { return }
		guard let companyDescription = companies?.data?[indexPath.row].attributes?.description else { return }
		let alert = UIAlertController(title: companyName,
									  message: companyDescription,
									  preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
		}))
		self.present(alert, animated: true, completion: nil)
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
		guard let companyImage = companies?.data?[indexPath.row].attributes?.logo else {return UITableViewCell()}
		cell.companyLabel.text = companyName
		cell.companyImage.loadFrom(URLAddress: companyImage)
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


