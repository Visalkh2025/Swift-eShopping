//
//  FakeStoreApiMVVMApp.swift
//  FakeStoreApiMVVM
//
//  Created by Acleda on 15/5/26.
//

import SwiftUI

@main
struct FakeStoreApiMVVMApp: App {
    var body: some Scene {
        WindowGroup {
            ProductListView(viewModel: ProductsViewModels())
        }
    }
}
