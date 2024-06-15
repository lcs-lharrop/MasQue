//
//  QuestionViewModel.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-06-07.
//

import Foundation
import Storage
import SwiftUI


@Observable
class QuestionsViewModel: Observable {
    
    var questionsWithAnswers: [QuestionsAnswers] = []
    
    var userID: String
    
    init() {
        
        self.userID = UUID().uuidString
        
        Task {
            try await getQuestionWithAnswers()
        }
    }
    
    func getQuestionWithAnswers() async throws {
        
        do {
            
            let results: [QuestionsAnswers] = try await supabase
                .from("question")
                .select("id, question, updated, answer(id, content, name, likes, date, dislikes(id, user_id))")
                .order("updated", ascending: false)
//                .order("answer.date", ascending: false)
                .order("date", ascending: false, referencedTable: "answer")
                .execute()
                .value
            self.questionsWithAnswers = results
            dump(self.questionsWithAnswers)
            
        } catch {
            debugPrint(error)
        }
        
    }
    
    func updateAnswer(questionsWithAnswers updatedAnswer: QuestionsAnswers.Answer) {
           
           // Create a unit of asynchronous work to add the to-do item
           Task {
               
               do {
                   
                   
                   try await supabase
                       .from("answer")
                       .update(updatedAnswer)
                       .eq("id", value: updatedAnswer.id)   // Only update the row whose id
                       .execute()                          // matches that of the to-do being deleted
                       
               } catch {
                   debugPrint(error)
               }
               
           }
           
       }
    
    func updateQuestion(questionsWithAnswers updatedQuestion: Question) {
           
           // Create a unit of asynchronous work to add the to-do item
           Task {
               
               do {
                   
                   
                   try await supabase
                       .from("question")
                       .update(updatedQuestion)
                       .eq("id", value: updatedQuestion.id)
                       .execute()
                   
                   try await self.getQuestionWithAnswers()
                       
               } catch {
                   debugPrint(error)
               }
               
           }
           
       }
    
    func createQuestion(question: String) {
        
        // Create a unit of asynchronous work to add the to-do item
        Task {
            
            let question = Question(
                question: question,
                updated: Date()
            )
            
            // Write it to the database
            do {
                
                let _: QuestionsAnswers = try await supabase
                    .from("question")
                    .insert(question)
                    .select()
                    .single()
                    .execute()
                    .value
                
                try await self.getQuestionWithAnswers()
                
            } catch {
                debugPrint(error)
            }
        }
    }
    
    func createAnswer(content: String, in question: QuestionsAnswers) {
        
        // Create a unit of asynchronous work to add the to-do item
        Task {
            
            let answer = Answer(
                name: "Anonymous",
                likes: 0,
                content: content,
                questionId: question.id,
                date: Date()
            )
            
            let nquestion = Question(
                id: question.id,
                question: question.question,
                updated: Date()
            )
            
            // Write it to the database
            do {
                
                let _: QuestionsAnswers.Answer = try await supabase
                    .from("answer")
                    .insert(answer)
                    .select()
                    .single()
                    .execute()
                    .value
                
                try await self.getQuestionWithAnswers()
                
                print(nquestion)
                
                self.updateQuestion(questionsWithAnswers: nquestion)
                
            } catch {
                debugPrint(error)
            }
        }
    }
    
    func dislike(questionsWithAnswers answer: QuestionsAnswers.Answer) {
        
        var hasDisliked = false
        
        for dislike in answer.dislikes {
            print(dislike.userID)
            print(userID)
            if dislike.userID == userID {
                hasDisliked = true
                
            }
        }
        
        
        print(hasDisliked)
        
        if (!hasDisliked) {
            print("yes")
            Task {
                
                let dislike = Dislike(
                    answerId: answer.id,
                    userID: userID
                )
                
                // Write it to the database
                do {
                    print("also")
                    let _: QuestionsAnswers.Answer.Dislike = try await supabase
                        .from("dislikes")
                        .insert(dislike)
                        .select()
                        .single()
                        .execute()
                        .value
                    
                    try await self.getQuestionWithAnswers()
                    
                } catch {
                    debugPrint(error)
                }
            }
        }
    }
}
