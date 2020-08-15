//
//  EditableTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 17/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

struct EditableTableViewFactory: TableViewFactoryProtocol {

    let availableSongs = SongService.availableSongs

    func make() -> [TableViewSection] {
        let section = EditableSection(
            cellBuilders: cellBuilders(),
            footer: UIView()
        )
        return [section]
    }

    func cellBuilders() -> [TableViewEditableCellBuilder] {
        return availableSongs.map(EditableCellBuilder.init)
    }
}
