//
//  EditableCellActionFactory.swift
//  TableViewFactory
//
//  Copyright © 2019 Dextra. All rights reserved.
//

import UIKit

public struct EditableCellActionFactory {

    public typealias HandlerType = (@escaping () -> Void) -> Void

    public enum ActionType {
        case delete
        case custom
    }

    // MARK: - Initialization

    let type: EditableCellActionFactory.ActionType
    private let style: UITableViewRowAction.Style
    private let title: String
    private let backgroundColor: UIColor
    private let actionCompletion: () -> Void

    public init(type: EditableCellActionFactory.ActionType,
                style: UITableViewRowAction.Style,
                title: String,
                backgroundColor: UIColor,
                actionCompletion: @escaping () -> Void) {
        self.type = type
        self.style = style
        self.title = title
        self.backgroundColor = backgroundColor
        self.actionCompletion = actionCompletion
    }

    // MARK: - Factory

    public func make(with handler: @escaping HandlerType) -> UITableViewRowAction {
        let action = UITableViewRowAction(style: style, title: title) { _, _ in
            handler(self.actionCompletion)
        }

        action.backgroundColor = backgroundColor
        return action
    }
}
