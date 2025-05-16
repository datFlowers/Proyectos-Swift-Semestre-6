//
//  TipCard.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI

// Estructura para las sugerencias que le damos al usuario
struct TipCard: View {
    let tip: String
    
    var body: some View {
        HStack {
            Image(systemName: "lightbulb")
                .foregroundColor(.yellow)
            Text(tip)
                .font(.body)
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

// Ejemplo dandole texto de "hola"
#Preview {
    TipCard(tip: "hola")
}
