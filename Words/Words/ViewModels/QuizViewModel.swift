//
//  QuizViewModel.swift
//  Words
//
//  Created by Alumno on 07/05/25.
//

import Foundation
import SwiftUI

class QuizViewModel: ObservableObject {
    @Published var posts: [Post] = []                  // Todas las preguntas
    @Published var categorizedPosts: [String: [Post]] = [:]  // Agrupa por categoría
    @Published var selectedCategories: [String] = []   // Categorías elegidas por el usuario
    @Published var currentQuestion: Post?              // La pregunta actual
    @Published var options: [String] = []              // Opciones de respuesta
    @Published var answerWasSelected = false           // Indica si ya respondió
    @Published var selectedAnswer: String = ""         // Opción escogida
    @Published var score: Int = 0                      // Puntuación acumulada

    let maxQuestions = 10         // Máximo de preguntas por partida
    var questionQueue: [Post] = [] // Cola interna de preguntas
    var questionsAsked = 0        // Contador de preguntas mostradas

    // Carga el JSON y prepara los posts
    func loadPosts() {
        guard let url = Bundle.main.url(forResource: "questions", withExtension: "json") else {
            print("❌ No se encontró questions.json!!!!!")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([Post].self, from: data)
            self.posts = decoded
            categorizePosts()      // Organiza preguntas por categoría
        } catch {
            print("Error al cargar las preguntas: \(error.localizedDescription)")
        }
    }

    // Agrupa posts en un diccionario por categoría
    private func categorizePosts() {
        var temp: [String: [Post]] = [:]
        for post in posts {
            temp[post.category, default: []].append(post)
        }
        self.categorizedPosts = temp
    }

    // Crea la cola y empieza con las preguntas
    func startGame() {
        score = 0
        questionsAsked = 0

        // Junta todas las preguntas de las categorías seleccionadas
        let pool = selectedCategories.flatMap { categorizedPosts[$0] ?? [] }

        // Escoge aleatoriamente hasta la cantidad que haya en MaxQuesions
        questionQueue = Array(pool.shuffled().prefix(maxQuestions))

        nextQuestion()
    }

    // Avanza a la siguiente pregunta
    func nextQuestion() {
        answerWasSelected = false
        selectedAnswer = ""

        // Si ya no hay más en la cola, termina la partida
        guard !questionQueue.isEmpty else {
            currentQuestion = nil
            options = []
            return
        }

        // Saca y muestra la primera
        let question = questionQueue.removeFirst()
        currentQuestion = question
        questionsAsked += 1

        // Crea 3 opciones: la correcta y 2 aleatorias erróneas
        let pool = selectedCategories.flatMap { categorizedPosts[$0] ?? [] }
        let wrong = pool
            .filter { $0.id != question.id }
            .shuffled()
            .prefix(2)
            .map { $0.body }

        options = ([question.body] + wrong).shuffled()
    }

    // Maneja la selección de respuesta y suma puntos
    func selectAnswer(_ answer: String) {
        selectedAnswer = answer
        answerWasSelected = true
        if answer == currentQuestion?.body {
            score += 1
        }
    }

    // Devuelve el color de fondo según si la opción es correcta o no
    func backgroundColor(for option: String) -> Color {
        guard answerWasSelected else { return .white }
        if option == currentQuestion?.body {
            return .green.opacity(0.3)
        } else if option == selectedAnswer {
            return .red.opacity(0.3)
        } else {
            return .white
        }
    }
}
