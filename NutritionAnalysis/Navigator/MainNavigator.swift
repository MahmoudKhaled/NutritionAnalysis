//
//  MainNavigator.swift
//  Nibbles
//
//  Created by Mahmoud Khaled on 4/6/21.
//  Copyright © 2021 Spark Cloud. All rights reserved.
//

import UIKit

enum MainDestination {
    case dialyNutrients(NutritionModel)
}

protocol MainNavigatorProtocol {
    func navigateTo(destination: MainDestination)
}

final class MainNavigator: BaseNavigator, MainNavigatorProtocol {
    
    func navigateTo(destination: MainDestination) {
        switch destination {
        case .dialyNutrients(let details):
            controller.push(MainFactory.dialyNutrients(nutritionDetails: details))
        }
    }
}
