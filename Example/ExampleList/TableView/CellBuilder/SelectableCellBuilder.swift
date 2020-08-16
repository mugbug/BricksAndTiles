//
//  SelectableCellBuilder.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import Foundation
import TableViewFactory

struct SelectableCellBuilder: TableViewCellBuilder {
    typealias CellType = SelectableExampleTableViewCell

    let model: CellType.ViewModel
    let didSelect: (CellType.ViewModel) -> Void

    var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }

    func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(CellType.self)
    }

    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {
        let cell: CellType = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: model)
        return cell
    }

    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return true
    }

    func tableViewDidSelectCell(_ tableView: UITableView) {
        didSelect(model)
    }
}
