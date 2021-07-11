//  CustomNavigationController.swift
import UIKit

final class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarAttribute()
    }

    private func setupNavigationBarAttribute() {
        navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black
        ]

        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .black
        navigationBar.barTintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }

}
