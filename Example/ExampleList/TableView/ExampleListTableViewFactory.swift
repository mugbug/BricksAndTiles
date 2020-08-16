//
//  ExampleListTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

struct ExampleListTableViewFactory {
    typealias SelectedExample = (ExampleType) -> Void

    var didSelect: SelectedExample

    func make() -> [TableViewSection] {
        let section = StaticSection(
            cellBuilders: cellBuilders(),
            header: SimpleHeader(title: "Examples"),
            footer: UIView()
        )
        return [section]
    }

    func cellBuilders() -> [TableViewCellBuilder] {
        return ExampleType.allCases.map { type in
            SelectableCellBuilder(model: type, didSelect: didSelect)
        }
    }
}
