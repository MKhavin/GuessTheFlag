//
//  GameManager.swift
//  GuessTheFlag
//
//  Created by Michael Khavin on 06.08.2022.
//

import Foundation

protocol GameManagerDelegate: AnyObject {
    func showCheck(result: Bool, score: Int, answer: String)
    func gameEnded(result: Int)
}

struct GameManager {
    private var countries: [String] = {
        var collection = [String]()
        collection.append("estonia")
        collection.append("france")
        collection.append("germany")
        collection.append("ireland")
        collection.append("italy")
        collection.append("monaco")
        collection.append("nigeria")
        collection.append("poland")
        collection.append("russia")
        collection.append("spain")
        collection.append("uk")
        collection.append("us")
        return collection
    }()
    private(set) var currentScore = 0 {
        didSet {
            if currentScore < 0 {
                currentScore = 0
            }
        }
    }
    private var correctAnswer = 0
    private var currentQuestion = 1
    weak var delegate: GameManagerDelegate?
    
    func getRandomCountry(of index: Int) -> String {
        countries[index]
    }
    
    private mutating func setNextQuestion() {
        guard currentQuestion <= 10 else {
            delegate?.gameEnded(result: currentScore)
            return
        }
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        currentQuestion += 1
    }
    
    mutating func getCorrectAnswer() -> String {
        setNextQuestion()
        return (countries[correctAnswer].uppercased())
    }
    
    mutating func check(answer: Int) {
        if answer == correctAnswer {
            currentScore += 1
            delegate?.showCheck(result: true, score: currentScore, answer: countries[correctAnswer])
        } else {
            currentScore -= 1
            delegate?.showCheck(result: false, score: currentScore, answer: countries[correctAnswer])
        }
    }
    
    mutating func restartGame() {
        currentScore = 0
        correctAnswer = 0
        currentQuestion = 1
    }
}
