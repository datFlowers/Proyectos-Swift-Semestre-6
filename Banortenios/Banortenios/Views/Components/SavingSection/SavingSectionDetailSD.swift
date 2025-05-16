//
//  Mario estuvo aqui

import SwiftUI

struct SavingSectionDetailSD: View {

    let SourceOrDestination: String
    let symbol: String
    let entityName: String
    let account: String
    let ammount: String

    var body: some View {

        VStack {

            VStack {
                VStack {
                    
                    VStack
                    {
                        Text(SourceOrDestination).font(.title2).fontWeight(.bold)//.background(Color.gray)
                        
                        //Por mas que le mueva no quiere hacerse gris en todo lo ancho, ODIO SWIFT UI
                        

                    }.frame(maxWidth: .infinity).ignoresSafeArea()
                    
                    
                    Image(systemName: symbol).padding(.top, 10).font(.title)

                    Text(entityName).fontWeight(.bold).padding(.top, 10).ignoresSafeArea()

                    Text(account).font(.caption).foregroundColor(.gray).padding(
                        .top, 20)

                    Text(ammount + " MN").fontWeight(.bold).font(.title2).ignoresSafeArea()
                    
                }.frame(width: 100, height: 150)

            }.padding(30)

        }.background(Color.gray.opacity(0.1))
            .cornerRadius(10)

    }
}

#Preview {
    SavingSectionDetailSD(
        SourceOrDestination: "Desde", symbol: "creditcard",
        entityName: "TARJETA DEBITO", account: "Bestia Masculina",
        ammount: "$10.0")
}
