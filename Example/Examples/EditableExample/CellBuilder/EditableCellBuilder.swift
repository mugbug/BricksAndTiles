//
//  EditableCellBuilder.swift
//  Example
//
//  Created by Pedro M. Zaroni on 17/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

struct EditableCellBuilder: TableViewEditableCellBuilder {

    var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }

    func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(EditableTableViewCell.self)
    }

    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {
        let cell: EditableTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }

    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return false
    }

    func cellActions(_ tableView: UITableView,
                     at indexPath: IndexPath) -> [EditableCellActionFactory] {
        let deleteAction = EditableCellActionFactory(
            type: .delete,
            style: .destructive,
            title: "Remover",
            backgroundColor: .red,
            actionCompletion: {}
        )

        let newAction = EditableCellActionFactory(
            type: .custom,
            style: .normal,
            title: "Read",
            backgroundColor: .gray,
            actionCompletion: {
                print("Do something")
            }
        )

        return [deleteAction, newAction]
    }
}
