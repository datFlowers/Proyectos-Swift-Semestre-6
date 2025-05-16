//
//  ContentView.swift
//  swiftChangemakers
//
//  Created by Raymond Chavez on 26/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Iniciamos con la struct de splashScreen
            splashScreen()
        }
        
    }
}

// Pantalla Splash que aparece para que la app tenga momento para cargarse
struct splashScreen: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            // Cuando termine, activa el Tabview inicial
            if isActive {
                Tabview().navigationBarBackButtonHidden(true)
            } else {
                ZStack{
                    
                    HStack {
                        Text("urbanite")
                            .font(.title)
                            .fontWeight(.bold)
                        Image(systemName: "AppIcon")
                    }
                    .onAppear {
                        // Dispatch para que tenga un temporizador
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isActive = true
                            }
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

// TabView para que se pueda hacer todo de la app, Home, News, Forums, Market, User, etc.
struct Tabview: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("News")
                }
            ForumsView()
                .tabItem {
                    Image(systemName: "bubble.left.and.exclamationmark.bubble.right.fill")
                    Text("Forums")
                }
            MarketView()
                .tabItem {
                    Image(systemName: "bag.fill")
                    Text("Market")
                }
            UserView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("User")
                }
        }
    }
}

#Preview {
    ContentView()
}
