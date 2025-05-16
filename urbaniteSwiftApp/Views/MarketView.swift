//
//  MarketView2.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI
import CoreLocation

struct MarketView: View {
    @AppStorage("userEmail") private var userEmail: String = ""
    @AppStorage("preferredColor") private var preferredColor: String = ""
    
    @State private var selectedSection: MarketSection = .todos
    @State private var showAddBusiness: Bool = false
    @State private var marketThreads: [BusinessCardView] = sampleMarketThreads
    
    var filteredThreads: [BusinessCardView] {
        let threads = selectedSection == .todos ? marketThreads : marketThreads.filter { $0.section == selectedSection }
        // Ordena: primero los sponsors (true) y luego los demás
        return threads.sorted { $0.isSponsor && !$1.isSponsor }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HorizontalPicker(selectedCategory: $selectedSection)
                        .padding(.top, 10)
                    
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            // Para mostrarlo por filtro por si hay uno
                            ForEach(filteredThreads, id: \.id) { thread in
                                // Diseno de cada tarjeta o seccion de Market
                                let cardView = thread
                                    .frame(height: 200)
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white)
                                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                                    )
                                    .padding(.horizontal)
                                
                                let destinationView = BusinessDetailView(
                                    business: Business(
                                        name: thread.name,
                                        description: thread.description,
                                        contact: thread.contact,
                                        section: thread.section,
                                        coordinate: thread.coordinate
                                    ),
                                    coverImage: thread.backgroundImage,
                                    logoImage: thread.logoImage
                                )
                                
                                NavigationLink(destination: destinationView) {
                                    cardView
                                }
                            }
                        }
                        .padding(.top, 10)
                    }

                }
            }
            // Titulo de navegacion para que aparezca arriba
            .navigationTitle("Market")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    // Boton para poder agregar un nuevo Market
                    Button {
                        withAnimation {
                            showAddBusiness = true
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(Color(preferredColor))
                    }
                }
            }
            // Un sheet para que el usuario pueda agregar su propio Market
            .sheet(isPresented: $showAddBusiness) {
                AddBusinessView(isPresented: $showAddBusiness) { newBusiness in
                    
                    // Recibe imagen de fondo, imagen logo, con nombre, descripcion, contacto, seccion, ubicacion
                    let backgroundImage: Image
                    if let bg = newBusiness.backgroundUIImage {
                        backgroundImage = Image(uiImage: bg)
                    } else {
                        backgroundImage = Image("DefaultBackground")
                    }
                    let logoImage: Image
                    if let logo = newBusiness.logoUIImage {
                        logoImage = Image(uiImage: logo)
                    } else {
                        logoImage = Image("DefaultLogo")
                    }
                    let newBusinessCard = BusinessCardView(
                        id: marketThreads.count + 1,
                        backgroundImage: backgroundImage,
                        logoImage: logoImage,
                        name: newBusiness.name,
                        description: newBusiness.description,
                        contact: newBusiness.contact,
                        section: newBusiness.section,
                        coordinate: newBusiness.coordinate
                    )
                    // Lo agrega al terminar
                    marketThreads.append(newBusinessCard)
                    
                }
            }
        }
    }
}

#Preview {
    MarketView()
}
