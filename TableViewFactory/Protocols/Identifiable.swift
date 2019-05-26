//
//  Identifiable.swift
//  TableViewFactory
//
//  Created by Pedro Zaroni on 26/05/19.
//  Copyright © 2019 Dextra. All rights reserved.
//

import UIKit

public protocol Identifiable {
    static var identifier: String { get }
}

extension Identifiable where Self: UIView {
    public static var identifier: String {
        return "\(Self.self)"
    }
}
