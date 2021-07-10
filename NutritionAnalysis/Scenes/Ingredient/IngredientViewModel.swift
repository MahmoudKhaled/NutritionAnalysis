//  IngredientViewModel.swift

import Foundation
import RxSwift
import RxRelay

protocol IngredientViewModelProtocol: BaseViewModelProtocol {
    var analyzeText: BehaviorRelay<String> { get set }
    var subscribeIsAnalyzeEnable: Observable<Bool> { get }
    func analyze()
}

final class IngredientViewModel: BaseViewModel {
    
    var analyzeText: BehaviorRelay<String> = BehaviorRelay(value: "")
    private var parameters =  IngredientParameters()
    private let disposBag = DisposeBag()
    
    private var repo: IngredientRepoProtocol
    init(repo: IngredientRepoProtocol) {
        self.repo = repo
        super.init()
        self.repo.delegate = self
        setupAnalyizeTextSubscribe()
    }
}

extension IngredientViewModel: IngredientViewModelProtocol {
    
    var subscribeIsAnalyzeEnable: Observable<Bool> {
        return analyzeText.asObservable().map{ return $0.count > 20 }
    }
    
    private func setupAnalyizeTextSubscribe() {
        analyzeText.withUnretained(self).subscribe { owner, text in
            owner.parameters.ingr = text
            print("Ttttttttttt", text)
        }.disposed(by: disposBag)

    }
    
    func analyze() {
        indicatorState.onNext(.loading(userInterAction: true, hideView: false))
        repo.getAnalysisData(parameter: parameters)
    }
}

extension IngredientViewModel: IngredientRepoDelegate {
    func didGetData() {
        indicatorState.onNext(.loaded)
    }
}


fileprivate struct IngredientParameters: BodyParameters {
    
    var appID: String = Constants.appId
    var appKey: String = Constants.appKey
    var nutritionType: String = Constants.nutritionType
    var ingr: String = ""
    
    var body: [String : Any] {
        return ["app_id": appID,
                "app_key": appKey,
                "nutrition-type": nutritionType,
                "ingr": ingr]
    }
    
}
