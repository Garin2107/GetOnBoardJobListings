//
//  GetOnBoardJobListingsTests.swift
//  GetOnBoardJobListingsTests
//
//  Created by Antonio Garin on 14-03-23.
//

import XCTest
@testable import GetOnBoardJobListings

final class GetOnBoardJobListingsTests: XCTestCase {

	func cat() {
		let presenter = CategoryPresenter()
		
		let result = presenter.getCategories
		
		XCTAssertNotNil(result)
	}
	func offers() {
		let offersPresenter = OffersPresenter()
		var response = offersPresenter.getOffers
		
		XCTAssertNotNil(response)
	}

}
