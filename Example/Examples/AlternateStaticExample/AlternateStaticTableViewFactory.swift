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
            header: header(),
            footer: UIView()
        )
        return [section]
    }

    func cellBuilders() -> [TableViewCellBuilder] {
        return [
            HorizontalListCellBuilder(),
            FirstStaticCellBuilder(),
            HorizontalListCellBuilder(),
            SecondStaticCellBuilder(),
            FirstStaticCellBuilder(),
            HorizontalListCellBuilder()
        ]
    }

    func header() -> UIView {
        let header = UILabel()
        header.text = "This is a section"
        let view = UIView()
        view.addSubviewWithConstraints(
            subview: header,
            insets: .init(top: 16, left: 16, bottom: -16, right: -16)
        )
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        return view
    }
}
