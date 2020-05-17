//
//  DragableExampleTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

class DragableExampleTableViewFactory {

    func make() -> [TableViewSection] {
        let section = ArrangeableSection(
            cellBuilders: cellBuilders(),
            header: header(),
            moveRowCompletion: { _, _ in }
        )
        return [section]
    }

    func cellBuilders() -> [TableViewArrangeableCellBuilder] {
        return (0...5).map { _ in DragableExampleCellBuilder() }
    }

    func header() -> UIView {
        let header = UILabel()
        header.text = "This is a section"
        return header
    }
}
