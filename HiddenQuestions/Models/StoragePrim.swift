//
//  StoragePrim.swift
//  HiddenQuestions
//
//  Created by Lexi on 2024-03-14.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let question: String
    var comments: Array<Answer>
}

struct Answer: Identifiable {
    let id = UUID()
    let name: String
    let profiled: Bool
    let profile: String?
    var shadowCount: Int
    var isShadowed: Bool
    let content: String
}

var test = Question(question: "How do I do this thingy?", comments: [Answer(name: "Lexi", profiled: true, profile: "pfp", shadowCount: 0, isShadowed: false, content: "Maybe you could try fixing it like this :D"),Answer(name: "Anonymous", profiled: false, profile: "pfp", shadowCount: 0, isShadowed: false, content: "Maybe you could try fixing it like this :D")])
