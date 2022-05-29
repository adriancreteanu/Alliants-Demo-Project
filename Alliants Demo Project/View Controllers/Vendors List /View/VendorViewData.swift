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

    init(vendor: Vendor) {
        self.name = vendor.displayName
        self.description = vendor.description
        self.imageURL = URL(string: vendor.heroImage.url)
    }
}
