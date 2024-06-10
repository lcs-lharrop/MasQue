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
    
    var questions: [Question] = []
    
    init() {
        Task {
            try await getQuestions()
        }
    }
    
    func getQuestions() async throws {
        
        do {
            
            let results: [Question] = try await supabase
                .from("question")
                .select()
                .execute()
                .value
            self.questions = results
            
        } catch {
            debugPrint(error)
        }
        
    }
    
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
