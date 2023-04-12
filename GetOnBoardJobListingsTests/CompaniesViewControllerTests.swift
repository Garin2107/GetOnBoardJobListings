//
//  CompaniesViewControllerTests.swift
//  GetOnBoardJobListingsTests
//
//  Created by Antonio Garin on 11-04-23.
//

import XCTest
@testable import GetOnBoardJobListings

final class CompaniesViewControllerTests: XCTestCase {
	
	var sut: CompaniesViewController!

    override func setUpWithError() throws {
        sut = CompaniesViewController()
		sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testLoadCompaniesViewController() throws {
		let presenter = try XCTUnwrap(sut.presenter)
		let tableView = try XCTUnwrap(sut.companiesTable)
		
    }

}
