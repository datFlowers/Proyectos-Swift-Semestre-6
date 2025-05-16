import SwiftUI

struct SavingSectionAction<Destination: View>: View {
    let actionName: String
    let imageName: String
    let destination: Destination
    
    var body: some View {
        VStack {
            Button(action:{})
            {
                NavigationLink(destination: destination)
                {
                    Spacer()
                    HStack {
                        Text(actionName)
                        
                        Image(systemName: imageName)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right").foregroundStyle(.red)
                    }
                    .padding()
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.gray.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    //SavingSectionAction(actionName: "Depositar", imageName:"square.and.arrow.down")
}
