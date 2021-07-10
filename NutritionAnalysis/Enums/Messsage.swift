//
//  Messsage.swift
//  NutritionAnalysis
//
//  Created by Mahmoud Khaled on 7/10/21.
//

import Foundation

enum  Messages {
    case appName
    case ok
    case calories
    
    var message: String {
        switch self {
        case .appName:
            return "Nutrition Analysis"
        case .ok:
            return NSLocalizedString("Ok", comment: "")
            
        case .calories:
            return NSLocalizedString("Calories", comment: "")
        }
    }
}
