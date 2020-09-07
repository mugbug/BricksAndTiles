//
//  MeetupFactoryViewController.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/09/20.
//

import UIKit
import BricksAndTiles

final class MeetupFactoryViewController: UIViewController {

    private lazy var tableView = UITableView.standard()
    private var dataSource: TableViewDataSource? {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        setupDataSource(with: .loading)
        fetchData()
    }

    func setupDataSource(with state: MeetupTableViewFactoryState) {
        let factory = MeetupTableViewFactory(state: state)
        self.dataSource = TableViewDataSource(
            sections: factory.make(),
            tableView: tableView
        )
    }

    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.setupDataSource(with: .mockFilled)
        }
    }
}

extension MeetupFactoryViewController {
    private func setupView() {
        title = "My List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
}
