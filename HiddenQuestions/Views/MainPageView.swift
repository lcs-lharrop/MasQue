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
    
    
    
    var body: some View {
        ZStack {
            Color.darkGray
                .ignoresSafeArea(.all)
            
            
            VStack {
                ScrollView(.horizontal) {
                    LazyHStack {
                        QuestionView(question: test, showingAnswerSheet: $showingAnswerSheet)
                            .frame(width: 320)
                            .padding(20)
                        
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
            .sheet(isPresented: $showingAnswerSheet) { RespondView(showingAnswerSheet: $showingAnswerSheet, question:"aaaaaaa")
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
                .padding(EdgeInsets(top: 0, leading: 6, bottom: 100, trailing: 6))
                Spacer()
            }
            
        }
        
    }
}

#Preview {
    MainPageView()
}
