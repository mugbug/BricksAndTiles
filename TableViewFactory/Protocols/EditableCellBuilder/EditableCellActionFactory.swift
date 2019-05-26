//
//  EditableCellActionFactory.swift
//  MeuAlelo
//
//  Copyright © 2019 Alelo. All rights reserved.
//

import UIKit

struct EditableCellActionFactory {

    typealias HandlerType = (@escaping () -> Void) -> Void

    enum ActionType {
        case delete
    }

    let type: EditableCellActionFactory.ActionType
    let style: UITableViewRowAction.Style
    let title: String
    let backgroundColor: UIColor
    let actionCompletion: () -> Void

    func make(with handler: @escaping HandlerType) -> UITableViewRowAction {
        let action = UITableViewRowAction(style: style, title: title) { _, _ in
            handler(self.actionCompletion)
        }

        action.backgroundColor = backgroundColor
        return action
    }
}
