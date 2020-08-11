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

    private let didSelect: SelectedExample

    init(didSelect: @escaping SelectedExample) {
        self.didSelect = didSelect
    }

    func make() -> [TableViewSection] {
        let section = StaticSection(
            cellBuilders: cellBuilders(),
            header: header(),
            footer: UIView()
        )
        return [section]
    }

    func cellBuilders() -> [TableViewCellBuilder] {
        return ExampleType.allCases.map { type in
            SelectableCellBuilder(type: type) {
                self.didSelect(type)
            }
        }
    }

    func header() -> UIView {
        let header = UILabel()
        header.text = "Examples"
        return header
    }
}
