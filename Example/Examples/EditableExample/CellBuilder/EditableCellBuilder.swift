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

    func cellLeadingActions(_ tableView: UITableView,
                            at indexPath: IndexPath) -> [EditableCellActionFactory] {
        let readAction = EditableCellActionFactory(
            type: .custom,
            style: .normal,
            title: "Read",
            backgroundColor: .systemBlue,
            actionCompletion: {
                print("Marked as read")
            }
        )

        let favAction = EditableCellActionFactory(
            type: .custom,
            style: .normal,
            title: "Fav",
            backgroundColor: .systemYellow,
            actionCompletion: {
                print("Marked as fav")
            }
        )

        return [readAction, favAction]
    }

    func cellTrailingActions(_ tableView: UITableView,
                             at indexPath: IndexPath) -> [EditableCellActionFactory] {
        let deleteAction = EditableCellActionFactory(
            type: .delete,
            style: .destructive,
            title: "Remove",
            backgroundColor: .red,
            actionCompletion: {
                print("Removed")
            }
        )

        let likeAction = EditableCellActionFactory(
            type: .custom,
            style: .destructive,
            title: "Like",
            backgroundColor: .systemTeal,
            actionCompletion: {
                print("Marked as fav")
            }
        )

        return [deleteAction, likeAction]
    }
}
