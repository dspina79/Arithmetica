//
//  main.swift
//  Arithmetica
//
//  Created by Dave Spina on 4/7/21.
//

import Foundation

enum QuestionType: CaseIterable {
    case add
    case subtract
    case multiply
}

struct Question {
    var left: Int
    var right: Int
    var questionType: QuestionType
    
    var string: String {
        switch self.questionType {
        case .add:
            return "What is \(self.left) + \(self.right)?"
        case .subtract:
            return "What is \(self.left) - \(self.right)?"
        case .multiply:
            return "What is \(self.left) x \(self.right)?"
        }
    }

    var answer: Int {
        switch self.questionType {
        case .add:
            return self.left + self.right
        case .subtract:
            return self.left - self.right
        case .multiply:
            return self.left * self.right
        }
    }
    
    init() {
        left = Int.random(in: 1...12)
        right = Int.random(in: 1...12)
        questionType = QuestionType.allCases.randomElement()!
    }
}

class GameContext {
    var questionNumber = 1
    var score = 0
    
    func process(_ answer: String, for question: Question) -> String {
        guard let intAnswer = Int(answer) else {
            return "Error"
        }
        questionNumber += 1
        if question.answer == intAnswer {
            score += 1
            return "Correct!"
        } else {
            return "Sorry, that's wrong."
        }
    }
    
    func start() {
        print("Welcome to Arithmetica!\n")
        
        repeat {
            let q = Question()
            
            print("\n\(questionNumber). \(q.string)")
            print("Your answer: ", terminator: "")
            if let inputAnswer = readLine() {
                print("\n\(process(inputAnswer, for: q))")
            }
            
        } while questionNumber <= 10
        
        print("\nYou scored \(score).")
    }
}

let game = GameContext()
game.start()
