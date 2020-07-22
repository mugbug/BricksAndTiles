//
//  TableViewItem.swift
//  TableViewFactory
//
//  Copyright © 2019 Dextra. All rights reserved.
//

import Foundation

public typealias DisplayItemBlockType = (TableViewItem) -> Void

public enum TableViewItem {
    case cell
    case footer
    case header
}
