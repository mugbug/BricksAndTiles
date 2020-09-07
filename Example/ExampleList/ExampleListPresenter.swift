//
//  ExampleListPresenter.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

protocol ExampleListViewDelegate: AnyObject {
    func showExample(forType type: ExampleType, isEditable: Bool)
    func showDraggableExample()
    func showCollectionExample()
    func showFactoryExample()
}

class ExampleListPresenter {

    weak var view: ExampleListViewDelegate?

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
