import SwiftUI

struct SavingSectionView: View {
    let banorteRed = Color(red: 227/255, green: 6/255, blue: 19/255)
    @State private var showSheet = false
    @State var index = 2
    @State var backArrow : Bool = false
    @Environment(\.presentationMode) var presentation
    
    @State private var title = ""
    
    var body: some View {
        VStack(spacing: 0) {
            
            HeaderView(index: index, name: "Juanito", backArrow: false, sendDashboard: true)
            
            HStack {
                Spacer()
                Button(action: {
                    title = "Nuevo apartado"
                    showSheet.toggle()
                }) {
                    Text("Nuevo apartado ⊕")
                        .font(.title3)
                        .foregroundColor(Color.gray)
                        .padding(.trailing, 20)
                }
                
                
            }.padding(.top, 10)
            
            
            
            VStack(spacing: 10) {
                
                SavingSectionRowView(productName: "Tarjeta de Crédito", price: "$5,267.00", onTap: {
                    title = "Tarjeta de Crédito"
                    showSheet.toggle()}, state: 1)
                
                SavingSectionRowView(productName: "Agua", price: "$212.00", onTap: {
                    title = "Agua"
                    showSheet.toggle()}, state: 0)
                
                SavingSectionRowView(productName: "Luz", price: "$350.00", onTap: {
                    title = "Luz"
                    showSheet.toggle()}, state: 0)
                
                SavingSectionRowView(productName: "Internet", price: "$500.00", onTap: {
                    title = "Internet"
                    showSheet.toggle()}, state: 0)
                
                Spacer()
            }.padding(.top, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
        .sheet(isPresented: $showSheet) {
            NewSavingSectionView(showSheet: $showSheet, title: $title)
                .presentationDetents([.fraction(2)])
                .presentationDragIndicator(.visible)
        }
    }
}

struct NewSavingSectionView: View {
    @Binding var showSheet: Bool
    @Binding var title: String
    let banorteRed = Color(red: 227/255, green: 6/255, blue: 19/255)
    
    var body: some View {
        NavigationView{
        VStack {
            HStack {
                    VStack (alignment: .leading) {
                        
                        Text("Mis apartados").font(.title3).fontWeight(.bold).padding(.top, 10)
                        
                        Text(title)
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Button(action: {
                        showSheet = false
                    }) {
                        Text("Ⓧ")
                            .font(.title)
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
                
                VStack(spacing: 10) {
                    
                    SavingSectionAction(actionName: "Depositar", imageName: "arrow.down.circle",destination: SavingSectionView1()).padding(.top, 15).foregroundColor(Color.black)
                        
                    SavingSectionAction(actionName: "Retirar", imageName: "arrow.up.circle",destination: SavingSectionView1()).padding(.top, 10).foregroundColor(Color.black)
                        
                    SavingSectionAction(actionName: "Desactivar", imageName: "nosign",destination: SavingSectionView1()).padding(.top, 10).foregroundColor(Color.black)}
                        
                        Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 0)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal, 0)
                .ignoresSafeArea()
                Spacer()
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
        }
    }
}

#Preview {
    SavingSectionView()
}


