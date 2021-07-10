//  ScreenTitles.swift

import Foundation

public enum ScreenTitles {
    case dialyNutrition
    case ingredient
    
    var title: String {
        switch self {
        case .dialyNutrition:
            return NSLocalizedString("Dialy Nutrition", comment: "")
        case .ingredient:
            return  NSLocalizedString("Ingredient", comment: "")
        }
    }
}
