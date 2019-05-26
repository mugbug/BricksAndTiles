//
//  SingleSelectionSection.swift
//  Meu Alelo
//
//  Copyright © 2018 Alelo. All rights reserved.
//

import UIKit

class SingleSelectionSection: TableViewSection {
    private var cellBuilders: [TableViewSelectableCellBuilder]
    private var header: UIView?
    private var footer: UIView?
    private var selectedIndex: Int?
    
    var numberOfRows: Int {
        return cellBuilders.count
    }
    
    init(cellBuilders: [TableViewSelectableCellBuilder],
                header: UIView? = nil,
                footer: UIView? = nil,
                selectedIndex: Int? = nil) {
        
        self.header = header
        self.footer = footer
        self.selectedIndex = selectedIndex
        self.cellBuilders = cellBuilders
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
    
    func tableViewCell(at indexPath: IndexPath,
                              on tableView: UITableView) -> UITableViewCell {
        
        let cell = cellBuilders[indexPath.row].tableViewCell(at: indexPath, on: tableView)
        
        if indexPath.row == selectedIndex {
            cell.makeSelectionVisible()
        } else {
            cell.makeSelectionInvisible()
        }
        
        return cell
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
}
