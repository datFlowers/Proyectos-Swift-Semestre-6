//
//  BusinessHeaderView.swift
//  swiftChangemakers
//
//  Created by Alumno on 29/03/25.
//

import SwiftUI

// Vista separada para el header del negocio
struct BusinessHeaderView: View {
    var coverImage: Image
    var logoImage: Image
    var isSponsor: Bool = false

    var body: some View {
        ZStack {
            coverImage
                .resizable()
                .scaledToFit() // Asegura que la imagen se ajuste sin recortar
                .frame(maxWidth: .infinity)
                .clipped()
            
            VStack {
                Spacer()
                logoImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 4)
            }
            .padding(.bottom, -25)
        }
    }
}
