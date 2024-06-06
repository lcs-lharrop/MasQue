//
//  QuestionView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-03-12.
//

import SwiftUI

struct QuestionView: View {
    
    var question: Question
    
    @Binding var showingAnswerSheet: Bool
    
//    var answeringQuestion = question.id
    
    var body: some View {
        ZStack {
            Color.gray
                .cornerRadius(20)
            VStack {
                Text(question.question)
                    .padding(24)
                    .multilineTextAlignment(.center)
                    .bold()
                
                
                
                Button {
                    showingAnswerSheet = true
//                    answeringQuestion = question.id
                } label: {
                    ZStack {
                        Color.darkGray
                            .cornerRadius(10)
                            .padding()
                            .frame(height: 100)
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                            .font(.title)
                            .bold()
                    }
                }
                
                ScrollView(.vertical) {
                    LazyVStack {
                        ForEach(question.comments) { answer in
                            AnswerView(answer: answer)
                            
                        }
                    }
                }
            }
        }
    }
}



#Preview {
    QuestionView(question: test, showingAnswerSheet: Binding.constant(true))
}
