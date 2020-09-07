//
//  SingleSelectionTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 17/05/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

import UIKit
import BricksAndTiles

struct SingleSelectionExampleTableViewFactory: TableViewFactoryProtocol {

    let availableSongs = SongService.availableSongs

    func make() -> [TableViewSection] {
        let section = SingleSelectionSection(
            cellBuilders: cellBuilders(),
            header: SimpleHeader(title: "How is your mood today?"),
            footer: UIView()
        )
        return [section]
    }

    func cellBuilders() -> [TableViewSelectableCellBuilder] {
        return availableSongs.map(SingleSelectionCellBuilder.init)
    }
}
