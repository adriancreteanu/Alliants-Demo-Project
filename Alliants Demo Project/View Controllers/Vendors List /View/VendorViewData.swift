//
//  VendorViewData.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import Foundation

struct VendorViewData {
    let name: String
    let description: String
    let imageURL: URL?
    let isOpen: Bool

    init(vendor: Vendor) {
        self.name = vendor.displayName
        self.description = vendor.description
        self.imageURL = URL(string: vendor.heroImage.url)
        self.isOpen = VendorViewData.isOpen(vendor: vendor)
    }
    
    static func isOpen(vendor: Vendor) -> Bool {
        // TODO: Steps to check if vendor is open or closed
        // 1. See if we have a value for opening hours. If not, return false.
        // 2. Look for the current day in the opening hours object.
        // 3. If current time is between `opensAt` and `closesAt`, return true. Else, return false.
        
        return true
    }
}
