//
//  ContentView.swift
//  wEATHER
//
//  Created by Alumno on 06/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (alignment:.leading){
            
            HStack{
                Text("Pronóstico para 10 días").font(.largeTitle).bold()
                Text(" - Monterrey, Nuevo León, México").opacity(0.5)
            }
            
            Text("\nA partir de las 9:05 p.m. CST")
                .multilineTextAlignment(.leading).opacity(0.5)
            Text("________________________________________").opacity(0.6)
            
            HStack{
                Text("\nJueves 06 | Noche")
                Spacer()
                Text("^").bold()

            }
            
            
            
            HStack{
                Text("16 C°").font(.largeTitle).bold()
                Image(systemName: "cloud.moon.fill").foregroundColor(.black).font(.largeTitle)
                Spacer()
                
                VStack{
                    
                    
                    HStack{
                        Image(systemName: "cloud.rain.fill").foregroundColor(.black)
                        
                        Text("8%")
                    }
                    
                    
                    HStack{
                        Image(systemName: "wind").foregroundColor(.black)
                        Text("10%")
                    }
                    
                }
                
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
