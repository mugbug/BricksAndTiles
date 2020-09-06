//
//  MeetupSongCellBuilder.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/09/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory
import ViewCodeHelper

struct MeetupSongCellBuilder: TableViewCellBuilder {

    var model: MeetupFirstModel

    var cellHeight: CGFloat {
        UITableView.automaticDimension
    }

    func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(MeetupFirstCell.self)
    }

    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {
        let cell: MeetupFirstCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: model)
        return cell
    }

    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return false
    }
}
