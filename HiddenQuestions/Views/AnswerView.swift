//
//  AnswerView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-03-12.
//

import SwiftUI

struct AnswerView: View {
    @State var answer: Answer

    
    var body: some View {
        if (answer.isShadowed != true) {
            ZStack {
                Color.darkGray
                    .cornerRadius(10)
                VStack {
                    HStack {
                        ZStack {
                            ZStack {
                                
                                HStack {
                                    if (answer.profiled == true) {
                                        Image(answer.profile ?? "NoPFPPlaceholder")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 50)
                                            .cornerRadius(50)
                                            .padding(
                                                EdgeInsets(
                                                    top: 16,
                                                    leading: 16,
                                                    bottom: 0,
                                                    trailing: 0
                                                )
                                            )
                                    } else {
                                        Color.clear
                                            .frame(height: 50)
                                            .cornerRadius(50)
                                            .padding(
                                                EdgeInsets(
                                                    top: 16,
                                                    leading: 16,
                                                    bottom: 0,
                                                    trailing: 0
                                                )
                                            )
                                    }
                                    Spacer()
                                    Image(systemName: "hand.thumbsdown.fill")
                                        .padding(
                                            EdgeInsets(
                                                top: 16,
                                                leading: 0,
                                                bottom: 0,
                                                trailing: 16
                                            )
                                        )
                                        .frame(height: 50)
                                }
                                
                                
                            }
                            
                            Text(answer.name)
                                .foregroundStyle(Color.white)
                                .padding(.top)
                                .bold()
                            
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

#Preview {
    PagingManager()
}
