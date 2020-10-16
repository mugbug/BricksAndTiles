//
//  GridListFactory.swift
//  Example
//
//  Created by Tulio Bazan on 24/09/20.
//  Copyright © 2020 TucoBZ. All rights reserved.
//

import UIKit
import BricksAndTiles
import PaintAndBrush

struct GridListFactory {

    var cellSize: (CGSize) -> CGSize

    var sectionInsets: UIEdgeInsets = UIEdgeInsets(top: 8.0,
                                                   left: 8.0,
                                                   bottom: 8.0,
                                                   right: 8.0)

    func make() -> [CollectionViewSection] {
        let section = GridCollectionSection(
            cellBuilders: cellBuilders(),
            numberOfItemsPerRow: 2,
            sectionInsets: sectionInsets,
            spacingBetweenItems: (horizontal: 8.0, vertical: 8.0)
        )
        let section2 = GridCollectionSection(
            cellBuilders: cellBuilders(),
            numberOfItemsPerRow: 3,
            sectionInsets: sectionInsets,
            spacingBetweenItems: (horizontal: 8.0, vertical: 8.0)
        )
        let section3 = GridCollectionSection(
            cellBuilders: cellBuilders(),
            numberOfItemsPerRow: 1,
            sectionInsets: sectionInsets,
            spacingBetweenItems: (horizontal: 8.0, vertical: 8.0)
        )
        return [section, section2, section3]
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
