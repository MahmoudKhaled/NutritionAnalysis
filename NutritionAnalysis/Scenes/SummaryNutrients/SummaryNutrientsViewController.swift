//  DialyNutrientsViewController.swift

import UIKit
import RxSwift

class SummaryNutrientsViewController: BaseViewController {
    
    //MARK:- Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK:- ViewModel
    private var viewModel: SummaryNutrientsViewModelProtocol!
    func setViewModel(_ viewModel: SummaryNutrientsViewModelProtocol) {
        self.viewModel = viewModel
    }

    //MARK:- Functionality
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
extension SummaryNutrientsViewController {
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 70
    }
    
    private func registerTableViewCell() {
        tableView.register(IngredientsTableViewCel.nib, forCellReuseIdentifier: IngredientsTableViewCel.identifier)
    }
}

//MARK:- Actions
extension SummaryNutrientsViewController {
    
    @IBAction func totalButtonTapped(_ sender: UIButton) {
        viewModel.totalNutrients()
    }
    
    @IBAction func TotalDialyButtonTapped(_ sender: UIButton) {
        viewModel.totalNutrients()
    }
}

