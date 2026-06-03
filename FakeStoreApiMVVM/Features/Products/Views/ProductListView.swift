//
//  ProductListView.swift
//  FakeStoreApiMVVM
//
//  Created by Acleda on 22/5/26.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var viewModel: ProductsViewModels
    @FocusState private var isSearchFocused: Bool
    
    var body: some View {
        NavigationStack {
            Group {
                //                if viewModel.isLoading {
                //                    loadingView
                //                } else {
                productContext
                //}
                
            }
            
            //            .navigationTitle("🛍️ Fakestore")
            .task { await viewModel.loadProducts() }
        }
    }
    
    // MARK: - Subviews
    private var loadingView: some View {
        VStack {
            ProgressView().scaleEffect(1.5)
            Text("Loading...")
                .font(.title)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func errorView(_ msg: String ) -> some View {
        VStack (spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 60))
                .foregroundColor(.orange)
            Text(msg).multilineTextAlignment(.center)
            Button("Try again") {
                Task {
                    await viewModel.loadProducts()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    private var productContext: some View {
        
        VStack (spacing: 0){
            customHeader
            searchBar
            categoryfilter
            statsBar
            productList
            
        }
    }
    
    private var customHeader: some View {
        HStack {
            //            Image(systemName: "bag.fill")
            //                .foregroundColor(.blue)
            //                .font(.largeTitle)
            Text(" 🛍️ VisalStore")
                .font(.title).bold()
                .foregroundStyle(
                    LinearGradient(
                        colors: [.red, .orange, .yellow],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Spacer()
        }
        .padding([.horizontal, .top])
        .padding(.bottom ,10)
    }
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            TextField("Search", text: $viewModel.searchText)
                .focused($isSearchFocused)
            if !viewModel.searchText.isEmpty {
                Button { viewModel.clearSearch()
                    isSearchFocused = false
                } label: {
                    Label("Clear", systemImage: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
    
    private var categoryfilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing:8) {
                ForEach(viewModel.categories, id: \.self) { category in
                    CategoryChip(title: category == "All" ? "All" : category.capitalized,
                                 isSelected: viewModel.selectedCategory == category,
                                 action: {
                        viewModel.selectedCategory = category
                    })
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .padding(.bottom, 10)
    }
    
    private var statsBar : some View {
        HStack {
            Text("\(viewModel.filteredProducts.count) products")
            Spacer()
            Text("Avg: \(viewModel.averagePrice.asCurrency)")
        }
        .font(.headline)
        .foregroundColor(.secondary)
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
    
    private var productList: some View {
        Group {
            if viewModel.isLoading {
                loadingView
                
            } else  if
                viewModel.filteredProducts.isEmpty {
                VStack (spacing: 12) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 40))
                        .foregroundColor(.secondary)
                    Text("Not Found Product")
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onTapGesture {
                    isSearchFocused = false
                }
            }
            else {
                List (viewModel.filteredProducts) { product in
                    NavigationLink(destination: ProductDetailView(product: product), label: {
                        ProductRowView(product: product)
                    })
                }
                .refreshable { await viewModel.loadProducts() }
                .scrollDismissesKeyboard(.immediately)
            }
            
        }
    }
    
}

#Preview {
    ProductListView(viewModel: ProductsViewModels())
        .preferredColorScheme(ColorScheme.dark)
}
