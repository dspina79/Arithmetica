//
//  ArithmeticaTests.swift
//  ArithmeticaTests
//
//  Created by Dave Spina on 4/7/21.
//
@testable import Arithmetica
import XCTest

class ArithmeticaTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func questionOperandsWithinBounds() {
        let question = Question()
        
        XCTAssertGreaterThanOrEqual(question.left, 1)
        XCTAssertGreaterThanOrEqual(question.right, 1)
        XCTAssertLessThanOrEqual(question.left, 12)
        XCTAssertLessThanOrEqual(question.right, 12)
    }
    
    func questionStringWithAddHasCorrectSyntax() {
        var question = Question()
        question.left = 3
        question.right = 2
        question.questionType = QuestionType.multiply
        
        XCTAssertEqual("What is 3 + 2?", question.string)
    }
    
    func questionStringWithSubtractHasCorrectSyntax() {
        var question = Question()
        question.left = 3
        question.right = 2
        question.questionType = QuestionType.multiply
        
        XCTAssertEqual("What is 3 - 2?", question.string)
    }
    
    func questionStringWithMultiplyHasCorrectSyntax() {
        var question = Question()
        question.left = 3
        question.right = 2
        question.questionType = QuestionType.multiply
        
        XCTAssertEqual("What is 3 x 2?", question.string)
    }
    
    func questionAnswerWithAdditionEquals5() {
        var question = Question()
        question.left = 3
        question.right = 2
        question.questionType = QuestionType.add
        
        XCTAssertEqual(5, question.answer)
    }
    
    func questionAnswerWithSubtractionEquals1() {
        var question = Question()
        question.left = 3
        question.right = 2
        question.questionType = QuestionType.subtract
        
        XCTAssertEqual(1, question.answer)
    }
    
    func questionAnswerWithMultiplyEquals6() {
        var question = Question()
        question.left = 3
        question.right = 2
        question.questionType = QuestionType.multiply
        
        XCTAssertEqual(6, question.answer)
    }

}
