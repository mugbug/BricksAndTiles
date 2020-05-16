//
//  DragableExamplePresenter.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory

class DragableExamplePresenter {
    var dataSource: TableViewDataSource?

    func setupDataSource(in tableView: UITableView) {
        self.dataSource = TableViewDataSource(
            sections: DragableExampleTableViewFactory().make(),
            tableView: tableView
        )
    }
}
