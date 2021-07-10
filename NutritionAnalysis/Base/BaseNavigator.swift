//
//  BaseNavigator.swift
//  ORDERATT
//
//  Created by Mahmoud Khaled on 8/27/20.
//  Copyright © 2020 Mahmoud Khaled. All rights reserved.
//

import UIKit

public class BaseNavigator {
    
    private  var  navigationController: UINavigationController?  {
        return controller.navigationController
    }
    
    let controller: UIViewController
    
    
    init(_ controller: UIViewController) {
        self.controller = controller
    }
}
