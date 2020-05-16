//
//  UIView+Constraints.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

public extension UIView {
    func constraint(_ closure: (UIView) -> [NSLayoutConstraint]) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(closure(self))
    }
}
