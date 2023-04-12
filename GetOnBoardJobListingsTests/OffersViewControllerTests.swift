//
//  OffersViewControllerTests.swift
//  GetOnBoardJobListingsTests
//
//  Created by Antonio Garin on 11-04-23.
//

import XCTest
@testable import GetOnBoardJobListings

final class OffersViewControllerTests: XCTestCase {
	
	var sut: OffersViewController!

    override func setUpWithError() throws {
		sut = OffersViewController()
		sut.loadView()
    }

    override func tearDownWithError() throws {
		sut = nil
    }

	func testLoadOffersViewController() throws {
		let tableView = try XCTUnwrap(sut.offersTable)
		let presenter = try XCTUnwrap(sut.presenter)
				
	}
}
