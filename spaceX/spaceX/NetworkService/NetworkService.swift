//
//  NetworkService.swift
//  spaceX
//
//  Created by Максим Жуин on 30.07.2024.
//

import UIKit

enum NetworkErrors: Error {
    case unAuthorised
    case serverError
    case pageNotFound
    case unknownError

    var description: String {
        switch self {
        case .unAuthorised : return "Error Authorisation"
        case .serverError: return "Internal Server Error"
        case .pageNotFound: return "Not valid page adress"
        case .unknownError: return "Unknown Error. Unnable to fetch data"
        }
    }
}

protocol INetworkService {
    func fetchData(url: URL, completion: @escaping (Result<Data, NetworkErrors>) -> Void)
}


final class NetworkService: INetworkService {
    static let shared = NetworkService()

    private init() {}

    func fetchData(url: URL, completion: @escaping (Result<Data, NetworkErrors>) -> Void) {
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in

            if error != nil {
                completion(.failure(.unknownError))
            }

            if let httpResponse = response as? HTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    if let data = data {
                        completion(.success(data))
                    }
                case 401:
                    completion(.failure(.unAuthorised))
                case 404:
                    completion(.failure(.pageNotFound))
                case 502:
                    completion(.failure(.serverError))
                default: break
                }
            }

        }.resume()
    }
}
