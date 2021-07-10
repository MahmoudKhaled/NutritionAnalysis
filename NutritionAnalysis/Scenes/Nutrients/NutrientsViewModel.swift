//  NutrientsViewModel.swift

import Foundation
import RxRelay

public protocol NutrientsViewModelProtocol: BaseViewModelProtocol {
    var nutrientsItems: BehaviorRelay<[TotalNutritionModel]> { get set }
}

public class NutrientsViewModel: BaseViewModel {
    
    //MARK:- variables
    public var nutrientsItems: BehaviorRelay<[TotalNutritionModel]> = BehaviorRelay(value: [])
    
    //MARK:- Initialization
    init(nutrientsItems: [TotalNutritionModel]) {
        super.init()
        self.nutrientsItems.accept(nutrientsItems)
    }
}

extension NutrientsViewModel: NutrientsViewModelProtocol { }
