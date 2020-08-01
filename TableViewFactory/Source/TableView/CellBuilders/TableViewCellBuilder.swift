//
//  TableViewCellBuilder.swift
//  TableViewFactory
//
//  Copyright © 2019 Dextra. All rights reserved.
//

import UIKit

public protocol TableViewCellBuilder {

    var cellHeight: CGFloat { get }

    func registerCellIdentifier(in tableView: UITableView)
    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell

    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool
    func tableViewDidSelectCell(_ tableView: UITableView)
}

public extension TableViewCellBuilder {
    func tableViewDidSelectCell(_ tableView: UITableView) {
        print("Default implementation")
    }
}
