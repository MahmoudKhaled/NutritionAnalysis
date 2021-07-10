//  DialyNutrientsViewController.swift

import UIKit

class DialyNutrientsViewController: BaseViewController {
    
    //MARK:- Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK:- ViewModel
    private var viewModel: DialyNutrientsViewModelProtocol!
    func setViewModel(_ viewModel: DialyNutrientsViewModelProtocol) {
        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.baseViewModel = viewModel
        super.viewDidLoad()
        subscribeToNutrientsItems()
    }
    
    private func subscribeToNutrientsItems() {
        viewModel.nutrientsItems
            .bind(to: tableView.rx.items(cellIdentifier: NutrientsTableViewCell.className, cellType: NutrientsTableViewCell.self)) { row, nutrition, cell in
                cell.nutrition = nutrition
            }.disposed(by: disposeBage)
    }
}
