//
//  HomeButton.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI

struct HomeButton: View {
    var title: String
    var defaultColor: Color = .white
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        
        
        Button(action: {
            action()  // Ejecutar la acción cuando el botón se presiona
        }) {
            
            GeometryReader { geometry in
                Text(title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 24)
                            .hueRotation(Angle(degrees: Double(geometry.frame(in: .global).minY) / 10))
                    )
            }
            .frame(height: 50)  // Fijar la altura del GeometryReader
            
        }
        .padding(.horizontal)
    }
}

/*
#Preview {
    HomeButton(title: "Hola", defaultColor: Color.blue, isSelected: true, action: )
}
*/
