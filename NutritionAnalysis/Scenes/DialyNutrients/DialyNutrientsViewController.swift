//  DialyNutrientsViewController.swift

import UIKit
import RxSwift

final class DialyNutrientsViewController: BaseViewController {
    
    //MARK:- Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK:- ViewModel
    private var viewModel: DialyNutrientsViewModelProtocol!
    func setViewModel(_ viewModel: DialyNutrientsViewModelProtocol) {
        self.viewModel = viewModel
    }

    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.baseViewModel = viewModel
        super.viewDidLoad()
        subscribeToNutrientsItems()
        setupTableView()
        registerTableViewCell()
    }
    
    //MARK:- Functionality
    private func subscribeToNutrientsItems() {
        viewModel.nutrientsItems
            .bind(to: tableView.rx.items(cellIdentifier: IngredientsTableViewCel.identifier, cellType: IngredientsTableViewCel.self)) { row, nutrition, cell in
                cell.nutrition = nutrition
            }.disposed(by: disposeBage)
    }

}

//MARK:- setupTableView 
extension DialyNutrientsViewController {
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 70
    }
    
    private func registerTableViewCell() {
        tableView.register(IngredientsTableViewCel.nib, forCellReuseIdentifier: IngredientsTableViewCel.identifier)
    }
}
