//
//  ExampleListViewController.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

final class ExampleListViewController: UIViewController {

    private lazy var tableView = UITableView.standard()

    private let presenter = ExampleListPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        self.view.addSubviewWithConstraints(subview: tableView)

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
