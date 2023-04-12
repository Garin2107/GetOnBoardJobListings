//
//  OffersPresenterTests.swift
//  GetOnBoardJobListingsTests
//
//  Created by Antonio Garin on 11-04-23.
//

import XCTest
@testable import GetOnBoardJobListings

final class OffersPresenterTests: XCTestCase {

	var sut: OffersPresenter!
	var sutDelegate: OffersPresenterMock!
	var type = "mobile"
	
    override func setUpWithError() throws {
		sutDelegate = OffersPresenterMock()
		sut = OffersPresenter()
		
    }

    override func tearDownWithError() throws {
        sut = nil
		sutDelegate = nil
    }
	func test_GetOffers() {
		sut.getOffers(type: type)
		
	}

    func testExample() throws {
       
    }
}

class OffersPresenterMock: OffersPresenterDelegate {
	func presentOffers(offers: GetOnBoardJobListings.OffersResponse) {
		
	}
	
}


