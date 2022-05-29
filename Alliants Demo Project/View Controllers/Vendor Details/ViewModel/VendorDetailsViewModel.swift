//
//  VendorDetailsViewModel.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import Foundation

final class VendorDetailsViewModel: VendorDetailsViewModelDelegate {
    private let vendor: Vendor
    
    var viewData: VendorViewData {
        VendorViewData(vendor: vendor)
    }
    
    init(vendor: Vendor) {
        self.vendor = vendor
    }
}
