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
    
    func start() {
        print("Welcome to Arithmetica!\n")
        
        repeat {
            
            let q = Question()
            
            let question = q.string
            let answer = q.answer
            
            print("\n\(questionNumber). \(question)")
            print("Your answer: ", terminator: "")
            if let inputAnswer = readLine() {
                guard let intAnswer = Int(inputAnswer) else {
                    print("Incorrect data type")
                    continue
                }
                questionNumber += 1
                if answer == intAnswer {
                    score += 1
                    print("\nCorrect!")
                } else {
                    print("\nSorry, that's wrong.")
                }
            }
        } while questionNumber <= 10
        
        print("\nYou scored \(score).")
    }
}

let game = GameContext()
game.start()
