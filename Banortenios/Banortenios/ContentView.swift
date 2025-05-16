//
//  ContentView.swift
//  Banortenios
//
//  Created by Samuel Aarón Flores Montemayor on 12/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                NavigationLink(destination: SavingSectionView()){
                    Text("Ir a SavingSectionView")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
            .padding()
            .onAppear {
                requestNotificationPermission()
                sendNotification()
                }
        }.navigationTitle("Inicio")
    }
    
    func requestNotificationPermission() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if let error = error {
                    print("Error al solicitar permisos: \(error.localizedDescription)")
            }
        }
    }
    
    func sendNotification() {
            let content = UNMutableNotificationContent()
            content.title = "Bienvenido a Banortenios"
            content.body = "Has abierto la pantalla de inicio."
            content.sound = .default
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false) 
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error al enviar la notificación: \(error.localizedDescription)")
                }
            }
        }
}

#Preview {
    ContentView()
}
