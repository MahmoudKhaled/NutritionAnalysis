//  IngredientViewController.swift

import UIKit
import RxSwift
import RxCocoa

class IngredientViewController: BaseViewController {
    
    //MARK:- Outlets
    @IBOutlet private weak var ingredientTextView: UITextView!
    @IBOutlet private weak var analyzeButton: UIButton!
    
    //MARK:- ViewModel
    private var viewModel: IngredientViewModelProtocol!
    func setViewModel(_ viewModel: IngredientViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    //MARK:- Functionality
    override func viewDidLoad() {
        super.baseViewModel = viewModel
        super.viewDidLoad()
        bindTextViewsToViewModel()
        subscribeAnalyzeButtonEnables()
    }
    
    private func bindTextViewsToViewModel() {
        ingredientTextView.rx.text.orEmpty
            .bind(to: viewModel.analyzeText)
            .disposed(by: disposeBage)
    }
    
    private func subscribeAnalyzeButtonEnables() {
        viewModel.subscribeIsAnalyzeEnable
            .bind(to: analyzeButton.rx.isEnabled)
            .disposed(by: disposeBage)
    }
}

//MARK:- Actions
extension IngredientViewController {
    @IBAction func analyzeButtonTapped(_ sender: UIButton) {
        viewModel.analyze()
    }
}
