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
            splashScreen()
        }
        
    }
}

struct splashScreen: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            if isActive {
                Tabview().navigationBarBackButtonHidden(true)
            } else {
                ZStack{
                    
                    VStack(spacing: 20) {
                                        Image("Logo Urbanite-5")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                        Text("Urbanite")
                                            .font(.title)
                                            .fontWeight(.bold)
                                    }
                    .onAppear {
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
        .background(Color.white)
    }
}

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
