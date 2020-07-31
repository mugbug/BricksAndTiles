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
        return tableView
    }()

    private let presenter = ExampleListPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        self.view.addSubview(tableView)
        tableView.constraint { view in
            [view.topAnchor.constraint(equalTo: self.view.topAnchor),
             view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
             view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
             view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)]
        }

        presenter.setupDataSource(in: tableView)
    }

    private func showExample(withFactory factory: TableViewFactoryProtocol, isEditable: Bool) {
        let presenter = GenericExamplePresenter(factory: factory)
        let dragableExample = GenericExampleViewController(presenter: presenter)
        dragableExample.toggleEditable(isEditable)
        self.navigationController?.pushViewController(dragableExample, animated: true)
    }
}

extension ExampleListViewController: ExampleListViewDelegate {
    func showCollectionViewExample() {
        let viewController = CollectionViewExampleViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func showDragableExample() {
        let factory = DragableExampleTableViewFactory()
        showExample(withFactory: factory, isEditable: true)
    }

    func showSingleSelectionExample() {
        let factory = SingleSelectionExampleTableViewFactory()
        showExample(withFactory: factory, isEditable: false)
    }

    func showEditableExample() {
        let factory = EditableTableViewFactory()
        showExample(withFactory: factory, isEditable: false)
    }

    func showAlternateStaticExample() {
        let factory = AlternateStaticTableViewFactory()
        showExample(withFactory: factory, isEditable: false)
    }
}
