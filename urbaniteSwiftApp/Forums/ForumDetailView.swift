//
//  ForumDetailView.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI

struct ForumDetailView: View {
    @State var thread: ForumThread
    @State private var newComment = ""
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(thread.title)
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .foregroundColor(.primary)
                        
                        HStack {
                            Text("Por \(thread.author)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Spacer()
                            Text(thread.date)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        Divider()
                        
                        Text("Contenido completo del hilo...")
                            .font(.body)
                            .foregroundColor(.primary)
                        
                        Divider()
                        
                        Text("Comentarios")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.primary)
                        
                        ForEach(thread.comments) { comment in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text(comment.author)
                                        .font(.subheadline)
                                        .bold()
                                        .foregroundColor(.blue)
                                    Spacer()
                                    Text(comment.date)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                Text(comment.content)
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        }
                    }
                    .padding()
                }
                
                // Área para agregar nuevo comentario
                HStack {
                    TextField("Agrega un comentario...", text: $newComment)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                    
                    Button(action: {
                        withAnimation {
                            let comment = Comment(id: thread.comments.count + 1,
                                                  author: "Tú",
                                                  content: newComment,
                                                  date: "Hoy")
                            thread.comments.append(comment)
                            newComment = ""
                        }
                    }, label: {
                        Text("Enviar")
                            .fontWeight(.bold)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 16)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                }
                .padding()
            }
        }
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)
    }
}
