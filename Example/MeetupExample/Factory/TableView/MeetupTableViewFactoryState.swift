//
//  MeetupTableViewFactoryState.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/09/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

enum MeetupTableViewFactoryState {
    case loading
    case filled(songs: [Song], albums: [Album])
}

extension MeetupTableViewFactoryState {
    static var mockFilled: Self {
        return .filled(
            songs: SongService.availableSongs,
            albums: SongService.availableAlbuns
        )
    }
}
