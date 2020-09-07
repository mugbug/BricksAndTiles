//
//  ExampleListTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import BricksAndTiles

struct ExampleListTableViewFactory {
    typealias ViewModel = ExampleNameTableViewCell.ViewModel
    typealias SelectedExample = (ViewModel) -> Void

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
        return ViewModel.allCases.map { type in
            SelectableCellBuilder<ExampleNameTableViewCell>(
                model: type, didSelect: didSelect
            )
        }
    }
}
