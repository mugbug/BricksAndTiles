//
//  TableViewEditableCellBuilder.swift
//  MeuAlelo
//
//  Copyright © 2019 Alelo. All rights reserved.
//

import UIKit

protocol TableViewEditableCellBuilder: TableViewCellBuilder {
    func cellActions(_ tableView: UITableView, at indexPath: IndexPath) -> [EditableCellActionFactory]
    func canEditRow() -> Bool
}

extension TableViewEditableCellBuilder {
    func canEditRow() -> Bool {
        return true
    }
}
