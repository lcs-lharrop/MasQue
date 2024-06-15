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

struct Dislike: Identifiable, Codable {
    var id: Int?
    let answerId: Int
    let userID: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case answerId = "answer_id"
        case userID = "user_id"
    }
}

struct Answer: Identifiable, Codable {
    var id: Int?
    let name: String
    var likes: Int
    let content: String
    let questionId: Int
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case likes
        case content
        case questionId = "question_id"
        case date
    }
//    let date: String
}

struct Question: Identifiable, Codable {
    var id: Int?
    let question: String
    var updated: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case question
        case updated
    }
    
}

struct QuestionsAnswers: Identifiable, Codable {
    
    var id: Int
    let question: String
    var updated: Date
    var answers: [Answer]
    
    struct Answer: Identifiable, Codable {
        var id: Int
        let name: String
        var dislikes: [Dislike]
        let content: String
        var likes: Int
        let date: Date
        
        struct Dislike: Identifiable, Codable {
            var id: Int
            let userID: String
            
            enum CodingKeys: String, CodingKey {
                case id
                case userID = "user_id"
            }
        }
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case dislikes
            case content
            case likes
            case date
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case question
        case answers = "answer"
        case updated
    }

}

