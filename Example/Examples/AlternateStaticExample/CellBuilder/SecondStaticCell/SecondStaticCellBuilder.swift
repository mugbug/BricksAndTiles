//
//  SecondStaticCellBuilder.swift
//  Example
//
//  Created by Pedro M. Zaroni on 27/06/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

struct SecondStaticCellBuilder: TableViewCellBuilder {
    func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(SecondStaticCell.self)
    }

    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {
        let cell: SecondStaticCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: "Almoço")
        return cell
    }

    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        false
    }

    var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }
}
