//
//  ContentView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-03-12.
//

import Supabase
import SwiftUI

struct MainPageView: View {
    
    
    
    @State var showingAskSheet = false
    
    @State var showingAnswerSheet = false
    
    @State var answeringQuestion = QuestionsAnswers(id: -1, question: "Error, try reloading", updated: Date(), answers: [])
        
    @State private var viewModel = QuestionsViewModel()
    
    var body: some View {
        ScrollViewReader { proxy in
            ZStack {
                Color.darkGray
                    .ignoresSafeArea(.all)
                
                ZStack {
                    VStack {
                        
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach($viewModel.questionsWithAnswers) { $question in
                                    QuestionView(
                                        question: question,
                                        showingAnswerSheet: $showingAnswerSheet,
                                        answeringQuestion: $question
                                    )
                                    .environment(viewModel)
                                    .frame(width: 321)
                                    .padding(20)
                                }
                                
                                
                            }
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.viewAligned)
                        
                        HStack {
                            Text("MasQue")
                            Spacer()
                            Button {
                                showingAskSheet = true
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                            }
                        }
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
                            top: 16,
                            leading: 16,
                            bottom: 0,
                            trailing: 16
                        )
                    )
                    .sheet(isPresented: $showingAskSheet, onDismiss: {
                        Task {
                            try await viewModel.getQuestionWithAnswers()
                        }
                    }) { AskView(showingAskSheet: $showingAskSheet)
                            .environment(viewModel)
                            .ignoresSafeArea()
                            .presentationDetents([.fraction(1)])
                        
                        
                    }
                    
                    if (true == false) {
                        VStack {
                            Spacer()
                            HStack {
                                Button(action: {
                                    proxy.scrollTo(1)
                                }, label: {
                                    Image(systemName: "chevron.left")
                                        .font(.largeTitle)
                                        .foregroundStyle(.white)
                                        .bold()
                                })
                                
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                            .padding(6)
                            Spacer()
                        }
                        
                    }
                }
                
                
                
                
            }
            
        }
    }
}

#Preview {
    MainPageView()
}
