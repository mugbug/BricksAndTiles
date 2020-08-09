//
//  HorizontalListFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory
import ViewCodeHelper

struct HorizontalListFactory {

    var backgroundColor: UIColor = .gray

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
        return availableImages().map(HorizontalCellBuilder.init)
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
