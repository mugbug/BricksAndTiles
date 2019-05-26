//
//  TableViewSelectableCellBuilder.swift
//  Meu Alelo
//
//  Copyright © 2018 Alelo. All rights reserved.
//
       
import UIKit

typealias SelectableCell = UITableViewCell & SelectableTableViewCell

protocol TableViewSelectableCellBuilder {

    var cellHeight: CGFloat { get }
    
    func registerCellIdentifier(in tableView: UITableView)
    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> SelectableCell
    
    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool
    func tableViewDidSelectCell(_ tableView: UITableView)
    
}

extension TableViewSelectableCellBuilder {
    func tableViewDidSelectCell(_ tableView: UITableView) { }
    
    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return true
    }
}
