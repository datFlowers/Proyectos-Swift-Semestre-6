//
//  UserView.swift
//  swiftChangemakers
//
//  Created by Alumno on 26/03/25.
//

import SwiftUI

struct UserView: View {
    // Cargamos el usuario base el AppStorage y su informacion basica
    @AppStorage("username") private var username = "Juan451"
    @AppStorage("email") private var email: String = "juanpersonal123@gmail.com"
    @AppStorage("selectedColorHex") private var selectedColorHex: String = Color.blue.toHex()
    private var selectedColor: Color {
        get { Color(hex: selectedColorHex) ?? .blue }
        set { selectedColorHex = newValue.toHex() }
    }
    
    var body: some View {
        NavigationView {
            List {
                // Informacion del usuario
                Section(header: Text("User Information")) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(selectedColor)
                            .offset(y: 3)
                        // Despliegua el usuario y su correo electronico
                        Text(username)
                            .font(.title)
                    }
                    Text(email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Section {
                    // Una tab para los ajustes
                    DisclosureGroup("Settings") {
                        SettingsView(selectedColorHex: $selectedColorHex)
                    }
                }
            }
            .navigationTitle("👋 Hola ¡" + username + "!")
        }
    }
}

// Ajustes para personalizacion del usuario
struct SettingsView: View {
    @AppStorage("username") private var username: String = "Juan451"
    @State private var newUsername: String = ""
    @Binding var selectedColorHex: String
    private var selectedColor: Color {
        Color(hex: selectedColorHex) ?? .blue
    }
    private func updateSelectedColor(to color: Color) {
        selectedColorHex = color.toHex()
    }
    @State private var tappedColor: Color = .blue
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Username")
                .font(.title3)
            
            // Cambio de usuario
            TextField("Nuevo nombre de usuario", text: $newUsername)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .cornerRadius(10)
                .shadow(radius: 2)

            // Cambio de color de fondo
            // No se permite cambiar la IMAGEN especificamente
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
                                updateSelectedColor(to: color)
                                tappedColor = color
                            }
                        }
                }
            }
            
            // Checa que el usuario del textbox si tenga alguna letra para el usuario
            Button {
                if !newUsername.isEmpty {
                    username = newUsername
                    newUsername = ""
                }
            } label: {
                // Boton para guardar cambios del usuario y fondo del icono
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

extension Color {
    func toHex() -> String {
        UIColor(self).toHex() ?? "#0000FF"
    }

    init?(hex: String) {
        guard let uiColor = UIColor(hex: hex) else { return nil }
        self = Color(uiColor)
    }
}

// Usamos una extension para poder salvar el color del usuario base de HEX
extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }

    func toHex() -> String? {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        guard getRed(&r, green: &g, blue: &b, alpha: &a) else { return nil }

        return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
    }
}

#Preview{
    UserView()
}
