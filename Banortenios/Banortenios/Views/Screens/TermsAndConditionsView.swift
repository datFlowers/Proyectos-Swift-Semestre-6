import SwiftUI

struct TermsAndConditionsView: View
{
    let banorteRed = Color(red: 227/255, green: 6/255, blue: 19/255)
    @State private var conditions = false
    @State private var notifications = false
    @State var index = 3
    @State var backArrow : Bool = false
    @Environment(\.presentationMode) var presentation
    
    var body: some View
    {
        VStack(spacing: 0) {
            
            if (presentation.wrappedValue.isPresented)
            {
                HeaderView(index: index, name: "Juanito", backArrow: true, sendDashboard: false)
            }
            else
            {
                HeaderView(index: index, name: "Juanito", backArrow: false, sendDashboard: false)
            }
            
            ScrollView {
                Text("Toma el control de tu crédito con nuestra nueva herramienta").font(.title3).fontWeight(.bold).multilineTextAlignment(.leading).foregroundColor(.gray)
                
                Text("Planificador Inteligente de Crédito")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading).foregroundColor(banorteRed)
                Spacer()
                Text("""
            Ahora puedes activar la **Vinculación de Tarjetas**, una funcionalidad que te permite asociar tu tarjeta de crédito con tu cuenta de cheques. 
            
            Cada vez que realices un pago con tu tarjeta de crédito, el monto se moverá automáticamente a un apartado especial dentro de tu cuenta de debito, mientras se cuente con el saldo suficiente para hacerlo.
            
            Es importante aclarar que esta funcionalidad **no hace un pago automático a tu tarjeta de creadito** y tampoco genera cargos directos en tu cuenta de cheques. Tu dinero sigue disponible en todo momento, pero ahora puedes administrar mejor lo que destinas al pago de tu crédito.
            
            Si el saldo en tu cuenta no es suficiente para apartar el monto completo, recibirás una notificación con la cantidad que no pudo trasladarse. Sin embargo, esto **no afectará tus pagos ni el uso de tu tarjeta de crédito.**
            
            **Puedes activar o desactivar esta herramienta en cualquier momento desde los ajustes del apartado en la app.**
            
            Evita sorpresas al final del mes, organiza tu crédito de forma sencilla y toma el control de tus finanzas sin esfuerzo.
            
            """)
                .padding([.leading, .bottom, .trailing], 20)
            }
            
            Spacer()
            
            VStack(alignment: .leading) {
                Toggle("Acepto los términos y condiciones", isOn: $conditions)
                    .toggleStyle(CheckboxToggleStyle())
                    .padding(.horizontal, 20)
                
                Toggle("Deseo recibir notificaciones", isOn: $notifications)
                    .toggleStyle(CheckboxToggleStyle())
                    .padding(.horizontal, 20)
                
                
                VStack(alignment: .center){
                    
                    Text("Para más información, revisa nuestro ")
                    + Text("Aviso de Privacidad")
                        .foregroundColor(.blue)
                        .underline()
                    
                    
                    if (conditions == true && notifications == true)
                    {
                        NavigatingButtonView(style: 0, text: "Aceptar", color: banorteRed, destination: SavingSectionView(), hasNavigation: true)
                    }
                    else
                    {
                        
                        NavigatingButtonView(style: 0, text: "Aceptar", color: Color.gray, destination: SavingSectionView(), hasNavigation: false)
                        
                    }
                    
                }
            }
            .padding(.all)
            .frame(maxWidth: .infinity, maxHeight: 140)
            .background(Color.gray.opacity(0.3)).ignoresSafeArea(.all)
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.1))
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? .blue : .gray)
                configuration.label
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    TermsAndConditionsView()
}
