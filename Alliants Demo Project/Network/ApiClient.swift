//
//  ApiClient.swift
//  Alliants Demo Project
//
//  Created by Adrian Creteanu on 29.05.2022.
//

import Foundation

protocol ApiClient {
    func makeRequest<T: Decodable>(at url: URL, completion: @escaping (Result<T, Error>) -> Void)
}

final class RESTApiClient: ApiClient {
    
    init() {}
    
    enum NetworkError: Swift.Error {
        case noData
        case decodeError
    }
    
    func makeRequest<T: Decodable>(at url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            } else {
                guard let data = data else {
                    completion(.failure(NetworkError.noData))
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(NetworkError.decodeError))
                }
            }
            
        }.resume()
    }
}
