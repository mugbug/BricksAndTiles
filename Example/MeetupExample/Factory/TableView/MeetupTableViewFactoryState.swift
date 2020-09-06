//
//  MeetupTableViewFactoryState.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/09/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

enum MeetupTableViewFactoryState {
    typealias Models = (
        songs: [Song],
        albums: [Album]
    )

    case loading
    case filled(models: Models)
}

extension MeetupTableViewFactoryState {
    static var mockFilled: Self {
        let models = (SongService.availableSongs, SongService.availableAlbuns)
        return .filled(models: models)
    }
}
