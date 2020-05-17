//
//  TableViewSelectableCellBuilder.swift
//  TableViewFactory
//
//  Copyright © 2019 Dextra. All rights reserved.
//

import UIKit

public typealias SelectableCell = UITableViewCell & SelectableTableViewCell

public protocol TableViewSelectableCellBuilder {

    var cellHeight: CGFloat { get }

    func registerCellIdentifier(in tableView: UITableView)
    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> SelectableCell

    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool
    func tableViewDidSelectCell(_ tableView: UITableView)

}

public extension TableViewSelectableCellBuilder {
    func tableViewDidSelectCell(_ tableView: UITableView) { }

    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return true
    }
}
