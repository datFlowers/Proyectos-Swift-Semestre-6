//
//  AddBusinessView.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI
import MapKit

struct AddBusinessView: View {
    @Binding var isPresented: Bool
    @State private var name = ""
    @State private var description = ""
    @State private var contact = ""
    @State private var section: MarketSection = .todos

    // Gestor de ubicación
    @StateObject private var locationManager = CustomLocationManager()
    @State private var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
    @State private var showLocationPicker: Bool = false

    // Imágenes: fondo y logo
    @State private var selectedBackgroundImage: UIImage?
    @State private var showBackgroundPicker: Bool = false

    @State private var selectedLogoImage: UIImage?
    @State private var showLogoPicker: Bool = false

    var onSave: (Business) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Detalles del Negocio").font(.headline)) {
                    TextField("Nombre", text: $name)
                    TextField("Descripción", text: $description)
                    TextField("Contacto", text: $contact)
                    Picker("Categoría", selection: $section) {
                        ForEach(MarketSection.allCases) { section in
                            Text(section.rawValue).tag(section)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section(header: Text("Ubicación").font(.headline)) {
                    HStack {
                        Text("Lat: \(coordinate.latitude, specifier: "%.4f"), Lon: \(coordinate.longitude, specifier: "%.4f")")
                        Spacer()
                        Button("Cambiar") { showLocationPicker = true }
                    }
                    .sheet(isPresented: $showLocationPicker) {
                        NavigationStack {
                            LocationPickerView(coordinate: $coordinate)
                        }
                    }
                }
                Section(header: Text("Imagen de Fondo").font(.headline)) {
                    if let uiImage = selectedBackgroundImage {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    } else {
                        Text("No se ha seleccionado imagen de fondo")
                    }
                    Button("Seleccionar Imagen de Fondo") {
                        showBackgroundPicker = true
                    }
                    .sheet(isPresented: $showBackgroundPicker) {
                        ImagePicker(selectedImage: $selectedBackgroundImage)
                    }
                }
                Section(header: Text("Logo de la Empresa").font(.headline)) {
                    if let uiImage = selectedLogoImage {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                    } else {
                        Text("No se ha seleccionado logo")
                    }
                    Button("Seleccionar Logo") {
                        showLogoPicker = true
                    }
                    .sheet(isPresented: $showLogoPicker) {
                        ImagePicker(selectedImage: $selectedLogoImage)
                    }
                }
                Section {
                    Button("Guardar") {
                        let newBusiness = Business(
                            name: name,
                            description: description,
                            contact: contact,
                            section: section,
                            coordinate: coordinate,
                            backgroundUIImage: selectedBackgroundImage,
                            logoUIImage: selectedLogoImage
                        )
                        onSave(newBusiness)
                        isPresented = false
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .listRowBackground(Color.clear)
                }
            }
            .navigationTitle("Agregar Negocio")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancelar") { isPresented = false }
                }
            }
            .onReceive(locationManager.$location) { location in
                if let location = location {
                    coordinate = location.coordinate
                }
            }
        }
    }
}
