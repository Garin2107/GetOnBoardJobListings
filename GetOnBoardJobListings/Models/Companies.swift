
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
	var longDescription: String?
	var projects: String?
	var benefits: String?
	var web: String?
	var twitter, github, facebook, angellist: String?
	var logo: String?
	var country: String?
	
	enum CodingKeys: String, CodingKey {
			case name, description
			case longDescription = "long_description"
			case projects, benefits, web, twitter, github, facebook, angellist, logo, country
		}
}



