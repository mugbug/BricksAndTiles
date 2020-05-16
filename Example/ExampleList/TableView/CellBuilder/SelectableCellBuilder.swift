//
//  SelectableCellBuilder.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import Foundation
import TableViewFactory

class SelectableCellBuilder: TableViewCellBuilder {

    private let didSelect: () -> Void

    init(didSelect: @escaping () -> Void) {
        self.didSelect = didSelect
    }

    var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }

    func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(SelectableExampleTableViewCell.self)
    }

    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {
        let cell: SelectableExampleTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        // configuration
        return cell
    }

    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return true
    }

    func tableViewDidSelectCell(_ tableView: UITableView) {
        didSelect()
    }
}
