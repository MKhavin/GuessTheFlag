//
//  UIViewExtension.swift
//  GuessTheFlag
//
//  Created by Michael Khavin on 04.08.2022.
//

import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { view in
            self.addSubview(view)
        }
    }
}
