//
//  MarketView2.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI
import CoreLocation

struct MarketView: View {
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
                            ForEach(filteredThreads, id: \.id) { thread in
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
            .navigationTitle("Market")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            showAddBusiness = true
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $showAddBusiness) {
                AddBusinessView(isPresented: $showAddBusiness) { newBusiness in
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
                    marketThreads.append(newBusinessCard)
                    
                }
                
            }
        }
    }
}

#Preview {
    MarketView()
}
