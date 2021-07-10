//  ScreenTitles.swift

import Foundation

public enum ScreenTitles {
    case dialyNutrition
    
    var title: String {
        switch self {
        case .dialyNutrition:
            return NSLocalizedString("Dialy Nutrition", comment: "")
        }
    }
}
