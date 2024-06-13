//
//  QuestionViewModel.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-06-07.
//

import Foundation
import Storage


@Observable
class QuestionsViewModel: Observable {
    
//    var questions: [Question] = []
    var questionsWithAnswers: [QuestionsAnswers] = []
    
    init() {
        //        Task {
        //            try await getQuestions()
        //        }
        Task {
            try await getQuestionWithAnswers()
        }
    }
    
    func getQuestionWithAnswers() async throws {
        
        do {
            
            let results: [QuestionsAnswers] = try await supabase
                .from("question")
                .select("id, question, updated, answer(id, content, name, dislikes, date)")
                .execute()
                .value
            self.questionsWithAnswers = results
            dump(self.questionsWithAnswers)
            
        } catch {
            debugPrint(error)
        }
        
    }
    
    func update(questionsWithAnswers updatedAnswer: QuestionsAnswers.Answer) {
           
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
    
    func createQuestion(question: String) {
        
        // Create a unit of asynchronous work to add the to-do item
        Task {
            
            let question = Question(
                question: question,
                updated: "0"
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
                dislikes: 0,
                content: content,
                questionId: question.id,
                date: "0"
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
                
            } catch {
                debugPrint(error)
            }
        }
    }
    
    //    func getQuestions() async throws {
    //
    //        do {
    //
    //            let results: [Question] = try await supabase
    //                .from("question")
    //                .select()
    //                .execute()
    //                .value
    //            self.questions = results
    //
    //        } catch {
    //            debugPrint(error)
    //        }
    //
    //    }
    
}


//@Observable
//class QuestionsViewModel {
//
//    var questions: [QuestionAnswer]
//
//
//    var fetchingQuestions: Bool = false
//
//    // MARK: Initializer(s)
//    init(questions: [Question] = []) {
//        self.questions = questions
//        Task {
//            try await getQuestions()
//        }
//    }
//
//    // MARK: Functions
//    func getQuestions() async throws {
//
//        fetchingQuestions = true
//
//        do {
//            let results: [Question] = try await supabase
//                .from("question")
//                .select()
//                .order("date",ascending: true)
//                .execute()
//                .value
//
//            self.questions = results
//
//            fetchingQuestions = false
//
//        } catch {
//            debugPrint(error)
//        }
//
//
//    }
//}
