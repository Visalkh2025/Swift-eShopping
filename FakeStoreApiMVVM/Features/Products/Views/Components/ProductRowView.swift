//
//  ProductRowView.swift
//  FakeStoreApiMVVM
//
//  Created by Acleda on 22/5/26.
//

import SwiftUI

struct ProductRowView : View {
    let product : Products
    
    var body: some View {
        HStack(spacing: 12) {
            
            AsyncImage(url: URL(string: product.image)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 95, height: 120)
            .padding(6)
            .background(.white.opacity(0.1))
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.08), radius: 4,/* x: 0, y: 4*/)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(product.title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .lineLimit(2)
                Text(product.categoryDisplay)
                    .font(.caption2)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .padding(.horizontal,5)
                    .padding(.vertical, 6)
                    .background(.blue.opacity(0.1))
                    .cornerRadius(4)
                
                HStack {
                     
                        ProductStarRatingView(rating: product.rating)
                        Spacer()
                        Text(product.price.asCurrency)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .padding(.bottom,15)
                }
            }
        }
        .padding(.vertical, 4)
    }
}

