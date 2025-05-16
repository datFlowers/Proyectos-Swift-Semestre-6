//
//  ContentView.swift
//  PinkPalace
//
//  Created by Alumno on 10/04/25.
//

import SwiftUI
import QuickLook

struct ContentView: View {
    @State private var arModelURL: URL?
    var body: some View {
        VStack {
            Button{
                if let url = Bundle.main.url(forResource: "Coraline", withExtension: "usdz") {
                    arModelURL = url
                }else{
                    print("File not found")
                }
            } label: {
                Text("Open Coraline")
            }.padding()
            
            Button{
                if let url = Bundle.main.url(forResource: "Pink Palace", withExtension: "usdz") {
                    arModelURL = url
                }else{
                    print("File not found")
                }
            } label: {
                Text("Open Pink Palace")
            }
        }
        .quickLookPreview($arModelURL).padding()
    }
}

#Preview {
    ContentView()
}
