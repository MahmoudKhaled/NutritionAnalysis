//  BaseNavigator.swift

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
