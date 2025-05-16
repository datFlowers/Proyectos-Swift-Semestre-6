//
//  CuentasDashboardView.swift
//  Banortenios
//
//  Created by Raymond Chavez on 17/02/25.
//

import SwiftUI

struct DashboardView: View
{
    var bannerActive: Bool = true
    @State var index = 1
    @State var backArrow : Bool = false
    @Environment(\.presentationMode) var presentation
    
    var body: some View
    {
        NavigationView{
            VStack(spacing: 0)
            {
                HeaderView(index: index, name: "Juanito", backArrow: false, sendDashboard: false)
                
                ScrollView{
                    BannerServiceView(text: "Prueba la nueva herramienta para manejar tus cuentas!", destination: TermsAndConditionsView())
                    HStack
                    {
                        Spacer()
                        Text("Mis cuentas").bold().font(.title).padding()
                        Spacer(minLength: 150)
                        Button(action:{})
                        {
                            Image(systemName: "gearshape.fill")
                                .font(.title2)
                                .foregroundColor(Color.gray)
                        }
                        Spacer()
                    }
                    VStack
                    {
                        DashboardButtonsView(title: "Saldo Personal", lastDigits: 6432, monetaryValue: 99.45)
                        DashboardButtonsView(title: "Inversión Personal",lastDigits: 4631, monetaryValue: 10.55)
                    }
                    
                    HStack
                    {
                        Spacer()
                        Text("Mis Tarjetas").bold().font(.title).padding()
                        Spacer(minLength: 150)
                        Button(action:{})
                        {
                            Image(systemName: "gearshape.fill")
                                .font(.title2)
                                .foregroundColor(Color.gray)
                        }
                        Spacer()
                    }
                    VStack
                    {
                        DashboardButtonsView(title: "Tarjeta de Crédito", lastDigits: 6432, monetaryValue: 99.45)
                        DashboardButtonsView(title: "Tarjeta de Débito",lastDigits: 4631, monetaryValue: 10.55)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.1))
        }
    }
}

#Preview {
    DashboardView()
}
