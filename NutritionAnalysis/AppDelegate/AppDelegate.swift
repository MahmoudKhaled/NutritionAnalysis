
//  AppDelegate.swift

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK:- Variables
    var window: UIWindow?
    
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    //MARK:- DidFinishLuanging
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        setupKeyboard()
        return true
    }
    
    //MARK:- setup window
    func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
    
    //MARK:- setup Keyboard
    private func setupKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
    
    //MARK:- seetRoot
    func setRootViewController(_ viewController: UIViewController, animated: Bool) {
        
        if animated {
            let transition = UIView.AnimationOptions.transitionCrossDissolve
            window?.rootViewController = viewController
            UIView.transition(with: window!, duration: 0.5, options: transition, animations: {})
        } else {
            window?.rootViewController = viewController
        }
    }
}

