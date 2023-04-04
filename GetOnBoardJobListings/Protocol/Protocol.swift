//
//  Protocol.swift
//  GetOnBoardJobListings
//
//  Created by Antonio Garin on 30-03-23.
//

import Foundation

protocol ListCompanyControllerProtocol: AnyObject {
	func successList(model: [Companies])
	func successCategoryList(model: [Categories])
	func successOffersList(model: [Offers])
	func errorList()
}
