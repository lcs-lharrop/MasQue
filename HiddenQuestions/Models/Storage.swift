//
//  StoragePrim.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-03-14.
//

import Foundation
import Supabase


let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://qrwzzlexiddbecndwaed.supabase.co")!,
  supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFyd3p6bGV4aWRkYmVjbmR3YWVkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTc3NzUyNzEsImV4cCI6MjAzMzM1MTI3MX0.bGAswE5SPrECA04gjbkOLUbLFhkqbHsZC8uGjPmY4Dg"
)


struct Answer: Identifiable, Codable {
    var id: Int?
    let name: String
    var dislikes: Int
    let content: String
    let questionId: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case dislikes
        case content
        case questionId = "question_id"
    }
//    let date: String
}

struct QuestionsAnswers: Identifiable, Codable {
    
    var id: Int
    let question: String
    let updated: String
    var answers: [Answer]
    
    struct Answer: Identifiable, Codable {
        var id: Int
        let name: String
        var dislikes: Int
        let content: String
//        let date: String
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case question
        case answers = "answer"
        case updated
    }

}

