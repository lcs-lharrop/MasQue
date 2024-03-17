//
//  TestView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-03-15.
//

import SwiftUI

struct PagingManager: View {
    
    @State var currentView: String = "Main"
    
    var body: some View {
        if currentView == "Ask" {
            return AnyView(AskView())
        } else {
            return AnyView(MainPageView())
        }
    }
}


struct TestView: View {
    
    @Binding var currentView: String
    
    var body: some View {
        Button {
            currentView = "Ask"
        } label: { Text("hi")
        }
            
    }
}

#Preview {
    PagingManager()
}
