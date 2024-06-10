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

struct Question: Identifiable, Codable {
    
    let id: Int?
    let question: String
    var date: String
    
}

struct QuestionAnswers: Identifiable, Codable {
    
    let id: Int?
    let question: String
    var date: String
    var answers: [Answer]
    
    struct Answer: Identifiable, Codable {
        let id: Int?
        let name: String
        var dislikes: Int
        let content: String
        let questionid: Int
        let date: String
    }

}

