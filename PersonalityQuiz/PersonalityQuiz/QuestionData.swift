//  Minor Programming, App Studio
//
//  ViewController.swift
//  Personality Quiz
//
//  Created by Eleanoor Polder (10979301) on 28-04-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//
//  Code for questions and answers

import Foundation

// Strucy for question.
struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

// Enumaration for answer type.
enum ResponseType {
    case single, multiple, ranged
}

// Struct for answers
struct Answer {
    var text: String
    var type: VegetableSort
}

// Enumeration for emoji with answer.
enum VegetableSort: Character {
    case cucumber = "🥒", tomato = "🍅", avocado = "🥑", eggplant = "🍆"
    
    // End answers for every vegetable.
    var definition: String {
        switch self {
        case.cucumber:
            return "You are a cucumber!! This means that you like basic things. Going on vacation in Europe, while drinking a gin and tonic. Fun but not to crazy!"
        case .tomato:
            return "You are a tomato!! This means that you're an outgoing person. Loving extraordinairy things. A day with you will never be boring."
        case .avocado:
            return "You are an avocado!! You're focussed on your health and body. When you set a goal, you go for it without anything holding you back."
        case .eggplant:
            return "You are an eggplant!! You'e a dreamy person. Loving to cook special things and enjoy life as much as possible."
        }
    }
}

