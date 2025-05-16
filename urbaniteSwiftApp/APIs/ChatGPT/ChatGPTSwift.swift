//
//  ChatGPTSwift.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//
/*
import SwiftUI
import ChatGPTSwift
import OpenAIKit

struct ContentView: View {
    // Inicializamos el API manager
    let api = ChatGPTAPI(apiKey: "API_KEY")
    
    @State private var userInput = ""
    @State private var chatResponse = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Pregunta sobre la ciudad...", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Enviar") {
                sendQuestion()
            }
            
            Text("Respuesta:")
                .font(.headline)
            Text(chatResponse)
                .padding()
        }
        .padding()
    }
    
    func sendQuestion() {
        // Aquí podrías personalizar el prompt, por ejemplo incluyendo la ubicación actual.
        let prompt = "Como experto en la ciudad de Monterrey, Nuevo Léon, México, dime: \(userInput)"
        
        Task {
            do {
                // Usamos el método normal (no stream) para obtener la respuesta completa
                let response = try await api.sendMessage(text: prompt,
                                                         model: "gpt-3.5-turbo",
                                                         systemText: "Eres un guía turístico experto en la ciudad.",
                                                         temperature: 0.5)
                // Actualizamos la UI en el hilo principal
                await MainActor.run {
                    self.chatResponse = response
                }
            } catch {
                await MainActor.run {
                    self.chatResponse = "Error: \(error.localizedDescription)"
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
*/
