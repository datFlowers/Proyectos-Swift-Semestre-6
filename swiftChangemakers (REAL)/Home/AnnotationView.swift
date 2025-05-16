//
//  AnnotationView.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI

struct AnnotationView: View {
    let item: AnnotationItem

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: "mappin.circle.fill")
                .foregroundColor(.red)
                .font(.title)
                .shadow(radius: 3)
            Text(item.name)
                .font(.caption)
                .foregroundColor(.black)
                .padding(4)
                .background(Color.white.opacity(0.8))
                .cornerRadius(8)
        }
    }
}
