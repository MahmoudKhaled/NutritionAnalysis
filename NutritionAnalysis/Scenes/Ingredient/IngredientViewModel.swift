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
    private var repo: IngredientRepoProtocol
    private let navigator: MainNavigatorProtocol
    
    //MARK:- Initialization
    init(repo: IngredientRepoProtocol, navigator: MainNavigatorProtocol) {
        self.repo = repo
        self.navigator = navigator
        super.init()
        self.repo.delegate = self
    }
}

//MARK:- implementation of IngredientViewModelProtocol
extension IngredientViewModel: IngredientViewModelProtocol {
    
    /**
     when analyzeText is being greater than 10 charahcter
        make analyaze button isEnabled els make it disabpled
     */
    var subscribeIsAnalyzeEnable: Observable<Bool> {
        return analyzeText.asObservable()
            .map{ return $0.count > 10 }
    }
    
    func analyze() {
        indicatorState.onNext(.loading(userInterAction: true, hideView: false))
        parameters.ingr = analyzeText.value
        repo.getAnalysisData(parameter: parameters)
    }
}

//MARK:- implementation of IngredientRepoDelegate
extension IngredientViewModel: IngredientRepoDelegate {
    
    func didGetData(response: NutritionModel) {
        indicatorState.onNext(.loaded)
        navigator.navigateTo(destination: .summaryNutrients(response))
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
