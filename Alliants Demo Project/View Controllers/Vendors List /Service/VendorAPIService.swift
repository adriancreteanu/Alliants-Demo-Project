//
//  VendorAPIService.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import Foundation

final class VendorAPIService: VendorService {
    let apiClient: ApiClient
    
    // MARK: - Init
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchVendors(completion: @escaping (Result<[Vendor], Error>) -> Void) {
        let vendorsURL = URL(string: "https://nobu.cms.alliants.app/vendors")!
        
        apiClient.makeRequest(at: vendorsURL) { (result: Result<[Vendor], Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
