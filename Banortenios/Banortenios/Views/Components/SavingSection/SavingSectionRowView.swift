import SwiftUI

//Destination: View

struct SavingSectionRowView: View {
    let productName: String
    let price: String
    let onTap: () -> Void
    @State var state : Int
    
    var body: some View {
        if (state == 0)
        {
            
            VStack {
                Button(action:{ onTap()})
                {
                    Spacer()
                    HStack {
                        Text(productName).foregroundColor(.black)
                        Spacer()
                        HStack {
                            Text(price).foregroundColor(.black)
                            
                            Image(systemName: "chevron.right").foregroundStyle(.red)
                            
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color.white.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal, 20)
        }
        else if (state == 1)
        {
            
            VStack {
                Button(action:{ onTap()})
                {
                    Spacer()
                    HStack {
                        Text(productName).foregroundColor(.white).bold()
                        Spacer()
                        HStack {
                            Text(price).foregroundColor(.white).bold()
                            
                            Image(systemName: "chevron.right").foregroundStyle(.white).bold()
                            
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    //SavingSectionRowView(productName: "Agua", price: "$212.00"
    //destination: Text("")
}
