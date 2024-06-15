//
//  AnswerView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-03-12.
//

import SwiftUI

struct AnswerView: View {
    
    @State var answer: QuestionsAnswers.Answer
    
    @Environment(QuestionsViewModel.self) var viewModel
    
    var body: some View {
        if (answer.dislikes.count < 5) {
            ZStack {
                Color.darkGray
                    .cornerRadius(
                        10
                    )
                VStack {
                    HStack {
                        ZStack {
                            HStack {
                                Spacer()
                                Text(answer.name)
                                    .foregroundStyle(Color.white)
                                    .padding()
                                    .bold()
                                Spacer()
                            }
                            HStack{
                                Button(action: {
                                    answer.likes += 1
                                    viewModel.updateAnswer(questionsWithAnswers: answer)
                                }, label: {
                                    Image(systemName: "hand.thumbsdown.fill")
                                        .padding()
                                        .tint(.black)
                                })
                                Spacer()
                                Button(action: {
                                    viewModel.dislike(questionsWithAnswers: answer)
                                }, label: {
                                    Image(systemName: "hand.thumbsdown.fill")
                                        .padding()
                                        .tint(.black)
                                })
                            }
                        }
                        
                        
                        
                        
                    }
                    Text(answer.content)
                        .foregroundStyle(Color.white)
                        .padding(
                            EdgeInsets(
                                top: 0,
                                leading: 16,
                                bottom: 16,
                                trailing: 16
                            )
                        )
                }
                
            }
            
        }
        
    }
    
}


#Preview {
    MainPageView()
}
