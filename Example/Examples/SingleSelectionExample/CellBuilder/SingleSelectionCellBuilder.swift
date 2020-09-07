//
//  SingleSelectionCellBuilder.swift
//  Example
//
//  Created by Pedro M. Zaroni on 17/05/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

import UIKit
import BricksAndTiles

struct SingleSelectionCellBuilder: TableViewSelectableCellBuilder {

    var model: SingleSelectionTableViewCell.ViewModel

    var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }

    func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(SingleSelectionTableViewCell.self)
    }

    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> SelectableCell {
        let cell: SingleSelectionTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: model)
        return cell
    }

    func tableViewDidSelectCell(_ tableView: UITableView) {
        print(model.name)
    }
}
