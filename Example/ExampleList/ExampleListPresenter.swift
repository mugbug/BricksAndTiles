//
//  ExampleListPresenter.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory

class ExampleListPresenter {
    var dataSource: TableViewDataSource?

    func setupDataSource(in tableView: UITableView) {
        self.dataSource = TableViewDataSource(
            sections: ExampleListTableViewFactory(didSelect: { index in
                print("Cell at \(index) selected! Yay!")
            }).make(),
            tableView: tableView
        )
    }
}
