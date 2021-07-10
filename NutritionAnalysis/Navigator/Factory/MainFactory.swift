
//  MainFactory.swift

import UIKit

class MainFactory {
    
    static func start() -> MainNavigationController {
        return MainNavigationController(rootViewController: ingredient())
    }
    
    static func ingredient () -> IngredientViewController {
        let vc = IngredientViewController.instanceVc()
        let vm = IngredientViewModel(repo: IngredientRepo(), navigator: MainNavigator(vc))
        vc.setViewModel(vm)
        vc.title = ScreenTitles.ingredient.title
        return vc
    }
    
    static func dialyNutrients(nutritionDetails: NutritionModel) -> DialyNutrientsViewController {
        let vc = DialyNutrientsViewController.instanceVc()
        let vm = DialyNutrientsViewModel(nutritionDetails: nutritionDetails)
        vc.setViewModel(vm)
        vc.title = ScreenTitles.dialyNutrition.title
        return vc
    }
}
