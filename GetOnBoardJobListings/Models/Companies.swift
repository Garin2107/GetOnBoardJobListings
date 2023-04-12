
import Foundation

struct Companies: Codable {
	var data: [CompanyDatum]?
}

struct CompanyDatum: Codable {
	var id: String?
	var	type: String?
	var attributes: CompanyAttributes?
}

struct CompanyAttributes: Codable {
	var name: String?
	var	description: String?
	var logo: String?
	var country: String?
	
	enum CodingKeys: String, CodingKey {
			case name, description
			case logo
		}
}



