//
//  ProductsViewModels.swift
//  FakeStoreApiMVVM
//
//  Created by Acleda on 15/5/26.
//

import Foundation
import Combine

@MainActor // Make sure that I really processes on Main Thread

class ProductsViewModels: ObservableObject { // ObservableObject : A protocol that allow swiftui automatically know when the data was exchanged
    
    @Published var products: [Products] = []
    @Published var isLoading = false
    @Published var errormessage: String?
    @Published var searchText = ""
    @Published var selectedCategory = "All" // selection Choice
    
//    computed Properties
    var categories : [String] {
        let cats = products.map {$0.category} // យក category ចេញពី Product នីមួយៗ
        return ["All"] + Array(Set(cats)).sorted()
    } // How to sorting data of category from Products
    
    var filteredProducts: [Products] {
        products.filter { product in
            let matchCategory = selectedCategory == "All" || product.category == selectedCategory
            let matchSearch = searchText.isEmpty || product.title.localizedCaseInsensitiveContains(searchText) // localizedCaseInsensitiveContains don't care it's a uppercase or lowercase anyway.
            return matchCategory && matchSearch // I have to complete with these two conditions
            // ប្រគល់ true/false → true = យក Product នេះ, false = មិនយក
        }
    }
    
    var averagePrice: Double {
        guard !filteredProducts.isEmpty else { return 0 } // if have no products , let it return zero
        return filteredProducts.map(\.price).reduce(0, +) / Double(filteredProducts.count)
        //return លទ្ធផល Average ប្រគល់ទៅ View
    } // .map on each prices on each products, .reduce is to total the final price, devide with amount of products to get an average
    
    // MARK: Actions
    func loadProducts() async {
        isLoading = true
        errormessage = nil
        do {
            products = try await NetworkManager.shared.fetch(AppConstants.Endpoint.products)
        } catch {
            errormessage = error.localizedDescription
        }
        isLoading = false
    }
    
    func clearSearch() {
        searchText = ""
        selectedCategory = "All"
    }
}
