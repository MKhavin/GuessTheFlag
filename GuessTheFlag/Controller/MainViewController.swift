//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Michael Khavin on 04.08.2022.
//

import UIKit

final class MainViewController: UIViewController {
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
        gameManager.delegate = self
        askQuestion()
    }

    private func askQuestion(action: UIAlertAction! = nil) {
        guard let currentView = view as? MainView else {
            return
        }
        
        setNavigationBarTitle(by: "\(gameManager.getCorrectAnswer())\nCurrent score: \(gameManager.currentScore)")
        
        currentView.firstFlagButton.setImage(UIImage(named: gameManager.getRandomCountry(of: 0)), for: .normal)
        currentView.secondFlagButton.setImage(UIImage(named: gameManager.getRandomCountry(of: 1)), for: .normal)
        currentView.thirdFlagButton.setImage(UIImage(named: gameManager.getRandomCountry(of: 2)), for: .normal)
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        gameManager.check(answer: sender.tag)
    }
    
    private func setNavigationBarTitle(by title: String) {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = title
        navigationItem.titleView = label
    }
    
    private func showAlert(title: String, message: String, actionTitle: String, handler: @escaping (UIAlertAction) -> Void) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let action = UIAlertAction(title: actionTitle, style: .default, handler: handler)
        alertController.addAction(action)
        
        present(alertController, animated: true)
    }
}

extension MainViewController: GameManagerDelegate {
    func showCheck(result: Bool, score: Int, answer: String) {
        var message = ""
        if !result {
            message = "Wrong ! That's flag of \(answer.uppercased()).\n"
        }
        message += "Current score: \(score)"
        
        showAlert(title: result ? "CORRECT" : "WRONG",
                  message: message,
                  actionTitle: "Continue",
                  handler: askQuestion)
    }
    
    func gameEnded(result: Int) {
        showAlert(title: "End game",
                  message: "Total score: \(result)",
                  actionTitle: "Restart") { action in
            self.gameManager.restartGame()
            self.askQuestion()
            self.dismiss(animated: true)
        }
    }
}
