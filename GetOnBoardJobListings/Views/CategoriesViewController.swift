
import UIKit

class CategoriesViewController: UIViewController {
	
    let presenter = CategoryPresenter()
    var categories: Categories?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Categories"
		
		// Table
		view.addSubview(tableView)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.backgroundColor = .systemMint
		
		// Presenter
		presenter.setViewDelegate(delegate: self)
		presenter.getCategories()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		tableView.frame = view.bounds
		tableView.reloadData()
	}
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    } ()
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
		cell.backgroundColor = .systemOrange
		
        
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
            self.tableView.reloadData()
        }
    }
}
