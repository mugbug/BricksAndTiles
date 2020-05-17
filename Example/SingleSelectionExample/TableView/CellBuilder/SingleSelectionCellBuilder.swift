//
//  SingleSelectionCellBuilder.swift
//  Example
//
//  Created by Pedro M. Zaroni on 17/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

class SingleSelectionCellBuilder: TableViewSelectableCellBuilder {
    var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }

    func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(SingleSelectionTableViewCell.self)
    }

    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> SelectableCell {
        let cell: SingleSelectionTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }
}
