import Foundation
import UIKit

protocol CategoryPresenterDelegate: AnyObject {
    func presentCategories(category: Categories)
}

typealias PresenterDelegate = CategoryPresenterDelegate & UIViewController

class CategoryPresenter {
    
    var delegate: PresenterDelegate?
    
	public func getCategories() {

        guard let url = URL(string: "https://www.getonbrd.com/api/v0/categories") else { return }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in

            guard let data = data, error == nil else {
                return
            }
            do {
                let categories = try JSONDecoder().decode(Categories.self, from: data)

                self?.delegate?.presentCategories(category: categories)
                
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }

    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
}
