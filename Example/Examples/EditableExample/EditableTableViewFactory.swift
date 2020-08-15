//
//  EditableTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 17/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

struct EditableTableViewFactory: TableViewFactoryProtocol {

    func make() -> [TableViewSection] {
        let section = EditableSection(
            cellBuilders: cellBuilders(),
            header: SimpleHeader(title: "Available Songs"),
            footer: UIView()
        )
        return [section]
    }

    func cellBuilders() -> [TableViewEditableCellBuilder] {
        return (0...5).map { _ in EditableCellBuilder() }
    }
}
