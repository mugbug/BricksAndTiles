//
//  DragableExampleCellBuilder.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

struct DragableExampleCellBuilder: TableViewArrangeableCellBuilder {

    var model: DragableExampleTableViewCell.ViewModel

    var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }

    func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(DragableExampleTableViewCell.self)
    }

    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {
        let cell: DragableExampleTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: model)
        return cell
    }

    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return false
    }
}
