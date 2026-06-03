//
//  CategoryChip.swift
//  FakeStoreApiMVVM
//
//  Created by Acleda on 22/5/26.
//

import Foundation
import SwiftUI

struct CategoryChip : View {
    
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? Color.blue : Color(.systemGray5))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(20)
        })
    }
}
