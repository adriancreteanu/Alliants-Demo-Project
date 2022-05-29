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
    let apiClient = RESTApiClient()
    let rootNavigationController = UINavigationController()

    // MARK: - Coordinator
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    override func start() {
        guard let window = window else {
            return
        }

        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
        
        setRootCoordinator()
    }
    
    private func setRootCoordinator() {
        let rootCoordinator = VendorListCoordinator(
            rootNavigationController: rootNavigationController,
            client: apiClient
        )
        
        addChildCoordinator(rootCoordinator)
        rootCoordinator.start()
    }
}
