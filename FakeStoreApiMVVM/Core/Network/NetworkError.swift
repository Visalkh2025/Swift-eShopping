//
//  ErrorStatus.swift
//  FakeStoreApiMVVM
//
//  Created by Acleda on 15/5/26.
//

import Foundation

enum NetworkError: Error , LocalizedError {
    case invalidUrl
    case serverError(Int)
    case decodingError
    case noInternet
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "Invalid URL"
        case .serverError(let c):
            return "Server Error: \(c)"
        case .decodingError:
            return "Decoding Error"
        case .noInternet:
            return "No Internet"
        }
    }
}
