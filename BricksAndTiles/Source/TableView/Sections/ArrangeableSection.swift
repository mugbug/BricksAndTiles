//
//  ArrangeableSection.swift
//  BricksAndTiles
//
//  Copyright © 2019 Dextra. All rights reserved.
//

import UIKit

public class ArrangeableSection: TableViewSection {

    private var cellBuilders: [TableViewArrangeableCellBuilder]
    private var header: UIView?
    private var footer: UIView?

    private var willDisplayItem: DisplayItemBlockType?

    public typealias MoveRowCompletion = (_ sourceIndexPath: IndexPath, _ destinationIndexPath: IndexPath) -> Void
    private var moveRowCompletion: MoveRowCompletion

    public var numberOfRows: Int {
        return cellBuilders.count
    }

    public init(cellBuilders: [TableViewArrangeableCellBuilder],
                header: UIView? = nil,
                footer: UIView? = nil,
                willDisplayItem: DisplayItemBlockType? = nil,
                moveRowCompletion: @escaping MoveRowCompletion) {
        self.header = header
        self.footer = footer
        self.cellBuilders = cellBuilders
        self.willDisplayItem = willDisplayItem
        self.moveRowCompletion = moveRowCompletion
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
                          canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return cellBuilders[indexPath.row].canMove()
    }

    public func tableView(_ tableView: UITableView,
                          moveRowAt sourceIndexPath: IndexPath,
                          to destinationIndexPath: IndexPath) {
        moveRowCompletion(sourceIndexPath, destinationIndexPath)
    }
}
