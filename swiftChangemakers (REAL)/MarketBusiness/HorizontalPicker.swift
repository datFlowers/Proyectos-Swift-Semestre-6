//
//  HorizontalPicker.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI

struct HorizontalPicker: View {
    @Binding var selectedCategory: MarketSection

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(MarketSection.allCases) { section in
                    Text(section.rawValue)
                        .font(.subheadline)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(selectedCategory == section ? Color.blue : Color.gray.opacity(0.2))
                        .foregroundColor(selectedCategory == section ? Color.white : Color.primary)
                        .clipShape(Capsule())
                        .onTapGesture {
                            withAnimation {
                                selectedCategory = section
                            }
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}
