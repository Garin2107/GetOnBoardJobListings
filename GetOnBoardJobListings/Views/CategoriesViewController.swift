
import UIKit

class CategoriesViewController: UIViewController {
	
    let presenter = CategoryPresenter()
    var categories: Categories?
	let categoriesTable = UITableView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Categories"
		
		view.addSubview(categoriesTable)
		categoriesTable.delegate = self
		categoriesTable.dataSource = self
		categoriesTable.backgroundColor = .white
		categoriesTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
		presenter.setViewDelegate(delegate: self)
		presenter.getCategories()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		categoriesTable.frame = view.bounds
		categoriesTable.reloadData()
	}
    
}

extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let countOfCategories = categories?.data?.count else { return 0 }
		return countOfCategories
	}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var listContentConfiguration = UIListContentConfiguration.cell()
		listContentConfiguration.text = categories?.data?[indexPath.row].attributes.name
        cell.contentConfiguration = listContentConfiguration
		cell.backgroundColor = .white
		
        return cell
    }
}

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		guard let id = categories?.data?[indexPath.row].id else { return }
		let viewController = OffersViewController()
		viewController.type = id
		
		self.navigationController?.pushViewController(viewController, animated: true)
	}
}

extension CategoriesViewController: CategoryPresenterDelegate {
    func presentCategories(category: Categories) {
        self.categories = category
        DispatchQueue.main.async {
            self.categoriesTable.reloadData()
        }
    }
}
