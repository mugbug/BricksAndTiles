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
        let isEditable = type == .dragable
        view?.showExample(forType: type, isEditable: isEditable)
    }
}

extension ExampleType {
    func tableFactory() -> TableViewFactoryProtocol {
        switch self {
        case .dragable:
            return DragableExampleTableViewFactory()
        case .singleSelection:
            return SingleSelectionExampleTableViewFactory()
        case .editable:
            return EditableTableViewFactory()
        case .alternateStatic:
            return AlternateStaticTableViewFactory()
        }
    }
}
