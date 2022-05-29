//
//  VendorViewData.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import Foundation

struct VendorViewData {
    let name: String

    init(vendor: Vendor) {
        self.name = vendor.displayName
    }
}
