import SwiftUI
struct SavingSectionView1: View {
    let banorteRed = Color(red: 227/255, green: 6/255, blue: 19/255)
    @State var index = 2
    @State var backArrow : Bool = false
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(spacing: 0) {
            
            if (presentation.wrappedValue.isPresented)
            {
                HeaderView(index: index, name: "Juanito", backArrow: true, sendDashboard: false)
            }
            else
            {
                HeaderView(index: index, name: "Juanito", backArrow: false, sendDashboard: false)
            }
            
            HStack(spacing: 10) {
                SavingSectionDetailSD(SourceOrDestination: "Desde", symbol: "creditcard", entityName: "TARJETA ", account: "Bestia Masculina", ammount: "$10,000")
                
                
                
                SavingSectionDetailSD(SourceOrDestination: "Hasta", symbol: "wallet.bifold.fill", entityName: "IDKK ", account: "", ammount: "$1.0")
                
                
            }.padding(.top, 10)
            
            
            SavingSectionDetailAmmount(ammount: "0", minAmmount: "1.00").padding(.top, 100)
            
            Spacer()
            
            Button(action: {
                
                
                //ACCION
                
            }) {
                
                //NO PUEDO HACERLO ANCHO NI CON EL MAXWIDTH ODIO SWIFT UI
                
                Text("Continuar                                                              ")
                    .foregroundColor(.white)  
                    .padding()
                    .background(Color.gray.opacity(1)).fontWeight(.bold)
                    .cornerRadius(10)
            }.frame(maxWidth: .infinity)//NO JALA GRR
            
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    SavingSectionView1()
}
