//  MainNavigator.swift

import UIKit

enum MainDestination {
    case summaryNutrients(NutritionModel)
    case nutrients(title: String, items: [TotalNutritionModel])
}

protocol MainNavigatorProtocol {
    func navigateTo(destination: MainDestination)
}

class MainNavigator: BaseNavigator, MainNavigatorProtocol {
    
    func navigateTo(destination: MainDestination) {
        switch destination {
        case .summaryNutrients(let details):
            controller.push(MainFactory.summaryNutrients(nutritionDetails: details))
        case .nutrients(let title, let items):
            controller.push(MainFactory.nutrients(title: title, items: items))
        }
    }
}
