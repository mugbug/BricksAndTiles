//
//  SongsRankingFactoryModel.swift
//  Example
//
//  Created by Pedro M. Zaroni on 14/08/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

struct SongsRankingFactoryModel {
    var topSongs: [Song]
    var songs: [Song]
}

struct Song {
    let name: String
    var isFav: Bool = false

    init(name: String) {
        self.name = name
    }

    init(name: String, isFav: Bool) {
        self.name = name
        self.isFav = isFav
    }
}
