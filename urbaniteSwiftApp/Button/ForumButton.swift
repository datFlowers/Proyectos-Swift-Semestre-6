//
//  ForumButton.swift
//  swiftChangemakers
//
//  Created by Alumno on 27/03/25.
//

import SwiftUI

struct ForumButton: View {
    
    @State var title: String
    
    
    var body: some View {
        Button(action: {
            // Acción a ejecutar cuando se pulse el botón
        }) {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 350, height: 150)
                .overlay(
                    Text("Crear un nuevo foro")
                        .foregroundColor(.black)
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}
