//
//  TestView.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-06-13.
//

import SwiftUI

struct TestViewa: View {
    
    @State var somethin = ""
    
    var body: some View {
        TextField("first name", text: $somethin)
        .textFieldStyle(.roundedBorder)
        .foregroundStyle(.orange)
        .padding(.horizontal)
    }
}

#Preview {
    TestViewa()
}
