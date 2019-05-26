//
//  SingleSelectionSection.swift
//  TableViewFactory
//
//  Copyright © 2019 Dextra. All rights reserved.
//

import UIKit

public class SingleSelectionSection: TableViewSection {
    private var cellBuilders: [TableViewSelectableCellBuilder]
    private var header: UIView?
    private var footer: UIView?
    private var selectedIndex: Int?
    
    public var numberOfRows: Int {
        return cellBuilders.count
    }
    
    public init(cellBuilders: [TableViewSelectableCellBuilder],
                header: UIView? = nil,
                footer: UIView? = nil,
                selectedIndex: Int? = nil) {
        
        self.header = header
        self.footer = footer
        self.selectedIndex = selectedIndex
        self.cellBuilders = cellBuilders
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
        
        guard indexPath.row != selectedIndex else {
            return
        }
        
        if let cell = tableView.cellForRow(at: indexPath) as? SelectableCell {
            cell.makeSelectionVisible()
        }
        
        if let selectedIndex = selectedIndex {
            let indexPath = IndexPath(row: selectedIndex, section: indexPath.section)
            if let cell = tableView.cellForRow(at: indexPath) as? SelectableCell {
                cell.makeSelectionInvisible()
            }
        }
        
        selectedIndex = indexPath.row
        
        return cellBuilders[indexPath.row].tableViewDidSelectCell(tableView)
    }
    
    public func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {
        
        let cell = cellBuilders[indexPath.row].tableViewCell(at: indexPath, on: tableView)
        
        if indexPath.row == selectedIndex {
            cell.makeSelectionVisible()
        } else {
            cell.makeSelectionInvisible()
        }
        
        return cell
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
}
