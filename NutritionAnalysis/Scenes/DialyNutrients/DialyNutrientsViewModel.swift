//  DialyNutrientsViewModel.swift

import Foundation
import RxSwift
import RxRelay

protocol DialyNutrientsViewModelProtocol: BaseViewModelProtocol {
    var nutrientsItems: BehaviorRelay<[TotalNutritionModel]> { get set }
}

final class DialyNutrientsViewModel: BaseViewModel {
    
    var nutrientsItems: BehaviorRelay<[TotalNutritionModel]> = BehaviorRelay(value: [])
    private var nutritionDetails: NutritionModel

    init(nutritionDetails: NutritionModel) {
        self.nutritionDetails = nutritionDetails
        super.init()
        self.nutrientsItems.accept(nutritionDetails.summaryOFtotalNutrientsDaily)
    }
}

extension DialyNutrientsViewModel: DialyNutrientsViewModelProtocol {
    
}
