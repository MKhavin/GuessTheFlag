//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Michael Khavin on 04.08.2022.
//

import UIKit

class MainViewController: UIViewController {
    private var gameManager = GameManager()
    
    override func loadView() {
        let mainView = MainView()
        mainView.firstFlagButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        mainView.secondFlagButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        mainView.thirdFlagButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        askQuestion()
    }

    private func askQuestion(action: UIAlertAction! = nil) {
        guard let currentView = view as? MainView else {
            return
        }
        
        title = gameManager.getCorrectAnswer()
        currentView.firstFlagButton.setImage(UIImage(named: gameManager.getRandomCountry(of: 0)), for: .normal)
        currentView.secondFlagButton.setImage(UIImage(named: gameManager.getRandomCountry(of: 1)), for: .normal)
        currentView.thirdFlagButton.setImage(UIImage(named: gameManager.getRandomCountry(of: 2)), for: .normal)
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        let alertTitle = gameManager.setScore(by: sender.tag) ? "CORRECT" : "WRONG"
        let alertController = UIAlertController(title: alertTitle,
                                                message: "Current score: \(gameManager.currentScore)",
                                                preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Continue", style: .default, handler: askQuestion)
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
}

