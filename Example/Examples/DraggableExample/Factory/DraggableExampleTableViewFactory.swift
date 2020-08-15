//
//  DraggableExampleTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

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
            header: header(title: "My Top Songs"),
            footer: UIView(),
            moveRowCompletion: moveRowCompletion
        )
        let section1 = ArrangeableSection(
            cellBuilders: cellBuilders(songs: model.songs),
            header: header(title: "My Songs"),
            footer: UIView(),
            moveRowCompletion: moveRowCompletion
        )
        return [section, section1]
    }

    func cellBuilders(songs: [Song]) -> [TableViewArrangeableCellBuilder] {
        return songs.map { song in
            DragableExampleCellBuilder(model: "\(song.name)")
        }
    }

    func header(title: String) -> UIView {
        let header = UILabel()
        header.font = .preferredFont(forTextStyle: .title2)
        header.text = title

        let view = UIView()
        view.addSubviewWithConstraints(subview: header, insets: .init(all: 16))
        return view
    }
}
