//  DialyNutrientsViewModel.swift

import Foundation
import RxSwift
import RxRelay

protocol SummaryNutrientsViewModelProtocol: BaseNutrientsViewModelProtocol {
    func totalNutrients()
    func dialyNutrients()
}

class SummaryNutrientsViewModel: BaseNutrientsViewModel {
    
    //MARK:- variables
    private var nutritionDetails: NutritionModel
    private let navigator: MainNavigatorProtocol

    //MARK:- Initialization
    init(nutritionDetails: NutritionModel, navigator: MainNavigatorProtocol) {
        self.nutritionDetails = nutritionDetails
        self.navigator = navigator
        super.init()
        self.nutrientsItems.accept(nutritionDetails.summaryOFtotalNutrientsDaily)
    }
}

extension SummaryNutrientsViewModel: SummaryNutrientsViewModelProtocol {
    func totalNutrients() {
        
    }
        
    func dialyNutrients() {
        
    }
    
}
