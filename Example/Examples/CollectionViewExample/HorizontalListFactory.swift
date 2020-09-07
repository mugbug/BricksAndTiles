//
//  HorizontalListFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/07/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

import UIKit
import BricksAndTiles
import ViewCodeHelper

struct HorizontalListFactory {

    var cellSize: (CGSize) -> CGSize

    func make() -> [CollectionViewSection] {
        let section = StaticCollectionSection(
            cellBuilders: cellBuilders()
        )
        let section2 = StaticCollectionSection(
            cellBuilders: cellBuilders()
        )
        return [section, section2]
    }

    func cellBuilders() -> [CollectionViewCellBuilder] {
        return availableImages().map {
            HorizontalCellBuilder(imageName: $0, cellSize: cellSize)

        }
    }

    private func availableImages() -> [String] {
        return [
            "iron-wine",
            "lumineers",
            "pink-floyd",
            "lumineers-2",
            "cage",
            "iron-wine-2",
            "ff"
        ]
    }
}
