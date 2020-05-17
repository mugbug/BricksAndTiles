//
//  SingleSelectionTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 17/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

class SingleSelectionExampleTableViewFactory {

    func make() -> [TableViewSection] {
        let section = SingleSelectionSection(
            cellBuilders: cellBuilders(),
            header: header()
        )
        return [section]
    }

    func cellBuilders() -> [TableViewSelectableCellBuilder] {
        return (0...5).map { _ in SingleSelectionCellBuilder() }
    }

    func header() -> UIView {
        let header = UILabel()
        header.text = "This is a section"
        return header
    }
}
