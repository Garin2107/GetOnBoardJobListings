//
//  CategoriesViewControllerTests.swift
//  GetOnBoardJobListingsTests
//
//  Created by Antonio Garin on 11-04-23.
//

import XCTest
@testable import GetOnBoardJobListings

final class CategoriesViewControllerTests: XCTestCase {
	
	var sut: CategoriesViewController!

    override func setUpWithError() throws {
        sut = CategoriesViewController()
		sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
       sut = nil
    }

    func testLoadCategoriesViewController() throws {
		let tableView = try XCTUnwrap(sut.categoriesTable)
		let presenter = try XCTUnwrap(sut.presenter)
    }

}
