//  DialyNutrientsViewModel.swift

import Foundation
import RxSwift

protocol DialyNutrientsViewModelProtocol: BaseViewModelProtocol {
    var nutrientsItems: PublishSubject<[TotalNutritionModel]> { get set }
}

final class DialyNutrientsViewModel: BaseViewModel {
    
    var nutrientsItems: PublishSubject<[TotalNutritionModel]> = PublishSubject()

    init(items: NutritionModel) {
        super.init()
        self.nutrientsItems.onNext(items.totalNutrientsDaily)
    }
}

extension DialyNutrientsViewModel: DialyNutrientsViewModelProtocol {
    
}
