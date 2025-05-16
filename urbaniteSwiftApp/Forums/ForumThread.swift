//
//  ForumThread.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//

import SwiftUI

// Enum para representar las secciones del foro
enum ForumSection: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    case todos = "Todos"
    case emergencias = "Emergencias"
    case transporte = "Transporte"
    case seguridad = "Seguridad"
    case servicios = "Servicios"
    case ofertas = "Ofertas"
    case eventos = "Eventos"
    case recomendaciones = "Recomendaciones"
    case consejos = "Consejos"
}

// Modelo de datos para un hilo de foro
struct ForumThread: Identifiable {
    let id: Int
    let title: String
    let author: String
    let date: String
    let excerpt: String
    let section: ForumSection
    var comments: [Comment] = []
}

// Modelo de datos para un comentario
struct Comment: Identifiable {
    let id: Int
    let author: String
    let content: String
    let date: String
}

// Datos de ejemplo
var sampleThreads: [ForumThread] = [
    ForumThread(id: 1, title: "Consejos para moverse en la ciudad", author: "Admin", date: "28/03/2025", excerpt: "Tips sobre transporte público y alternativas...", section: .transporte),
    ForumThread(id: 2, title: "Oferta de trabajo en servicios", author: "Usuario1", date: "27/03/2025", excerpt: "Oportunidad laboral en servicios locales...", section: .ofertas),
    ForumThread(id: 3, title: "Evento en el centro", author: "Usuario2", date: "26/03/2025", excerpt: "Concierto y actividades en la plaza principal...", section: .eventos)
]
