//
//  ContentView.swift
//  LOGIN 2
//
//  Created by Alumno on 23/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var username:String = ""
    @State var password:String = ""
    var body: some View {
        
        
        
        ZStack{
            Color.blue.ignoresSafeArea()
            Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
            Circle().scale(1.35).foregroundColor(.white)
            
            VStack{
                Text("Login").font(.largeTitle).foregroundColor(.black).bold()
                
                TextField("Nombre",text:$username).padding().frame(width: 300, height:50).background(Color.black.opacity(0.15)).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                
                TextField("Contraseña",text:$password).padding().frame(width: 300, height:50).background(Color.black.opacity(0.15)).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                
                
                Button("Log in"){
                    
                }.frame(width: 300, height: 50).background(Color.blue).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/).foregroundColor(.white).bold()

            }
        }
    }
}

#Preview {
    ContentView()
}
