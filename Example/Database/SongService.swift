//
//  SongService.swift
//  Example
//
//  Created by Pedro M. Zaroni on 15/08/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

enum SongService {
    static let availableSongs =  [
        "Strawberry Fields Forever",
        "The End",
        "Hey You",
        "Breathe (In The Air)",
        "Us and Them",
        "Happiness is a Warm Gun",
        "Across The Universe",
        "People Are Strange",
        "Shine On Happy Peoplle",
        "Losing My Religion"
    ].map(Song.init)
}
