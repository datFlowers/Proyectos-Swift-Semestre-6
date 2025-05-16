//
//  ForumsView.swift
//  swiftChangemakers
//
//  Created by Alumno on 27/03/25.
//

import SwiftUI

struct ForumsView: View {
    @State private var selectedSection: ForumSection = .todos
    @State private var showAddForum: Bool = false
    @State private var forumThreads: [ForumThread] = sampleThreads
    
    // Filtra los hilos según la sección seleccionada
    var filteredThreads: [ForumThread] {
        if selectedSection == .todos {
            return forumThreads
        } else {
            return forumThreads.filter { $0.section == selectedSection }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
               
                
                VStack {
                    HorizontalCategoryPicker(selectedCategory: $selectedSection)
                        .padding(.top)
                    
                    List {
                        ForEach(filteredThreads) { thread in
                            ForumRow(thread: thread)
                                .listRowBackground(Color.clear)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Foros")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            showAddForum = true
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                    }
                }
            }
            .sheet(isPresented: $showAddForum) {
                // Al guardar, se agrega el nuevo hilo a forumThreads
                AddForumView { newThread in
                    forumThreads.append(newThread)
                }
            }
        }
    }
}



#Preview {
    ForumsView()
}
