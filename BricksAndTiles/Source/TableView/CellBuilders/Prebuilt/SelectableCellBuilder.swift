//
//  SelectableCellBuilder.swift
// BricksAndTiles
//
//  Created by Pedro M. Zaroni on 22/08/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import ViewCodeHelper
import UIKit

public typealias ConfigurableTableCell = UITableViewCell & CellConfigurable

public struct SelectableCellBuilder<CellType: ConfigurableTableCell>: TableViewCellBuilder {
    let model: CellType.ViewModel
    let didSelect: (CellType.ViewModel) -> Void

    public init(model: CellType.ViewModel,
                didSelect: @escaping (CellType.ViewModel) -> Void) {
        self.model = model
        self.didSelect = didSelect
    }

    public var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }

    public func registerCellIdentifier(in tableView: UITableView) {
        tableView.register(CellType.self)
    }

    public func tableViewCell(at indexPath: IndexPath, on tableView: UITableView) -> UITableViewCell {
        let cell: CellType = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: model)
        return cell
    }

    public func tableViewShouldSelectCell(_ tableView: UITableView) -> Bool {
        return true
    }

    public func tableViewDidSelectCell(_ tableView: UITableView) {
        didSelect(model)
    }
}
