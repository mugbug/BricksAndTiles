//
//  AlternateStaticTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 27/06/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

import UIKit
import ViewCodeHelper
import BricksAndTiles

extension UIEdgeInsets: Builder {}

struct AlternateStaticTableViewFactory: TableViewFactoryProtocol {

    func make() -> [TableViewSection] {
        return [
            section(title: "The best indie albums of the 2000s",
                    builder: HorizontalListCellBuilder()),
            section(title: "Chill",
                    builder: HorizontalListCellBuilder()),
            section(title: "Indie's indispensables",
                    builder: FirstStaticCellBuilder()),
            section(title: "Throwback",
                    builder: HorizontalListCellBuilder())
        ]
    }

    func section(title: String, builder: TableViewCellBuilder) -> TableViewSection {
        StaticSection(
            cellBuilders: [builder],
            header: header(title: title)
        )
    }

    func header(title: String) -> UIView {
        SimpleHeader(
            title: title,
            textStyle: .largeTitle,
            insets: .init(all: 16)
                .. \.top <- 30
        )
    }
}
