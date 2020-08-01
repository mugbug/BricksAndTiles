//
//  EditableTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 17/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

class EditableTableViewFactory: TableViewFactoryProtocol {

    func make() -> [TableViewSection] {
        let section = EditableSection(
            cellBuilders: cellBuilders(),
            header: header()
        )
        return [section]
    }

    func cellBuilders() -> [TableViewEditableCellBuilder] {
        return (0...5).map { _ in EditableCellBuilder() }
    }

    func header() -> UIView {
        let header = UILabel()
        header.text = "This is a section"
        return header
    }
}
