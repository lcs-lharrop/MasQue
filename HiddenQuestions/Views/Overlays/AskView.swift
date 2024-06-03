//
//  AskView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-03-13.
//

import SwiftUI

struct AskView: View {
    
    @State var refresh = 0
    @State var content: String = ""
    
    var body: some View {
        ZStack {
            Text("\(refresh)")
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
                            pl()
                            refresh += 1
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
                    top: 16,
                    leading: 16,
                    bottom: 0,
                    trailing: 16
                )
            )
        }
    }
}

func pl() {
    currentView = "MainPageView"
}

#Preview {
    AskView()
}
