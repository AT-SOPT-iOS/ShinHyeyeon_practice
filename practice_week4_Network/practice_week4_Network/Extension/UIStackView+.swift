//
//  UIStackView.swift
//  practice_week4_Network
//
//  Created by 신혜연 on 5/11/25.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
