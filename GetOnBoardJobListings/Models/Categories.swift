
import Foundation

struct Categories: Codable {
	var data: [Datum]?
}

struct Datum: Codable {
	var id: String?
	var type: TypeEnum?
	var attributes: Attributes
}

struct Attributes: Codable {
	let name, dimension: String?
}

enum TypeEnum: String, Codable {
	case category = "category"
}



