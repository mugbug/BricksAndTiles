//
//  TableViewEditableCellBuilder.swift
//  TableViewFactory
//
//  Copyright © 2019 Dextra. All rights reserved.
//

import UIKit

public protocol TableViewEditableCellBuilder: TableViewCellBuilder {
    func cellLeadingActions(_ tableView: UITableView, at indexPath: IndexPath) -> [EditableCellActionFactory]
    func cellTrailingActions(_ tableView: UITableView, at indexPath: IndexPath) -> [EditableCellActionFactory]
    func canEditRow() -> Bool
}

public extension TableViewEditableCellBuilder {
    func canEditRow() -> Bool {
        return true
    }
}
