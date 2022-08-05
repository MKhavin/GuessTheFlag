//
//  MainView.swift
//  GuessTheFlag
//
//  Created by Michael Khavin on 04.08.2022.
//

import UIKit

class MainView: UIView {
    private enum LayoutConstant: CGFloat {
        case buttonWidth = 200
        case buttonHeight = 100
    }
    
    private lazy var firstFlagButton: UIButton = {
        let view = UIButton()
        self.setUpProperties(of: view, title: "Flag1")
        return view
    }()
    private lazy var secondFlagButton: UIButton = {
        let view = UIButton()
        self.setUpProperties(of: view, title: "Flag2")
        return view
    }()
    private lazy var thirdFlagButton: UIButton = {
        let view = UIButton()
        self.setUpProperties(of: view, title: "Flag3")
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews([
            firstFlagButton,
            secondFlagButton,
            thirdFlagButton
        ])
        setSubviewsLayout()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUpProperties(of button: UIButton, title: String) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.text = title
        button.setImage(UIImage(named: "us"), for: .normal)
    }

    private func setSubviewsLayout() {
        NSLayoutConstraint.activate([
            firstFlagButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            firstFlagButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            firstFlagButton.widthAnchor.constraint(equalToConstant: LayoutConstant.buttonWidth.rawValue),
            firstFlagButton.heightAnchor.constraint(equalToConstant: LayoutConstant.buttonHeight.rawValue)
        ])
        
        NSLayoutConstraint.activate([
            secondFlagButton.topAnchor.constraint(equalTo: firstFlagButton.bottomAnchor, constant: 20),
            secondFlagButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            secondFlagButton.widthAnchor.constraint(equalToConstant: LayoutConstant.buttonWidth.rawValue),
            secondFlagButton.heightAnchor.constraint(equalToConstant: LayoutConstant.buttonHeight.rawValue)
        ])
        
        NSLayoutConstraint.activate([
            thirdFlagButton.topAnchor.constraint(equalTo: secondFlagButton.bottomAnchor, constant: 20),
            thirdFlagButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            thirdFlagButton.widthAnchor.constraint(equalToConstant: LayoutConstant.buttonWidth.rawValue),
            thirdFlagButton.heightAnchor.constraint(equalToConstant: LayoutConstant.buttonHeight.rawValue)
        ])
    }
}
