//
//  ContentView.swift
//  MyTube
//
//  Created by Alumno on 23/01/25.
//

import SwiftUI

struct youtube: View {
    struct video: Identifiable{
        let id = UUID()
        
        var image: Image
        var title: String
        var channel: String
        var views: String
        var date: String
    }
    
    
    var body: some View {
        @State var videos: [video] = [
            video(image: Image("Oscars"), title: "Oscars Live Sunday | ABC", channel: "abc official", views: "300k views", date: "· 1 hour ago"),
            video(image: Image("oscars-2025"), title: "Oscars Live Sunday | ABC", channel: "abc official", views: "300k views", date: "· 1 hour ago")
            
        ]
        
        List(videos){ i in
            
            HStack {
                
                i.image.resizable().frame(width:170, height:100)
                
                VStack (alignment: .leading)
                {
                    Text(i.title).font(.body).foregroundColor(.black).multilineTextAlignment(.leading).bold()
                    
                    Text(i.channel).font(.caption).foregroundColor(.black).multilineTextAlignment(.leading).bold()
                    
                    
                    
                    HStack{
                        
                        
                        Text(i.views).font(.caption).foregroundColor(.black).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        
                        Text(i.date).font(.caption).foregroundColor(.black).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    }
                    
                    
                    
                    
                    
                }
                
                Image(systemName: "ellipsis").foregroundColor(.black)
                
        }
        
        
        }
        
    }
}

#Preview {
    youtube()
}
