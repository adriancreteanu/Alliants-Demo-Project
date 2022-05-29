//
//  Vendor.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import Foundation

struct Vendor: Decodable {
    let displayName: String
    let heroImage: HeroImage
    let description: String
    let openingHours: OpeningHours?
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case heroImage = "hero_image"
        case openingHours = "opening_hours"
        case description
    }
}

// MARK: - HeroImage
struct HeroImage: Decodable {
    let url: String
}


// MARK: - OpeningHours
struct OpeningHours: Codable {
    let id: Int
    let monday, tuesday, wednesday, thursday: [Day]
    let friday, saturday, sunday: [Day]
}

// MARK: - Day
struct Day: Codable {
    let id: Int
    let opensAt, closesAt: String?
    let closesLate: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case opensAt = "opens_at"
        case closesAt = "closes_at"
        case closesLate = "closes_late"
    }
}
