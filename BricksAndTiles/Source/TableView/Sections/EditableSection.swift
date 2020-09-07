//
//  EditableSection.swift
//  BricksAndTiles
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

    public init(cellBuilders: [TableViewEditableCellBuilder],
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

    private func row(at indexPath: IndexPath) -> TableViewEditableCellBuilder {
        return cellBuilders[indexPath.row]
    }

    public func cellHeight(forCellAt indexPath: IndexPath,
                           on tableView: UITableView) -> CGFloat {
        return row(at: indexPath).cellHeight
    }

    public func tableViewCell(_ tableView: UITableView,
                              shouldSelectCellAt indexPath: IndexPath) -> Bool {
        return row(at: indexPath).tableViewShouldSelectCell(tableView)
    }

    public func tableViewCell(_ tableView: UITableView,
                              didSelectCellAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        return row(at: indexPath).tableViewDidSelectCell(tableView)
    }

    public func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {

        return row(at: indexPath).tableViewCell(at: indexPath, on: tableView)
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
                          leadingActionsForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let cellActionFactories = row(at: indexPath).cellLeadingActions(tableView, at: indexPath)

        return makeSwipeConfiguration(
            with: cellActionFactories,
            at: indexPath,
            on: tableView
        )
    }

    public func tableView(_ tableView: UITableView,
                          trailingActionsForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let cellActionFactories = row(at: indexPath).cellTrailingActions(tableView, at: indexPath)

        return makeSwipeConfiguration(
            with: cellActionFactories,
            at: indexPath,
            on: tableView
        )
    }

    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return row(at: indexPath).canEditRow()
    }
}

private extension EditableSection {
    func makeSwipeConfiguration(with factories: [EditableCellActionFactory],
                                at indexPath: IndexPath,
                                on tableView: UITableView) -> UISwipeActionsConfiguration {
        let actions = factories.map { factory in
            self.makeAction(
                with: factory,
                at: indexPath,
                on: tableView
            )
        }
        return UISwipeActionsConfiguration(actions: actions)
    }

    func makeAction(with factory: EditableCellActionFactory,
                    at indexPath: IndexPath,
                    on tableView: UITableView) -> UIContextualAction {
        var handler: EditableCellActionFactory.HandlerType
        switch factory.type {
        case .delete:
            handler = removeFromTableView(tableView, at: indexPath)
        case .custom:
            handler = { $0() }
        }
        let action = factory.make(with: handler)
        return action
    }

    func removeFromTableView(_ tableView: UITableView,
                             at indexPath: IndexPath) -> EditableCellActionFactory.HandlerType {
        return { [weak self] completion in
            guard let self = self else { return }

            self.cellBuilders.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top, completion: completion)
        }
    }
}
