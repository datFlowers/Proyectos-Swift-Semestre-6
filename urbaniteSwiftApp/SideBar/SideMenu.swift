//
//  SideBarMarket.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Espacio para encabezado u otros elementos si los necesitas
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    // Ejemplo de TabButton sin imagen, con flechita.
                    Text("Negocios Locales").bold().font(.title)
                    TabButton(title: "Restaurantes")
                    TabButton(title: "Cafeterías")
                    TabButton(title: "Servicios Personales")
                    TabButton(title: "Belleza y Cuidado Personal")
                    TabButton(title: "Tiendas de Ropa")
                    TabButton(title: "Talleres y Reparaciones")
                    TabButton(title: "Servicios Creativos")
                    TabButton(title: "Servicios de Limpieza")
                    TabButton(title: "Huertos e Hibernaderos")
                    Divider()
                    Text("Sucursales y Empresas").bold().font(.title)
                    TabButton(title: "Restaurantes")
                    TabButton(title: "Cafeterías")
                    TabButton(title: "Supermercados")
                    TabButton(title: "Bancos")
                    TabButton(title: "Salud y Bienestar")
                    TabButton(title: "Transporte")
                    TabButton(title: "Educación")
                    TabButton(title: "Tiendas de Tecnología")
                    TabButton(title: "Tiendas de Mascotas")
                    TabButton(title: "Joyerías")
                    TabButton(title: "Automoriz")
                    
                }
                .padding(.horizontal)
                .padding(.top, 35).padding(.bottom, 20)
                
                Divider()
                
                
            }
        }
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(Color.primary.opacity(0.04).ignoresSafeArea(.container, edges: .vertical))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title: String) -> some View {
        Button {
            // Acción del botón
        } label: {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.headline)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
            )
        }
        .foregroundColor(.primary)
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}


#Preview {
    SideMenu(showMenu: .constant(true))
}

//Extenting View


