//
//  EditableCellActionFactory.swift
//  TableViewFactory
//
//  Copyright © 2019 Dextra. All rights reserved.
//

import UIKit

public struct EditableCellActionFactory {

    public typealias HandlerType = (@escaping () -> Void) -> Void

    enum ActionType {
        case delete
    }

    let type: EditableCellActionFactory.ActionType
    let style: UITableViewRowAction.Style
    let title: String
    let backgroundColor: UIColor
    let actionCompletion: () -> Void

    public func make(with handler: @escaping HandlerType) -> UITableViewRowAction {
        let action = UITableViewRowAction(style: style, title: title) { _, _ in
            handler(self.actionCompletion)
        }

        action.backgroundColor = backgroundColor
        return action
    }
}
