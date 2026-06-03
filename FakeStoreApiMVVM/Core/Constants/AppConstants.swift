//
//  AppConstants.swift
//  FakeStoreApiMVVM
//
//  Created by Acleda on 15/5/26.
//

import Foundation

enum AppConstants {
    static let baseUrl: String = "https://fakestoreapi.com"
    
    enum Endpoint {
        static let products: String = "/products"
        static let categories: String = "/products/categories"
    }
}
