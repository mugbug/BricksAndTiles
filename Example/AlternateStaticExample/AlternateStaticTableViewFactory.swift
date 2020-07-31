//
//  AlternateStaticTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 27/06/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

class AlternateStaticTableViewFactory: TableViewFactoryProtocol {

    func make() -> [TableViewSection] {
        let section = StaticSection(
            cellBuilders: cellBuilders(),
            header: header()
        )
        return [section]
    }

    func cellBuilders() -> [TableViewCellBuilder] {
        return [
//            FirstStaticCellBuilder(),
//            SecondStaticCellBuilder(),
//            FirstStaticCellBuilder(),
//            FirstStaticCellBuilder(),
//            CollectionViewCellBuilder(),
//            SecondStaticCellBuilder(),
//            CollectionViewCellBuilder(),
//            CollectionViewCellBuilder(),
//            CollectionViewCellBuilder(),
//            CollectionViewCellBuilder(),
//            CollectionViewCellBuilder(),
//            CollectionViewCellBuilder(),
            HorizontalListCellBuilder(),
        ]
    }

    func header() -> UIView {
        let header = UILabel()
        header.text = "This is a section"
        return header
    }
}
