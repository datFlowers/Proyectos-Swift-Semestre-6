import SwiftUI

struct DashboardButtonsView: View {
    
    @State var title: String
    @State var lastDigits: Int
    @State var monetaryValue: Double
    
    //Hacer informacion de las tarjetas como su propio componente - para ray
    
    var body: some View {
        VStack(spacing: 0){
            Button(action:{
            })
            {
                Spacer(minLength: 0)
                Image(systemName: "creditcard.fill")
                    .resizable()
                    .foregroundColor(Color.black)
                    .frame(width: 24, height:16)
                    .offset(x: -10)
                Spacer(minLength: 0)
                VStack{
                    Text(title.uppercased()).foregroundColor(Color.black).bold().padding(.trailing)
                    HStack{
                        Text("····" + String(lastDigits)).foregroundColor(Color.gray)
                        Text("$" + String(monetaryValue)).foregroundColor(Color.gray)
                    }
                }
                Spacer(minLength: 0)
                Image(systemName: "chevron.right").foregroundColor(Color.red).bold()
                Spacer(minLength: 0)
                
                
            }
            .frame(width: 350, height: 75)
            .background(.white, in: RoundedRectangle(cornerRadius: 15))
            Spacer()
        }.padding(.top, 0)
    }
}

