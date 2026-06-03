//
//  ProductDetailView.swift
//  FakeStoreApiMVVM
//
//  Created by Acleda on 22/5/26.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Products
    @State private var showFullDescription: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 0) {
                AsyncImage(url: URL(string: product.image)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 280)
                .padding()
                .background(.white.opacity(0.1))
                .cornerRadius(10)
                
                VStack(alignment: .leading/*, spacing: 16*/) {
                    Text(product.categoryDisplay)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(5)
                        .foregroundColor(.blue)
                        .padding(.horizontal,5)
                        .padding(.vertical, 6)
                        .background(.blue.opacity(0.1))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity, alignment: .center) // Center horizontally
                    
                    Text(product.title)
                        .font(.title3)
                        .fontWeight(.bold)
                    HStack(alignment: .center) {
                        Text(product.price.asCurrency)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                        Spacer()
                        VStack (alignment: .leading, spacing: 4){
                            ProductStarRatingView(rating: product.rating)
                            Text("\(product.rating.count) reviews")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Describe")
                            .font(.headline)
                        Text(product.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .lineLimit(showFullDescription ? nil : 3)
                        Button(showFullDescription ? "less" : "See more..."){
                            withAnimation{ showFullDescription.toggle() }
                        }
                        .font(.caption.bold())
                        .foregroundColor(.blue)
                    }
                    
                    Divider()
                    
                    Button {
                        // TODO: Cart logic
                    } label: {
                        Label("Go To Cart", systemImage: "cart.badge.plus")
                            .font(.headline)
                            .frame(maxWidth: .infinity).padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(14)
                    }
                }
                .padding()
//                .padding(.top, 20)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
//        .ignoresSafeArea(edges: .all)

    }
}
//#Preview {
//    ProductDetailView( )
//}
