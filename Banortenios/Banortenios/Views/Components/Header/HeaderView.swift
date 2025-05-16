import SwiftUI

// Componente HeaderView
struct HeaderView: View {
    
    let banorteRed = Color(red: 227/255, green: 6/255, blue: 19/255)
    @State var index: Int
    @State var name: String
    @Environment(\.presentationMode) var presentation
    @State var backArrow: Bool
    @State var sendDashboard: Bool
    @State var myView: AnyView = AnyView(DashboardView())
    
    var body: some View{
        ZStack {
            ZStack{
                VStack {
                    HStack {
                        Spacer(minLength: 0)
                        
                        if (self.index == 0)
                        {
                            //Default used
                            Image("banorteFullLogo")
                                .resizable()
                                .frame(width: 250, height: 70)
                                .offset(y: 20)
                        }
                        else if (self.index == 1)
                        {
                            //Dashboard
                            VStack
                            {
                                Text("Hola " + self.name).foregroundColor(Color.white)
                                    .font(.title3).bold()
                                Text("Cliente").foregroundColor(Color.white)
                                    .font(.title3).bold()
                            }
                            .offset(y: -15)
                        }
                        else if (self.index == 2)
                        {
                            //Apartados
                            Text("Apartados").foregroundColor(Color.white)
                                .font(.title2).bold()
                                .offset(y: -5)
                        }
                        else if (self.index == 3)
                        {
                            //Savings
                            Text("Savings").foregroundColor(Color.white)
                                .font(.title2).bold()
                                .offset(y: -5)
                        }
                        Spacer(minLength: 0)
                    }
                    Spacer(minLength: 0)
                }
                .padding(.top)
            }
            .background(banorteRed)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 15)
            .overlay
            {
                if (backArrow && !sendDashboard){
                    HStack
                    {
                        Button(action:{presentation.wrappedValue.dismiss()})
                        {
                            Image(systemName: "chevron.left").foregroundColor(Color.white).bold()
                        }
                    }.offset(x: -165)
                }
                else if (!backArrow && sendDashboard){
                    
                    HStack
                    {
                        NavigationLink(destination: myView.navigationBarBackButtonHidden(true))
                        {
                            Image(systemName: "chevron.left").foregroundColor(Color.white).bold()
                                .clipShape(Circle())
                        }
                    }
                    .offset(x: -165)
                }
            }.navigationBarBackButtonHidden(true)
        }
        // Change this in order to affect the space between the other screens and the header when called
        Spacer(minLength: 25)
    }
}

#Preview{
    HeaderView(index: 1, name: "Juanito", backArrow: true, sendDashboard: false)
}
