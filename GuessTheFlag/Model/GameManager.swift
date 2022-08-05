//
//  GameManager.swift
//  GuessTheFlag
//
//  Created by Michael Khavin on 06.08.2022.
//

import Foundation

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
    private(set) var currentScore = 0
    private var correctAnswer = 0
    
    func getRandomCountry(of index: Int) -> String {
        countries[index]
    }
    
    mutating func getCorrectAnswer() -> String {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        return countries[correctAnswer].uppercased()
    }
    
    mutating func setScore(by answer: Int) -> Bool {
        if answer == correctAnswer {
            currentScore += 1
            return true
        } else {
            currentScore -= 1
            return false
        }
    }
}
