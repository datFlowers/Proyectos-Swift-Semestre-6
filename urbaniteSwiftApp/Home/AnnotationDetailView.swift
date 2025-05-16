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
            Button("Cerrar") {
            }
        }
        .padding()
    }
    

    
}


