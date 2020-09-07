//
//  TableViewItem.swift
//  BricksAndTiles
//
//  Copyright © 2019 mugbug. All rights reserved.
//

import Foundation

public typealias DisplayItemBlockType = (TableViewItem) -> Void

public enum TableViewItem {
    case cell
    case footer
    case header
}
