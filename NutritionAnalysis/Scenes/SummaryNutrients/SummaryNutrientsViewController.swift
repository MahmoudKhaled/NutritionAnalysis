//  DialyNutrientsViewController.swift

import UIKit
import RxSwift

final class SummaryNutrientsViewController: NutrientsViewController {
    
    //MARK:- Outlets
    @IBOutlet private weak var totalButton: UIButton!
    @IBOutlet private weak var dialyButton: UIButton!
    
    //MARK:- ViewModel
    private var viewModel: SummaryNutrientsViewModelProtocol!
    func setViewModel(_ viewModel: SummaryNutrientsViewModelProtocol) {
        super.setViewModel(viewModel)
        self.viewModel = viewModel
    }
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonActions()
    }
}

//MARK:- Actions
extension SummaryNutrientsViewController {
    
    private func setupButtonActions() {
        subscribeToDialyButton()
        subscribeToTotalButton()
    }
    
    private func subscribeToTotalButton() {
        totalButton.rx.tap
            .withUnretained(self)
            .subscribe { owner, _ in
                owner.viewModel.totalNutrients()
            }.disposed(by: disposeBage)
    }
    
    private func subscribeToDialyButton() {
        dialyButton.rx.tap
            .withUnretained(self)
            .subscribe { owner, _ in
                owner.viewModel.dialyNutrients()
            }.disposed(by: disposeBage)
    }
}

