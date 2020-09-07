//
//  ExampleListPresenter.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import BricksAndTiles

protocol ExampleListViewDelegate: AnyObject {
    func showExample(forType type: ExampleType, isEditable: Bool)
    func showDraggableExample()
    func showCollectionExample()
}

class ExampleListPresenter {

    var dataSource: TableViewDataSource?

    weak var view: ExampleListViewDelegate?

    func setupDataSource(in tableView: UITableView) {
        self.dataSource = TableViewDataSource(
            sections: ExampleListTableViewFactory(didSelect: { [weak self] type in
                self?.showExample(for: type)
            }).make(),
            tableView: tableView
        )
    }

    private func showExample(for type: ExampleType) {
        switch type {
        case .draggable:
            view?.showDraggableExample()
        case .collectionView:
            view?.showCollectionExample()
        default:
            view?.showExample(forType: type, isEditable: false)
        }
    }
}

extension ExampleType {
    func tableFactory() -> TableViewFactoryProtocol? {
        switch self {
        case .singleSelection:
            return SingleSelectionExampleTableViewFactory()
        case .editable:
            return EditableTableViewFactory()
        case .horizontalList:
            return AlternateStaticTableViewFactory()
        default:
            return nil
        }
    }
}
