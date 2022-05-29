//
//  Vendor.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import Foundation

struct Vendor: Decodable {
    let displayName: String
    let heroImage: VendorHeroImage
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case heroImage = "hero_image"
    }
}


struct VendorHeroImage: Decodable {
    let url: String
}
