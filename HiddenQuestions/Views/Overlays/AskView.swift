//
//  AskView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-03-13.
//

import SwiftUI

struct AskView: View {
    
    @State var refresh = 0
    @State var placeholder1: String = ""
    
    var body: some View {
        ZStack {
            Text("\(refresh)")
            Color.darkGray
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("MasQue")
                    .padding()
            }
            .ignoresSafeArea()
            ZStack {
                Color.gray
                    .cornerRadius(20)
                VStack {
                    Text("Ask A Question")
                        .padding(32)
                        .font(.title)
                    ZStack() {
                        TextField("", text: $placeholder1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .frame(height: 100)
                            .background(Color.darkGray)
                            .cornerRadius(10)
                            .padding()
                        if placeholder1.isEmpty {
                            Text("hi").italic()
                                .foregroundColor(.white)
                                .opacity(0.4)
                        }
                        
                        
                        
                    }
                    Button {
                        pl()
                        refresh += 1
                    } label: {
                        Text("hiiii")
                    }
                    Spacer()
                }
            }
                .padding()
            
        }
    }
}

func pl() {
    currentView = "MainPageView"
}

#Preview {
    AskView()
}
