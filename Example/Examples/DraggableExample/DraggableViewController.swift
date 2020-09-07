//
//  DraggableViewController.swift
//  Example
//
//  Created by Pedro M. Zaroni on 15/08/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

import UIKit
import ViewCodeHelper

final class DraggableViewController: UIViewController {

    private lazy var tableView = UITableView.standard()
        .. \.isEditing <- true

    private lazy var presenter = DraggablePresenter(view: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Song Ranking"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.view.addSubviewWithConstraints(subview: tableView)

        presenter.setupDataSource(in: tableView)
    }
}

extension DraggableViewController: DraggableViewDelelgate {
    func reloadTableView() {
        presenter.setupDataSource(in: tableView)
        tableView.reloadData()
    }
}
