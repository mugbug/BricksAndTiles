//
//  SingleSectionExamplePresenter.swift
//  Example
//
//  Created by Pedro M. Zaroni on 17/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory

class SingleSelectionExamplePresenter: GenericPresenterProtocol {
    var dataSource: TableViewDataSource?

    func setupDataSource(in tableView: UITableView) {
        self.dataSource = TableViewDataSource(
            sections: SingleSelectionExampleTableViewFactory().make(),
            tableView: tableView
        )
    }
}
