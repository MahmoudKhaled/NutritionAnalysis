
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
    
    static func summaryNutrients(nutritionDetails: NutritionModel) -> SummaryNutrientsViewController {
        let vc = SummaryNutrientsViewController.instanceVc()
        let vm = SummaryNutrientsViewModel(nutritionDetails: nutritionDetails, navigator: MainNavigator(vc))
        vc.setViewModel(vm)
        vc.title = ScreenTitles.summryNutrition.title
        return vc
    }
    
    static func nutrients (title: String, items: [TotalNutritionModel]) -> NutrientsViewController {
        let vc = NutrientsViewController.instanceVc()
        let vm = NutrientsViewModel(nutrientsItems: items)
        vc.title = title
        vc.setViewModel(vm)
        return vc
    }
}
