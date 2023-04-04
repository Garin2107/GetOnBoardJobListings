
import Foundation

struct OffersResponse: Decodable {
	let data: [Offers]?
}

struct Offers: Decodable {
	let id: String?
	let attributes: AttributesOffers?
}

struct AttributesOffers: Decodable {
	let title: String?
	let description: String?
	let functions: String?
}


