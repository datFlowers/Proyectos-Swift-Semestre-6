//
//  UserView.swift
//  swiftChangemakers
//
//  Created by Alumno on 26/03/25.
//

import SwiftUI

struct UserView: View {
    @AppStorage("username") private var username = "Juan451"
    @State private var email = "juanpersonal123@gmail.com"
    @State private var selectedColor: Color = .blue
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("User Information")) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(selectedColor)
                            .offset(y: 3)
                        Text(username)
                            .font(.title)
                    }
                    Text(email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Section {
                    DisclosureGroup("Settings") {
                        SettingsView(selectedColor: $selectedColor)
                    }
                }
            }
            .navigationTitle("👋 Hola ¡" + username + "!")
        }
    }
}

struct SettingsView: View {
    @AppStorage("username") private var username: String = "Juan451"
    @State private var newUsername: String = ""
    @Binding var selectedColor: Color
    @State private var tappedColor: Color = .blue
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Username")
                .font(.title3)
            
            
            TextField("Nuevo nombre de usuario", text: $newUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)

            
            Text("Background Color")
                .font(.title3)
            
            HStack {
                ForEach([Color.blue, Color.green, Color.red, Color.orange, Color.purple, Color.yellow,], id: \.self) { color in
                    Circle()
                        .fill(color)
                        .frame(width: tappedColor == color ? 50 : 40, height: tappedColor == color ? 50 : 40)
                        .overlay(Circle().stroke(Color.white, lineWidth: 1))
                        .onTapGesture {
                            withAnimation {
                                selectedColor = color
                                tappedColor = color
                            }
                        }
                }
            }
            
            Button {
                if !newUsername.isEmpty {
                    username = newUsername
                    newUsername = ""
                }
            } label: {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Guardar")
                        .bold()
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 2)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview{
    UserView()
}
