//
//  EditableSection.swift
//  MeuAlelo
//
//  Copyright © 2019 Alelo. All rights reserved.
//

import UIKit

class EditableSection: TableViewSection {

    private var cellBuilders: [TableViewEditableCellBuilder]
    private var header: UIView?
    private var footer: UIView?

    typealias DisplayItemBlockType = (TableViewItem) -> Void
    private var willDisplayItem: DisplayItemBlockType?

    var numberOfRows: Int {
        return cellBuilders.count
    }

    init(cellBuilders: [TableViewEditableCellBuilder],
         header: UIView? = nil,
         footer: UIView? = nil,
         willDisplayItem: DisplayItemBlockType? = nil) {
        self.header = header
        self.footer = footer
        self.cellBuilders = cellBuilders
        self.willDisplayItem = willDisplayItem
    }

    func registerCells(in tableView: UITableView) {
        for builder in cellBuilders {
            builder.registerCellIdentifier(in: tableView)
        }
    }

    func cellHeight(forCellAt indexPath: IndexPath, on tableView: UITableView) -> CGFloat {
        return cellBuilders[indexPath.row].cellHeight
    }

    func tableViewCell(_ tableView: UITableView, shouldSelectCellAt indexPath: IndexPath) -> Bool {
        return cellBuilders[indexPath.row].tableViewShouldSelectCell(tableView)
    }

    func tableViewCell(_ tableView: UITableView, didSelectCellAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        return cellBuilders[indexPath.row].tableViewDidSelectCell(tableView)
    }

    func tableViewCell(at indexPath: IndexPath,
                       on tableView: UITableView) -> UITableViewCell {

        return cellBuilders[indexPath.row].tableViewCell(at: indexPath, on: tableView)
    }

    func tableViewSectionFooter(_ tableView: UITableView) -> UIView? {
        return footer
    }

    func tableViewSectionHeader(_ tableView: UITableView) -> UIView? {
        return header
    }

    func tableViewSectionHeaderHeight(_ tableView: UITableView) -> CGFloat {
        if header != nil {
            return UITableView.automaticDimension
        }
        return CGFloat.leastNonzeroMagnitude
    }

    func tableViewSectionFooterHeight(_ tableView: UITableView) -> CGFloat {
        if footer != nil {
            return UITableView.automaticDimension
        }
        return CGFloat.leastNonzeroMagnitude
    }

    func tableView(_ tableView: UITableView,
                   willDisplayFooterView view: UIView,
                   forSection section: Int) {
        self.willDisplayItem?(.footer)
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let cellActions = cellBuilders[indexPath.row].cellActions(tableView, at: indexPath)
        var actions = [UITableViewRowAction]()

        cellActions.forEach { action in
            switch action.type {
            case .delete:
                let handler = removeFromTableView(tableView, at: indexPath)
                let delete = action.make(with: handler)
                actions.append(delete)
            }
        }
        return actions
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return cellBuilders[indexPath.row].canEditRow()
    }

    private func removeFromTableView(_ tableView: UITableView, at indexPath: IndexPath) -> EditableCellActionFactory.HandlerType {
        return { [weak self] completion in
            guard let self = self else { return }

            self.cellBuilders.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top, completion: completion)
        }
    }
}
