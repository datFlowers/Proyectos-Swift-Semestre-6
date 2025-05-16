//
//  ContentView.swift
//  MapKit2
//
//  Created by Alumno on 22/04/25.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    
    static var tecmi = CLLocationCoordinate2D(latitude:25.6281, longitude:-100.30396)
    
    static var tecmi2 = CLLocationCoordinate2D(latitude:25.6281, longitude:-100.30)
    
}

struct ContentView: View {
    var body: some View {
        Map(){
            Marker("Lab", systemImage:("map.fill"), coordinate: .tecmi).tint(Color.red)
            
            Marker("Lab", systemImage:("swift"), coordinate: .tecmi2).tint(Color.blue)
        }
    }
}

#Preview {
    ContentView()
}
