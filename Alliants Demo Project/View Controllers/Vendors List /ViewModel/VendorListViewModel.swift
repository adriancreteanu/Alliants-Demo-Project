//
//  VendorsViewModel.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import Foundation

final class VendorListViewModel {
    // MARK: - Properties
    
    private var service: VendorService
    private var vendors: [Vendor] = []
    
    var onStateChange: ViewStateChange?
    
    // MARK: - Init
    
    init(service: VendorService) {
        self.service = service
    }
    
    func onViewDidLoad() {
        fetchVendors()
    }
    
    // MARK: - Network
    
    private func fetchVendors() {
        onStateChange?(.loading)
        
        service.fetchVendors { [weak self] result in
            switch result {
            case let .success(vendors):
                self?.vendors = vendors
                self?.onStateChange?(.updated)
                
            case let .failure(error):
                self?.onStateChange?(.failure(error))
            }
        }
    }
}

extension VendorListViewModel: VendorListViewModelDelegate {
    var numberOfItems: Int {
        vendors.count
    }
    
    func item(atRow row: Int) -> VendorViewData {
        VendorViewData(vendor: vendors[row])
    }
    
    func didSelectItem(atRow row: Int) {}
}
