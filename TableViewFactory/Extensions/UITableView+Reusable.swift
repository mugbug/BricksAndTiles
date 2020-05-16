//
//  UITableView+Reusable.swift
//  TableViewFactory
//
//  Created by Pedro Zaroni on 26/05/19.
//  Copyright © 2019 Dextra. All rights reserved.
//

import UIKit

public extension UITableView {

    func dequeueReusableCell<T: UITableViewCell & Identifiable>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Cell is not registered - call tableView.register(Cell.Type) to register first before using.")
        }

        return cell
    }

    func register<T: UITableViewCell & Identifiable>(_: T.Type = T.self) {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }
}
