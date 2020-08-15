//
//  AlternateStaticTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 27/06/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

struct AlternateStaticTableViewFactory: TableViewFactoryProtocol {

    func make() -> [TableViewSection] {
        let section = StaticSection(
            cellBuilders: cellBuilders(),
            header: SimpleHeader(title: "Sit back and relax")
        )
        return [
            horizontalListSection(),
            section,
            horizontalListSection(),
            horizontalListSection()
        ]
    }

    func cellBuilders() -> [TableViewCellBuilder] {
        return [
            SecondStaticCellBuilder(),
            FirstStaticCellBuilder()
        ]
    }

    func horizontalListSection() -> StaticSection {
        return StaticSection(
            cellBuilders: [HorizontalListCellBuilder(),
                           FirstStaticCellBuilder()],
            header: SimpleHeader(title: "Rainy days")
        )
    }
}
