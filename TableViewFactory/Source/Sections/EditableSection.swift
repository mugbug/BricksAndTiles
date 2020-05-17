//
//  EditableSection.swift
//  TableViewFactory
//
//  Copyright © 2019 Dextra. All rights reserved.
//

import UIKit

public class EditableSection: TableViewSection {

    private var cellBuilders: [TableViewEditableCellBuilder]
    private var header: UIView?
    private var footer: UIView?

    private var willDisplayItem: DisplayItemBlockType?

    public var numberOfRows: Int {
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

    public func registerCells(in tableView: UITableView) {
        for builder in cellBuilders {
            builder.registerCellIdentifier(in: tableView)
        }
    }

    public func cellHeight(forCellAt indexPath: IndexPath, on tableView: UITableView) -> CGFloat {
        return cellBuilders[indexPath.row].cellHeight
    }

    public func tableViewCell(_ tableView: UITableView, shouldSelectCellAt indexPath: IndexPath) -> Bool {
        return cellBuilders[indexPath.row].tableViewShouldSelectCell(tableView)
    }

    public func tableViewCell(_ tableView: UITableView, didSelectCellAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        return cellBuilders[indexPath.row].tableViewDidSelectCell(tableView)
    }

    public func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {

        return cellBuilders[indexPath.row].tableViewCell(at: indexPath, on: tableView)
    }

    public func tableViewSectionFooter(_ tableView: UITableView) -> UIView? {
        return footer
    }

    public func tableViewSectionHeader(_ tableView: UITableView) -> UIView? {
        return header
    }

    public func tableViewSectionHeaderHeight(_ tableView: UITableView) -> CGFloat {
        if header != nil {
            return UITableView.automaticDimension
        }
        return CGFloat.leastNonzeroMagnitude
    }

    public func tableViewSectionFooterHeight(_ tableView: UITableView) -> CGFloat {
        if footer != nil {
            return UITableView.automaticDimension
        }
        return CGFloat.leastNonzeroMagnitude
    }

    public func tableView(_ tableView: UITableView,
                          willDisplayFooterView view: UIView,
                          forSection section: Int) {
        self.willDisplayItem?(.footer)
    }

    public func tableView(_ tableView: UITableView,
                          editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

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

    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return cellBuilders[indexPath.row].canEditRow()
    }

    private func removeFromTableView(_ tableView: UITableView,
                                     at indexPath: IndexPath) -> EditableCellActionFactory.HandlerType {
        return { [weak self] completion in
            guard let self = self else { return }

            self.cellBuilders.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top, completion: completion)
        }
    }
}
