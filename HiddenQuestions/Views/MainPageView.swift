//
//  ContentView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-03-12.
//

import SwiftUI

struct MainPageView: View {
    
    @State var showingAskSheet = false
    
    @State var showingAnswerSheet = false
    
    @State var answeringQuestion = QuestionsAnswers(id: -1, question: "Error, try reloading", updated: "0", answers: [])
    
    @State private var viewModel = QuestionsViewModel()
    
    
    var body: some View {
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
                        
                        
                    }
                    
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
                .sheet(isPresented: $showingAskSheet) { AskView(showingAskSheet: $showingAskSheet)
                        .ignoresSafeArea()
                        .presentationDetents([.fraction(0.999)])
                    
                    
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: "arrow.left.circle")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .bold()
                        Spacer()
                        Image(systemName: "arrow.right.circle")
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

#Preview {
    MainPageView()
}
