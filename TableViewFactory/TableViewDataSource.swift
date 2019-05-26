//
//  TableViewDataSource.swift
//  Meu Alelo
//
//  Copyright © 2018 Alelo. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject {
    
    private var sections: [TableViewSection] = []
    
    init(sections: [TableViewSection], tableView: UITableView) {
        self.sections = sections
        
        super.init()
        
        tableView.dataSource = self
        tableView.delegate = self
        registerCells(in: tableView)
        
    }
    
    private func registerCells(in tableView: UITableView) {
        for section in sections {
            section.registerCells(in: tableView)
        }
    }
    
    private func section(at indexPath: IndexPath) -> TableViewSection {
        return sections[indexPath.section]
    }
    
    func insertSection(section: TableViewSection) {
        self.sections.append(section)
    }
}

extension TableViewDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].numberOfRows
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = self.section(at: indexPath)
        return section.tableViewCell(at: indexPath, on: tableView)
    }
}

extension TableViewDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let size = self.section(at: indexPath).cellHeight(forCellAt: indexPath, on: tableView)
        
        return size
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return section(at: indexPath).tableViewCell(tableView, shouldSelectCellAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        section(at: indexPath).tableViewCell(tableView, didSelectCellAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if !section(at: indexPath).tableViewCell(tableView, shouldSelectCellAt: indexPath) {
            return nil
        }
        
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return sections[section].tableViewSectionFooter(tableView)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sections[section].tableViewSectionHeader(tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sections[section].tableViewSectionFooterHeight(tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sections[section].tableViewSectionHeaderHeight(tableView)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        section(at: indexPath).tableView(tableView, willDisplay: cell, forRowAt: indexPath)
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        sections[section].tableView(tableView, willDisplayHeaderView:view ,forSection: section)
    }

    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        sections[section].tableView(tableView, willDisplayFooterView: view, forSection: section)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return section(at: indexPath).tableView(tableView, canMoveRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        return section(at: sourceIndexPath).tableView(tableView, moveRowAt: sourceIndexPath, to: destinationIndexPath)
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return section(at: indexPath).tableView(tableView, editActionsForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return section(at: indexPath).tableView(tableView, canEditRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return section(at: indexPath).tableView(tableView, editingStyleForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return section(at: indexPath).tableView(tableView, shouldIndentWhileEditingRowAt: indexPath)
    }
}
