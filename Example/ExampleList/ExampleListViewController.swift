//
//  ExampleListViewController.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

final class ExampleListViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 40
        tableView.backgroundColor = .white
//        tableView.isEditing = true
        return tableView
    }()

    private let presenter = ExampleListPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(tableView)
        tableView.constraint { view in
            [view.topAnchor.constraint(equalTo: self.view.topAnchor),
             view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
             view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
             view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),]
        }

        presenter.setupDataSource(in: tableView)
    }
}
