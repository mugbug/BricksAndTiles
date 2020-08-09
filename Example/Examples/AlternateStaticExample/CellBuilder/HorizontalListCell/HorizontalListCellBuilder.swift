//
//  CollectionViewCellBuilder.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory
import ViewCodeHelper

struct HorizontalListCellBuilder: TableViewCellBuilder {
    func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(HorizontalListCell.self)
    }

    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {
        let cell: HorizontalListCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }

    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        false
    }

    var cellHeight: CGFloat {
        return 150
    }
}
