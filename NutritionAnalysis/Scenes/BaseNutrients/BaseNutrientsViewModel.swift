//  BaseNutrientsViewModel.swift

import Foundation
import RxRelay

protocol BaseNutrientsViewModelProtocol: BaseViewModelProtocol {
    var nutrientsItems: BehaviorRelay<[TotalNutritionModel]> { get set }
}

 class BaseNutrientsViewModel: BaseViewModel, BaseNutrientsViewModelProtocol {
    
    var nutrientsItems: BehaviorRelay<[TotalNutritionModel]> =  BehaviorRelay(value: [])
    
}
