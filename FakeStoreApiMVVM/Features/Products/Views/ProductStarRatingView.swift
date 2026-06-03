//
//  ProductStarRatingView.swift
//  FakeStoreApiMVVM
//
//  Created by Acleda on 22/5/26.
//

import SwiftUI

struct ProductStarRatingView: View {
    
    let rating : Rating
    
    var body: some View {
        VStack (alignment: .leading){
            HStack(spacing: 2) {
                Group {
                    ForEach(1...5, id: \.self) { star in
                        Image(systemName: starIcon(for: star))
                            .foregroundColor(.yellow)
                            .font(.caption2)
                    }
                    .padding(.top, 2)
                }
            }
            HStack (alignment: .bottom) {
                Text(rating.rate.asRating)
                    .font(.caption2)
//                    .padding(.top, 3)
//                    .padding(.horizontal, 1)
                Text("(\(rating.count))")
                    .font(.caption2)
                    .foregroundColor(.secondary)
//                    .padding(.top, -1)
            }
            .padding(.top, 0.5)
        }
    }
    // star គឺជា Int  →  1, 2, 3, 4, 5
    // rating.rate គឺជា Double → 3.9
    
    // បើប្រៀបធៀប Int vs Double → Error!
    //    if star <= rating.rate { } // ❌ មិនអាច
    
    // ត្រូវបំប្លែង Int → Double មុន
    //    if Double(star) <= rating.rate { } // ✅
    //   1.0, 2.0, 3.0, 4.0, 5.0
    
    private func starIcon(for star: Int) -> String {
        if Double(star) <= rating.rate {
            return "star.fill"
        } else if Double(star) - 0.5 <= rating.rate {
            return "star.leadinghalf.filled"
        } else {
            return "star"
        }
    }
    // Example : rating is 3.9 so if less than 3.9 is full star , if 3.5 <= 3.9 = half star, if 5 or 4.5 <= 3.9 : default star
}
extension Double {
    var asRating: String {
        String(format: "%.1f", self)
    }
}
//#Preview {
//    ProductStarRatingView()
//}
