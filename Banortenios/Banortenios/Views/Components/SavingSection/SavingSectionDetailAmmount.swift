//
//  Mario estuvo aqui

import SwiftUI


struct SavingSectionDetailAmmount: View {
    
    let ammount: String
    let minAmmount: String
    
    
    
    var body: some View {
        
        VStack{
            
            
            Text("Cantidad").padding()
            
            Text("$ " + ammount + " MN").font(.title).fontWeight(.bold)
            
            Divider()
            
            Text("Cantidad minima $ " + minAmmount + " MN").padding(.top, 10)
            
            
            
            
        }
            
        
    }
}

#Preview {
    SavingSectionDetailAmmount(ammount: "0", minAmmount: "1.00")
}
