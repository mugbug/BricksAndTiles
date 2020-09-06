//
//  SongService.swift
//  Example
//
//  Created by Pedro M. Zaroni on 15/08/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

enum SongService {
    static let availableSongs = [
        "Strawberry Fields Forever",
        "The End",
        "Hey You",
        "Losing My Religion",
        "Breathe (In The Air)"
//        "Us and Them",
//        "Happiness is a Warm Gun",
//        "Across The Universe",
//        "People Are Strange",
//        "Shiny Happy People",
    ].map(Song.init)

    static let availableAlbuns = [
        ("The Dark Side of the Moon", "Pink Floyd"),
//        ("The Doors", "The Doors"),
        ("The Beatles (White Album)", "The Beatles"),
//        ("Let It Be", "The Beatles"),
        ("Out Of Time", "R.E.M."),
        ("Strange Days", "The Doors")
//        ("The Wall", "Pink Floyd")
    ].map(Album.init)
}
