
import Foundation

struct OffersResponse: Codable {
	let data: [Offers]?
}

struct Offers: Codable {
	let id: String?
	let attributes: AttributesOffers?
}

struct AttributesOffers: Codable {
	let title: String?
	let description: String?
	let functions: String?
}


