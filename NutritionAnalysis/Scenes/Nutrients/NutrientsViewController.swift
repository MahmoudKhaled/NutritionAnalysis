//  NutrientsViewController.swift


import UIKit
import RxSwift
import RxCocoa

final class NutrientsViewController: SummaryNutrientsViewController {
    
    private var viewModel: NutrientsViewModelProtocol!
    func setViewModel(_ viewModel: NutrientsViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
