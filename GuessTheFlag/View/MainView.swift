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
    
    lazy var firstFlagButton: UIButton = {
        let view = UIButton()
        self.setUpProperties(of: view, title: "Flag1")
        view.tag = 0
        return view
    }()
    lazy var secondFlagButton: UIButton = {
        let view = UIButton()
        self.setUpProperties(of: view, title: "Flag2")
        view.tag = 1
        return view
    }()
    lazy var thirdFlagButton: UIButton = {
        let view = UIButton()
        self.setUpProperties(of: view, title: "Flag3")
        view.tag = 2
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
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
    }

    private func setSubviewsLayout() {
        
        NSLayoutConstraint.activate([
            secondFlagButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            secondFlagButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            secondFlagButton.widthAnchor.constraint(equalToConstant: LayoutConstant.buttonWidth.rawValue),
            secondFlagButton.heightAnchor.constraint(equalToConstant: LayoutConstant.buttonHeight.rawValue)
        ])
        
        NSLayoutConstraint.activate([
            firstFlagButton.bottomAnchor.constraint(equalTo: secondFlagButton.topAnchor, constant: -20),
            firstFlagButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            firstFlagButton.widthAnchor.constraint(equalToConstant: LayoutConstant.buttonWidth.rawValue),
            firstFlagButton.heightAnchor.constraint(equalToConstant: LayoutConstant.buttonHeight.rawValue)
        ])
        
        NSLayoutConstraint.activate([
            thirdFlagButton.topAnchor.constraint(equalTo: secondFlagButton.bottomAnchor, constant: 20),
            thirdFlagButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            thirdFlagButton.widthAnchor.constraint(equalToConstant: LayoutConstant.buttonWidth.rawValue),
            thirdFlagButton.heightAnchor.constraint(equalToConstant: LayoutConstant.buttonHeight.rawValue)
        ])
    }
}
