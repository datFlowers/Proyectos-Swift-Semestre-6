import SwiftUI

struct BannerServiceView<Destination: View>: View
{
    var text: String
    var destination: Destination
    
    var body: some View
    {
        VStack
        {
            Button(action:{})
            {
                NavigationLink(destination: destination)
                {
                    Image(systemName: "wallet.pass")
                        .foregroundColor(.white)
                    Text(text)
                        .font(.body)
                        .foregroundColor(.white)
                        .bold()
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                }
            }
            .padding()
            .frame(maxWidth: 350)
            .background(Color.red)
            .cornerRadius(10)
        }
    }
}

