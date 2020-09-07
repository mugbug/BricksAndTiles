//
//  MeetupTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/09/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

import BricksAndTiles

struct MeetupTableViewFactory {
    var state: MeetupTableViewFactoryState

    func make() -> [TableViewSection] {
        switch state {
        case .loading:
            return loadingSections()
        case let .filled(songs, albums):
            return sections(songs: songs, albums: albums)
        }
    }

    // MARK: - Loading

    private func loadingSections() -> [TableViewSection] {
        let section = StaticSection(
            cellBuilders: loadingCellBuilders(),
            header: SimpleHeader(title: "Loading...")
        )
        return [section]
    }

    private func loadingCellBuilders() -> [TableViewCellBuilder] {
        (0...5).map { _ in MeetupSongCellBuilder(model: .init(name: "Loading..."))}
    }

    // MARK: - Filled

    private func sections(songs: [Song], albums: [Album]) -> [TableViewSection] {
        let songBuilders = songCellBuilders(songs)
        let albumBuilders = albumCellBuilders(albums)

        let firstSection = StaticSection(
            cellBuilders: songBuilders,
            header: SimpleHeader(title: "Songs")
        )

        let secondSection = StaticSection(
            cellBuilders: albumBuilders,
            header: SimpleHeader(title: "Albums")
        )

        let mergedSection = StaticSection(
            cellBuilders: songBuilders + albumBuilders,
            header: SimpleHeader(title: "All")
        )

        return [firstSection, secondSection, mergedSection]
    }

    private func songCellBuilders(_ models: [Song]) -> [TableViewCellBuilder] {
        models.map(MeetupSongCellBuilder.init)
    }

    private func albumCellBuilders(_ models: [Album]) -> [TableViewCellBuilder] {
        models.map(MeetupAlbumCellBuilder.init)
    }
}
