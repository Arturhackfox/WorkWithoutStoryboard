//
//  UIView+Extensions.swift
//  WorkWithoutStoryboard
//
//  Created by Arthur Sh on 25.01.2024.
//

import UIKit

extension UIView {
    func addSubViews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
