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

class GameContext {
    var questionNumber = 1
    var score = 0
    
    func start() {
        print("Welcome to Arithmetica!\n")
        
        repeat {
            let left = Int.random(in: 1...12)
            let right = Int.random(in: 1...12)
            let questionType = QuestionType.allCases.randomElement()!
            
            let question: String
            let answer: Int
            
            switch questionType {
            case .add:
                question = "What is \(left) + \(right)?"
            case .subtract:
                question = "What is \(left) - \(right)?"
            case .multiply:
                question = "What is \(left) x \(right)?"
            }
            
            // two switch cases for now...
            switch questionType {
            case .add:
                answer = left + right
            case .subtract:
                answer = left - right
            case .multiply:
                answer = left * right
            }
            
            
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
        } while questionNumber < 10
        
        print("\nYou scored \(score).")
    }
}

let game = GameContext()
game.start()
