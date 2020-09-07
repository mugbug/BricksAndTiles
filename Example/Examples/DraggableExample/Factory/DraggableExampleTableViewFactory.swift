//
//  DraggableExampleTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

import UIKit
import BricksAndTiles

struct DragableExampleTableViewFactory: TableViewFactoryProtocol {
    typealias MoveRowCompletion = (
        _ sourceIndexPath: IndexPath,
        _ destinationIndexPath: IndexPath
    ) -> Void

    var model: SongsRankingFactoryModel
    var moveRowCompletion: MoveRowCompletion

    func make() -> [TableViewSection] {
        let section = ArrangeableSection(
            cellBuilders: cellBuilders(songs: model.topSongs),
            header: SimpleHeader(title: "My Top Songs"),
            footer: UIView(),
            moveRowCompletion: moveRowCompletion
        )
        let section1 = ArrangeableSection(
            cellBuilders: cellBuilders(songs: model.songs),
            header: SimpleHeader(title: "My Songs"),
            footer: UIView(),
            moveRowCompletion: moveRowCompletion
        )
        return [section, section1]
    }

    func cellBuilders(songs: [Song]) -> [TableViewArrangeableCellBuilder] {
        return songs.map(DragableExampleCellBuilder.init)
    }
}
