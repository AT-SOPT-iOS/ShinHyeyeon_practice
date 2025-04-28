//
//  UITextField+Padding.swift
//  Week1_practice
//
//  Created by 신혜연 on 4/25/25.
//

import UIKit

extension UITextField {
    func addPadding(left: CGFloat? = nil) {
        if let left = left {
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: 0))
            leftViewMode = .always
        }
    }
}
