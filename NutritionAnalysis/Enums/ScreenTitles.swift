//  ScreenTitles.swift

import Foundation

public enum ScreenTitles {
    case dialyNutrition
    case ingredient
    case totalNutrition
    case summryNutrition
    
    var title: String {
        switch self {
        case .dialyNutrition:
            return NSLocalizedString("Dialy Nutrition", comment: "")
        case .ingredient:
            return  NSLocalizedString("Ingredient", comment: "")
        case .totalNutrition:
            return  NSLocalizedString("Total Nutrition", comment: "")
        case .summryNutrition:
            return  NSLocalizedString("Summry Nutrition", comment: "")
        }
    }
}
