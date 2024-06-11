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
                .select("id, question, updated, answer(id, content, name, dislikes)")
                .execute()
                .value
            self.questionsWithAnswers = results
            dump(self.questionsWithAnswers)
            
        } catch {
            debugPrint(error)
        }
        
    }
    
    func createAnswer(content: String, in question: QuestionsAnswers) {
        
        // Create a unit of asynchronous work to add the to-do item
        Task {
            
            let answer = Answer(
                name: "Anonymous",
                dislikes: 0,
                content: content,
                questionId: question.id
                
            )
            
            // Write it to the database
            do {
                
                // Insert the new to-do item, and then immediately select
                // it back out of the database
                let newlyInsertedItem: QuestionsAnswers = try await supabase
                    .from("answers")
                    .insert(answer)   // Insert the todo item created locally in memory
                    .select()       // Select the item just inserted
                    .single()       // Ensure just one row is returned
                    .execute()      // Run the query
                    .value          // Automatically decode the JSON into an instance of TodoItem
                
                // Finally, insert the to-do item instance we just selected back from the
                // database into the array used by the view model
                // NOTE: We do this to obtain the id that is automatically assigned by Supabase
                //       when the to-do item was inserted into the database table
                self.questionsWithAnswers.append(newlyInsertedItem)
                
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
