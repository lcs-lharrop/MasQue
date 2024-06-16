//
//  AskView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-03-13.
//

import SwiftUI

struct RespondView: View {
    
    @Binding var showingAnswerSheet: Bool
    
    @State var content: String = ""
    
    @State var question: QuestionsAnswers
    
    @Environment(QuestionsViewModel.self) var viewModel
    
    var body: some View {
        ZStack {
            Color.darkGray
                .ignoresSafeArea()
            VStack {
                ZStack {
                    Color.gray
                        .cornerRadius(20)
                    VStack {
                        Text("Responding to")
                            .padding(EdgeInsets(top: 32, leading: 32, bottom: 8, trailing: 32))
                            .font(.title)
                            .bold()
                        Text(question.question)
                            .padding(.bottom)
                        ZStack() {
                            TextField("", text: $content,axis: .vertical)
                                .lineLimit(5...20)
                                .foregroundColor(.gray)
                                .background(Color.darkGray)
                                .cornerRadius(10)
                                .padding()
                            
                            
                            
                            
                        }
                        Button {
                            showingAnswerSheet = false
                            viewModel.createAnswer(content: content, in: question)
                        } label: {
                            ZStack {
                                Text("Submit")
                                    .bold()
                                    .padding(8)
                                    .foregroundColor(.black)
                            }
                            .background(
                                Color.darkGray
                                    .cornerRadius(10)
                            )
                        }
                        Spacer()
                    }
                }
                Text("MasQue")
                    .font(.title)
                    
                    .bold()
                    .padding(
                        EdgeInsets(
                            top: 16,
                            leading: 16,
                            bottom: 0,
                            trailing: 16
                        )
                    )
                    
                
            }
            .padding(
                EdgeInsets(
                    top: 32,
                    leading: 32,
                    bottom: 16,
                    trailing: 32
                )
            )
            .ignoresSafeArea()
        }
    }
}

//#Preview {
//    RespondView(showingAnswerSheet: Binding.constant(true), question: Binding.constant(QuestionsAnswers(id: -1, question: "AAAAAA", updated: "0", answers: [])))
//}
