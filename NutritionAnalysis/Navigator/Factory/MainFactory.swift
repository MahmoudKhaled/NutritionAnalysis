
//  MainFactory.swift

import UIKit

class MainFactory {
    static func dialyNutrients(nutritionDetails: NutritionModel) -> DialyNutrientsViewController {
        let vc = DialyNutrientsViewController.instanceVc()
        let vm = DialyNutrientsViewModel(nutritionDetails: nutritionDetails)
        vc.setViewModel(vm)
        vc.title = ScreenTitles.dialyNutrition.title
        return vc
    }
}
