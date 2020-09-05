//
//  ExampleListViewController.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory

final class ExampleListViewController: UIViewController {

    private lazy var tableView = UITableView.standard()

    private let presenter = ExampleListPresenter()
    private var dataSource: TableViewDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        title = "TableViewFactory"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        self.view.addSubviewWithConstraints(subview: tableView)

        presenter.setupDataSource(in: tableView)
    }

    func setupDataSource() {
        let factory = ExampleListTableViewFactory(
            didSelect: { [weak self] type in
                self?.presenter.showExample(for: type)
            }, didSelectMeetupExample: { [weak self] type in
                self?.presenter.showMeetupExample(for: type)
            }
        )
        self.dataSource = TableViewDataSource(
            sections: factory.make(),
            tableView: tableView
        )
    }
}

extension ExampleListViewController: ExampleListViewDelegate {
    func showExample(forType type: ExampleType, isEditable: Bool) {
        guard type.tableFactory() != nil else { return }
        let presenter = GenericExamplePresenter(type: type)
        let view = GenericExampleViewController(presenter: presenter)
        view.toggleEditable(isEditable)
        self.navigationController?.pushViewController(view, animated: true)
    }

    func showDraggableExample() {
        let view = DraggableViewController()
        self.navigationController?.pushViewController(view, animated: true)
    }

    func showCollectionExample() {
        let view = CollectionViewExampleViewController()
        self.navigationController?.pushViewController(view, animated: true)
    }

    func showRegularExample() {

    }

    func showFactoryExample() {

    }
}
