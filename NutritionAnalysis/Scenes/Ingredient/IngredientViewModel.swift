//  IngredientViewModel.swift

import Foundation
import RxSwift
import RxRelay

//MARK:- IngredientViewModelProtocol
protocol IngredientViewModelProtocol: BaseViewModelProtocol {
    var analyzeText: BehaviorRelay<String> { get set }
    var subscribeIsAnalyzeEnable: Observable<Bool> { get }
    func analyze()
}


//MARK:- IngredientViewModel
final class IngredientViewModel: BaseViewModel {
    
    //MARK:- variables
    var analyzeText: BehaviorRelay<String> = BehaviorRelay(value: "")
    private var parameters =  IngredientParameters()
    private let disposBag = DisposeBag()
    
    //MARK:- Initialization
    private var repo: IngredientRepoProtocol
    init(repo: IngredientRepoProtocol) {
        self.repo = repo
        super.init()
        self.repo.delegate = self
        setupAnalyizeTextSubscribe()
    }
}

//MARK:- implementation of IngredientViewModelProtocol
extension IngredientViewModel: IngredientViewModelProtocol {
    
    /**
     when analyzeText is being greater than 20 charahcter
        make analyaze button isEnabled els make it disabpled
     */
    var subscribeIsAnalyzeEnable: Observable<Bool> {
        return analyzeText.asObservable()
            .map{ return $0.count > 20 }
    }
    
    // update ingr parameter value when analyzeText updated
    private func setupAnalyizeTextSubscribe() {
        analyzeText.withUnretained(self)
            .subscribe { owner, text in
            owner.parameters.ingr = text
        }.disposed(by: disposBag)
    }
    
    
    func analyze() {
        indicatorState.onNext(.loading(userInterAction: true, hideView: false))
        repo.getAnalysisData(parameter: parameters)
    }
}

//MARK:- implementation of IngredientRepoDelegate
extension IngredientViewModel: IngredientRepoDelegate {
    
    func didGetData(response: NutritionModel) {
        indicatorState.onNext(.loaded)
        //TODO:- navigate to details of food
    }
}


//MARK:- parameters
// which send with service data
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
