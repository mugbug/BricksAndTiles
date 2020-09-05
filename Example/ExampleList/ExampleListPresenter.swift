//
//  ExampleListPresenter.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory

protocol ExampleListViewDelegate: AnyObject {
    func showExample(forType type: ExampleType, isEditable: Bool)
    func showDraggableExample()
    func showCollectionExample()
    func showRegularExample()
    func showFactoryExample()
}

class ExampleListPresenter {

    var dataSource: TableViewDataSource?

    weak var view: ExampleListViewDelegate?

    func setupDataSource(in tableView: UITableView) {
        let factory = ExampleListTableViewFactory(
            didSelect: { [weak self] type in
                self?.showExample(for: type)
            }, didSelectMeetupExample: { [weak self] type in
                self?.showMeetupExample(for: type)
            }
        )
        self.dataSource = TableViewDataSource(
            sections: factory.make(),
            tableView: tableView
        )
    }

    func showExample(for type: ExampleType) {
        switch type {
        case .draggable:
            view?.showDraggableExample()
        case .collectionView:
            view?.showCollectionExample()
        default:
            view?.showExample(forType: type, isEditable: false)
        }
    }

    func showMeetupExample(for type: MeetupExampleType) {
        switch type {
        case .regular:
            view?.showRegularExample()
        case .factory:
            view?.showFactoryExample()
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
