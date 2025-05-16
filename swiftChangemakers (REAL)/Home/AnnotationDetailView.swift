//
//  AnnotationDetailView.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI
import MapKit
import Contacts

struct AnnotationDetailView: View {
    var annotation: AnnotationItem
    
    var body: some View {
        VStack {
            Text(annotation.name)
                .font(.largeTitle)
            // Agrega más información detallada aquí
            Button("Cerrar") {
                // Código para cerrar la hoja
            }
        }
        .padding()
    }
    

    
}


