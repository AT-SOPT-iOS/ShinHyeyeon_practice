//
//  UIView+.swift
//  practice_week4_Network
//
//  Created by 신혜연 on 5/11/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
