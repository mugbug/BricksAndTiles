//
//  FirstStaticCellBuilder.swift
//  Example
//
//  Created by Pedro M. Zaroni on 27/06/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import BricksAndTiles

struct FirstStaticCellBuilder: TableViewCellBuilder {
    func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(FirstStaticCell.self)
    }

    func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {
        let cell: FirstStaticCell = tableView.dequeueReusableCell(for: indexPath)
        return cell
    }

    func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        true
    }

    var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }

    func tableViewDidSelectCell(_ tableView: UITableView) {
        print("did select cell")
    }
}
