//
//  AddForumView.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI

struct AddForumView: View {
    @Environment(\.dismiss) var dismiss
    @State private var title: String = ""
    @State private var content: String = ""
    @State private var selectedSection: ForumSection = .todos

    // Closure para retornar el nuevo hilo de foro
    var onSave: (ForumThread) -> Void

    var body: some View {
        NavigationStack {
            Form {
                // Secciones para poder llenar las caracteristicas del foro por titulo, contenido y categoria
                Section(header: Text("Título").font(.headline)) {
                    TextField("Ingresa el título", text: $title)
                }
                Section(header: Text("Contenido").font(.headline)) {
                    TextField("Ingresa el contenido", text: $content)
                }
                Section(header: Text("Categoría").font(.headline)) {
                    Picker("Categoría", selection: $selectedSection) {
                        ForEach(ForumSection.allCases) { section in
                            Text(section.rawValue).tag(section)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                // Botón de guardar integrado en el formulario, con diseño sleek
                Section {
                    Button(action: {
                        let newThread = ForumThread(
                            id: Int.random(in: 1000...9999),
                            title: title,
                            author: "Tú",
                            date: DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none),
                            excerpt: String(content.prefix(50)) + "...",
                            section: selectedSection,
                            comments: []
                        )
                        onSave(newThread)
                        dismiss()
                    }) {
                        Text("Guardar")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .navigationTitle("Nuevo Foro")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") { dismiss() }
                }
            }
        }
    }
}
