//
//  OffersPresenter.swift
//  GetOnBoardJobListings
//
//  Created by Antonio Garin on 27-03-23.
//

import UIKit

protocol OffersPresenterDelegate: AnyObject {
	func presentOffers(offers: OffersResponse)
}

class OffersPresenter {
	var delegate: OffersPresenterDelegate?
	
	func getOffers(type: String) {
		
		guard let url = URL(string: "https://www.getonbrd.com/api/v0/categories/\(type)/jobs?expand=[%22company%22]") else { return }
		let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
			guard let data = data, error == nil else {
				return
			}
			do {
				let offers = try JSONDecoder().decode(OffersResponse.self, from: data)
				self?.delegate?.presentOffers(offers: offers)
				
			} catch {
				print(error)
			}
		}
		task.resume()
	}
	
	func setViewDelegate(delegate: OffersPresenterDelegate) {
		self.delegate = delegate
	}
}
