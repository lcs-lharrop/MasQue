//
//  QuestionView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-03-12.
//

import SwiftUI

struct QuestionView: View {
    
    let question: QuestionsAnswers
    
    @Binding var showingAnswerSheet: Bool
    
    @Binding var answeringQuestion: QuestionsAnswers
    
    
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
                    
                    answeringQuestion = question
                    showingAnswerSheet = true
                    
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
                        ForEach(question.answers) { answer in
                            AnswerView(answer: answer)
                            
                        }
                    }
                }
                .padding()
            }
        }
        .sheet(isPresented: $showingAnswerSheet) {
            RespondView(
            showingAnswerSheet: $showingAnswerSheet,
            question: answeringQuestion
        )
            .onAppear() {
                print(answeringQuestion)
            }
                .ignoresSafeArea()
                .presentationDetents([.fraction(1)])
            
            
        }
    }
}



//#Preview {
//    QuestionView(question: test, showingAnswerSheet: Binding.constant(true))
//}
