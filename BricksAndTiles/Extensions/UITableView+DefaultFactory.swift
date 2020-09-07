//
//  UITableView+DefaultConfiguration.swift
// BricksAndTiles
//
//  Created by Pedro M. Zaroni on 01/08/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

public extension UITableView {
    static func standard() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 44
        if #available(iOS 13.0, *) {
            tableView.backgroundColor = .groupTableViewBackground
        } else {
            tableView.backgroundColor = .lightGray
        }
        return tableView
    }
}
