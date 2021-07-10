//  DialyNutrientsViewModel.swift

import Foundation
import RxSwift
import RxRelay

protocol SummaryNutrientsViewModelProtocol: NutrientsViewModelProtocol {
    func totalNutrients()
    func dialyNutrients()
}

final class SummaryNutrientsViewModel: NutrientsViewModel {
    
    //MARK:- variables
    private var nutritionDetails: NutritionModel
    private let navigator: MainNavigatorProtocol

    //MARK:- Initialization
    init(nutritionDetails: NutritionModel, navigator: MainNavigatorProtocol) {
        self.nutritionDetails = nutritionDetails
        self.navigator = navigator
        super.init(nutrientsItems: nutritionDetails.totalNutrientsKCal)
    }
}

extension SummaryNutrientsViewModel: SummaryNutrientsViewModelProtocol {
    func totalNutrients() {
        navigator.navigateTo(destination: .nutrients(title: ScreenTitles.totalNutrition.title, items: nutritionDetails.totalNutrients))
    }
        
    func dialyNutrients() {
        navigator.navigateTo(destination: .nutrients(title: ScreenTitles.dialyNutrition.title, items: nutritionDetails.summaryOFtotalNutrientsDaily))
    }
    
}
