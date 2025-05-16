//
//  SideBarView.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI

extension View {
    var screenRect: CGRect {
        UIScreen.main.bounds
    }
}


// Sidebar con el diseño solicitado
struct SideBarView: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Negocios Locales")
                    .bold()
                    .font(.title)
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
                
                Text("Sucursales y Empresas")
                    .bold()
                    .font(.title)
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
            .padding(.top, 80)
            .padding(.bottom, 20)
            Divider()
        }
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(Color.white.opacity(1).ignoresSafeArea(.container, edges: .vertical))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title: String, destination: AnyView? = nil) -> some View {
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
                    .fill(Color.primary.opacity(0.1))
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
            )
        }
        .foregroundColor(.black)
    }
}

