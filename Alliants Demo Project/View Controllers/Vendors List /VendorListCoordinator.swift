//
//  VendorListCoordinator.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import UIKit

class VendorListCoordinator: Coordinator {
    // MARK: - Properties
    
    let rootNavigationController: UINavigationController
    
    let storyboard = UIStoryboard(name: "VendorsList", bundle: nil)
    
    let apiClient: ApiClient
    
    // MARK: - Coordinator
    
    init(rootNavigationController: UINavigationController, client: ApiClient) {
        self.rootNavigationController = rootNavigationController
        self.apiClient = client
    }
    
    override func start() {
        guard let controller = storyboard.instantiateViewController(withIdentifier: "VendorsListVC") as? VendorsListViewController else {
            fatalError("View Controller with ID = `VendorsListVC` does not exist.")
        }
        
        let vendorService = VendorAPIService(apiClient: apiClient)
        let viewModel = VendorListViewModel(service: vendorService)
        viewModel.coordinatorDelegate = self
        
        controller.viewModel = viewModel
        
        rootNavigationController.setViewControllers([controller], animated: true)
    }
}

// MARK: - View Model Delegate

extension VendorListCoordinator: VendorListViewModelCoordinatorDelegate {
    func didSelect(vendor: Vendor) {
        let storyboard = UIStoryboard(name: "VendorDetails", bundle: nil)
        
        guard let controller = storyboard.instantiateViewController(withIdentifier: "VendorDetailsVC") as? VendorDetailsViewController else {
            fatalError("View Controller with ID = `VendorDetailsVC` does not exist.")
        }
                
        controller.viewModel = VendorDetailsViewModel(vendor: vendor)
        
        rootNavigationController.pushViewController(controller, animated: true)
    }
}
