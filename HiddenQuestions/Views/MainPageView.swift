//
//  ContentView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-03-12.
//

import SwiftUI

struct MainPageView: View {
    
    @State var refresh = 0
    
    var body: some View {
        ZStack {
            Color.darkGray
                .ignoresSafeArea()
            if (currentView == "AskView") {
                AskView()
            } else if (currentView == "MainPageView") {
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            QuestionView(question: test)
                                .frame(width: 350)
                                .padding(
                                    EdgeInsets(
                                        top: 0,
                                        leading: 0,
                                        bottom: 0,
                                        trailing: 10
                                    )
                                )
                            
                        }
                    }
                    HStack {
                        Text("MasQue")
                        Spacer()
                        Button {
                            Ask()
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
            }
            
        }
        
    }
}

#Preview {
    MainPageView()
}
