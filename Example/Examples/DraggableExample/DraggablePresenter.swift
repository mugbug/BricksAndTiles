//
//  DraggablePresenter.swift
//  Example
//
//  Created by Pedro M. Zaroni on 15/08/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory

protocol DraggableViewDelelgate: AnyObject {
    func reloadTableView()
}

class DraggablePresenter {
    private var factoryModel: SongsRankingFactoryModel {
        didSet {
            view?.reloadTableView()
        }
    }

    var dataSource: TableViewDataSource?
    weak var view: DraggableViewDelelgate?

    init(view: DraggableViewDelelgate) {
        self.view = view
        factoryModel = SongsRankingFactoryModel(
            topSongs: [],
            songs: [
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
        )
    }

//    weak var view: ExampleListViewDelegate?

    func setupDataSource(in tableView: UITableView) {
        self.dataSource = TableViewDataSource(
            sections: DragableExampleTableViewFactory(
                model: factoryModel,
                moveRowCompletion: moveRowCompletion(_:_:)
            ).make(),
            tableView: tableView
        )
    }

    func moveRowCompletion(_ sourceIndexPath: IndexPath,
                           _ destinationIndexPath: IndexPath) {
        var table = [factoryModel.topSongs, factoryModel.songs]
        let mySong = table[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        table[destinationIndexPath.section].insert(mySong, at: destinationIndexPath.row)
        factoryModel = SongsRankingFactoryModel(topSongs: table[0], songs: table[1])
    }
}
