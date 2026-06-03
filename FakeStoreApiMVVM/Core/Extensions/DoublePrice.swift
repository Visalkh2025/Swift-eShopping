//
//  DoublePrice.swift
//  FakeStoreApiMVVM
//
//  Created by Acleda on 21/5/26.
//

import Foundation

extension Double {
    
    var asCurrency: String { // price
        String(format: "$%.2f", self)
    }
    
//    var asRate: String { // Rating
//        String(format: "%.1f", self)
//    }
}
