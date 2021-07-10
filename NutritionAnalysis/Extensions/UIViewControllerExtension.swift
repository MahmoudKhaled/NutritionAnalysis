//  UIViewControllerExtension.swift

import UIKit

// MARK:- InstanceViewController

public extension UIViewController
{
    private static var nameOfVC: String
    {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    fileprivate class func instate<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T
    {
        return (storyboard.instantiateViewController(withIdentifier: identifier) as? T)!
    }
    
    private class func instate(_ storyboard: StoryBoardTypes) -> Self
    {
        let stb = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return instate(stb, identifier: nameOfVC)
    }
    
    class func instanceVc(_ sb: StoryBoardTypes = .main) -> Self
    {
        return instate(sb)
    }
}

// MARK:- Show default alert for app
public extension UIViewController {
    func showAlert(with message: String) {
        AlertBuilder(title: Messages.appName.message, message: message, preferredStyle: .alert)
            .addAction(title: Messages.ok.message, style: .default)
            .build()
            .show()
    }
}

// MARK:- Navigation metthods
extension UIViewController {
    
    func push(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pop(_ viewController: UIViewController) {
        navigationController?.popToViewController(viewController, animated: true)
    }
    
}
