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
            header: header()
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
            header: header()
        )
    }

    func header() -> UIView {
        let header = UILabel()
        header.text = "This is a section"
        header.font = .preferredFont(forTextStyle: .title1)
        header.textColor = .white
        let view = UIView()
        view.addSubviewWithConstraints(
            subview: header,
            insets: .init(top: 16, left: 16, bottom: -16, right: -16)
        )
        view.backgroundColor = .darkGray
        return view
    }
}
