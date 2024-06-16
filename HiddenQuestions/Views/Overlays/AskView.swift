//
//  AskView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-03-13.
//

import SwiftUI

struct AskView: View {
    
    @Binding var showingAskSheet: Bool
    
    @State var content: String = ""
    
    
    
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
                        Text("Ask A Question")
                            .padding(32)
                            .font(.title)
                            .bold()
                        
                        
                        ZStack() {
                            TextField("", text: $content,axis: .vertical)
                                .lineLimit(5...20)
                                .foregroundColor(.gray)
                                .background(Color.darkGray)
                                .cornerRadius(10)
                                .padding()
                            
                            
                            
                            
                        }
                        Button {
                            viewModel.createQuestion(question: content)
                            showingAskSheet = false
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
                HStack {
                    Text("MasQue")
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

#Preview {
    AskView(showingAskSheet: Binding.constant(true))
}
