//
//  Review.swift
//  swiftChangemakers
//
//  Created by Alumno on 29/03/25.
//

import SwiftUI

// Modelo para Reviews
struct Review: Identifiable {
    let id: UUID
    let username: String
    let rating: Int
    let text: String
}
