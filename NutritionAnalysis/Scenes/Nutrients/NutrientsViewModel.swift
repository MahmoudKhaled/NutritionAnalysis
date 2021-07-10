//  NutrientsViewModel.swift

import Foundation
import RxRelay

protocol NutrientsViewModelProtocol: BaseNutrientsViewModelProtocol {
    
}

class NutrientsViewModel: BaseViewModel {
    
    //MARK:- variables
    var nutrientsItems: BehaviorRelay<[TotalNutritionModel]> = BehaviorRelay(value: [])
    
    //MARK:- Initialization
    init(nutrientsItems: [TotalNutritionModel]) {
        super.init()
        self.nutrientsItems.accept(nutrientsItems)
    }
}

extension NutrientsViewModel: NutrientsViewModelProtocol { }
