//
//  VendorService.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import Foundation

protocol VendorService {
    func fetchVendors(completion: @escaping (Result<[Vendor], Error>) -> Void)
}
