//
//  ExampleListTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

class ExampleListTableViewFactory {
    private let didSelect: (Int) -> Void

    init(didSelect: @escaping (Int) -> Void) {
        self.didSelect = didSelect
    }

    func make() -> [TableViewSection] {
        let section = StaticSection(
            cellBuilders: cellBuilders(),
            header: header()
        )
        return [section]
    }

    func cellBuilders() -> [TableViewCellBuilder] {
        return (0...5).map { index in
            SelectableCellBuilder {
                self.didSelect(index)
            }
        }
    }

    func header() -> UIView {
        let header = UILabel()
        header.text = "Examples"
        return header
    }
}
