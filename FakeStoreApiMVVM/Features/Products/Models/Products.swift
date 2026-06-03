//
//  Products.swift
//  FakeStoreApiMVVM
//
//  Created by Acleda on 15/5/26.
//

import Foundation

struct Products: Codable, Identifiable {
    
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

extension Products {
    var categoryEmoji: String {
        switch category {
        case "men's clothing": return "👕"
        case "women's clothing": return "👚"
        case "shoes": return "👟"
        case "accessories": return "👒"
        default: return "🛍️"
        }
    }
    var categoryDisplay : String {
        " \(categoryEmoji) \(category.capitalized)"
    }
}
