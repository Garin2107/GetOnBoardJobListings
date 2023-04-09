
import UIKit

class OfferDetail: UIViewController {
	let presenter = OffersPresenter()
	let offers: OffersResponse? = nil
	var header = ""
	var body = ""
	
	var jobTitle = UILabel(frame: CGRect(x: 10, y: 150, width: 400, height: 50))
	var jobDescription = UITextView(frame: CGRect(x: 10, y: 200, width: 350, height: 500))
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Offer Detail"
		presenter.getOffers(type: header)
		let activity = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
		activity.center = view.center
		activity.style = .large
		
		jobTitle.text = header
		jobTitle.isHighlighted = true
		jobTitle.numberOfLines = 0
		
		body = body.replacingOccurrences(of: "<li>", with: "")
		body = body.replacingOccurrences(of: "</li>", with: "")
		body = body.replacingOccurrences(of: "</div>", with: "")
		body = body.replacingOccurrences(of: "<div>", with: "")
		body = body.replacingOccurrences(of: "</ul>", with: "")
		body = body.replacingOccurrences(of: "<ul>", with: "")
		body = body.replacingOccurrences(of: "</p>", with: "")
		body = body.replacingOccurrences(of: "<p>", with: "")
		body = body.replacingOccurrences(of: "</em>", with: "")
		body = body.replacingOccurrences(of: "<em>", with: "")
		body = body.replacingOccurrences(of: "</strong>", with: "")
		body = body.replacingOccurrences(of: "<strong>", with: "")
		body = body.replacingOccurrences(of: "<br>", with: "")
		body = body.replacingOccurrences(of: "</br>", with: "")
		body = body.replacingOccurrences(of: "</h3>", with: "")
		body = body.replacingOccurrences(of: "<h3>", with: "")
		body = body.replacingOccurrences(of: "</ol>", with: "")
		body = body.replacingOccurrences(of: "<ol>", with: "")
		
		jobDescription.text = body
		jobDescription.textAlignment = .left
		jobDescription.backgroundColor = .systemMint
		
		view.addSubview(jobTitle)
		view.addSubview(jobDescription)
		view.addSubview(activity)
		
		DispatchQueue.main.asyncAfter(deadline: .now()) {
			activity.startAnimating()
		}
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			activity.stopAnimating()
		}
		
	}
}
