//
//  TestView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-06-07.
//

import SwiftUI

struct TestView: View {
    
    @State var viewModel = QuestionViewModel()
    
    var body: some View {
        List(viewModel.questions) {question in
            
            Text(question.question)
            
        }
    }
}

#Preview {
    TestView()
}
