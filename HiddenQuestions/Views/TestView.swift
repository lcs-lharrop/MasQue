//
//  TestView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-06-07.
//

import SwiftUI

struct TestView: View {
    
    @State private var viewModel = QuestionsViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.questions) { question in
                
                Text(question.question)
                
            }
            .navigationTitle("Questions")
        }
        
    }
    
}

#Preview {
    TestView()
}
