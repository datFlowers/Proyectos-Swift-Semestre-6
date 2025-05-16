//
//  ForumRow.swift
//  swiftChangemakers
//
//  Created by Alumno on 28/03/25.
//
import SwiftUI

struct ForumRow: View {
    let thread: ForumThread
    
    var body: some View {
        NavigationLink(destination: ForumDetailView(thread: thread)) {
            VStack(alignment: .leading, spacing: 8) {
                Text(thread.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                HStack {
                    Text(thread.author)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(thread.date)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Text(thread.excerpt)
                    .font(.body)
                    .lineLimit(2)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
            .padding(.vertical, 4)
        }
    }
}
