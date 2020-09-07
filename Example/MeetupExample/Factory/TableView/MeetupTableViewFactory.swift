//
//  MeetupTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/09/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import BricksAndTiles

struct MeetupTableViewFactory {
    typealias Models = MeetupTableViewFactoryState.Models
    var state: MeetupTableViewFactoryState

    func make() -> [TableViewSection] {
        switch state {
        case .loading:
            return loadingSections()
        case let .filled(models):
            return sections(for: models)
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

    private func sections(for models: Models) -> [TableViewSection] {
        let songBuilders = songCellBuilders(models.songs)
        let albumBuilders = albumCellBuilders(models.albums)

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
