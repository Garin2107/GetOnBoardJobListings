//
//  Categories.swift
//  GetOnBoardJobListings
//
//  Created by Antonio Garin on 15-03-23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let categories = try? JSONDecoder().decode(Categories.self, from: jsonData)

import Foundation

// MARK: - Categories
struct Categories: Codable {
	var data: [Datum]?
}

// MARK: - Datum
struct Datum: Codable {
	var id: String?
	var type: TypeEnum?
	var attributes: Attributes
}

// MARK: - Attributes
struct Attributes: Codable {
	let name, dimension: String?
}

enum TypeEnum: String, Codable {
	case category = "category"
}



