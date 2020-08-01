//
//  GenericExamplePresenter.swift
//  Example
//
//  Created by Pedro M. Zaroni on 17/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory

protocol TableViewFactoryProtocol {
    func make() -> [TableViewSection]
}

class GenericExamplePresenter: GenericPresenterProtocol {
    var dataSource: TableViewDataSource?
    private let factory: TableViewFactoryProtocol

    init(factory: TableViewFactoryProtocol) {
        self.factory = factory
    }

    func setupDataSource(in tableView: UITableView) {
        dataSource = TableViewDataSource(
            sections: factory.make(),
            tableView: tableView
        )
    }
}
