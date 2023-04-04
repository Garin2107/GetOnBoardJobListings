//
//  OffersPresenter.swift
//  GetOnBoardJobListings
//
//  Created by Antonio Garin on 22-03-23.
//

import Foundation
import UIKit

protocol CompaniesPresenterDelegate {
	func presentCompanies(company: Companies)
}

class CompaniesPresenter {
	
	
	var delegate: CompaniesPresenterDelegate?
	
	public func getCompanies() {
		
		guard let url = URL(string: "https://www.getonbrd.com/api/v0/companies") else { return }
		
		let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
			
			guard let data = data, error == nil else {
				return
			}
			do {
				let companies = try JSONDecoder().decode(Companies.self, from: data)

				self?.delegate?.presentCompanies(company: companies)

			} catch {
				print(error)
			}
			
		
		}
		task.resume()
		
		
		
	}
	
	func setViewDelegate(delegate: CompaniesPresenterDelegate & UIViewController) {
		self.delegate = delegate
	}
	
}

