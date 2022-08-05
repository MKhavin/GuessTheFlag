//
//  GameManager.swift
//  GuessTheFlag
//
//  Created by Michael Khavin on 06.08.2022.
//

import Foundation

struct GameManager {
    private var countries = [String]()
    var currentScore = 0
    
    init() {
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
    }
    
    func getCountry() -> String {
        countries.randomElement()
    }
}
