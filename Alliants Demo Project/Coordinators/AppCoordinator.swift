//
//  AppCoordinator.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    // MARK: - Properties
    
    let window: UIWindow?

    lazy var rootViewController: UINavigationController = {
        let storyboard = UIStoryboard(name: "VendorsList", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VendorsListVC") as! VendorsListViewController
        
        return UINavigationController(rootViewController: controller)
    }()
    
    // MARK: - Coordinator
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
        guard let window = window else {
            return
        }

        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
