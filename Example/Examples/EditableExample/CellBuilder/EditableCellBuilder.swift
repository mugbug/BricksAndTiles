//
//  EditableCellBuilder.swift
//  Example
//
//  Created by Pedro M. Zaroni on 17/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import BricksAndTiles

struct EditableCellBuilder: TableViewEditableCellBuilder {

    var model: EditableTableViewCell.ViewModel

    var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }

    func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(EditableTableViewCell.self)
    }

    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {
        let cell: EditableTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: model)
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
                print("Marked as read \(self.model.name)")
            }
        )

        let favAction = EditableCellActionFactory(
            type: .custom,
            style: .normal,
            title: "Fav",
            backgroundColor: .systemYellow,
            actionCompletion: {
                print("Marked as fav \(self.model.name)")
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
                print("Removed \(self.model.name)")
            }
        )

        let likeAction = EditableCellActionFactory(
            type: .custom,
            style: .destructive,
            title: "Like",
            backgroundColor: .systemTeal,
            actionCompletion: {
                print("Like \(self.model.name)")
            }
        )

        return [deleteAction, likeAction]
    }
}
