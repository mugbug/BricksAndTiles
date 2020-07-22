//
//  TableViewArrangeableCellBuilder.swift
//  TableViewFactory
//
//  Copyright © 2019 Dextra. All rights reserved.
//

public protocol TableViewArrangeableCellBuilder: TableViewCellBuilder {
    func canMove() -> Bool
}

public extension TableViewArrangeableCellBuilder {
    func canMove() -> Bool {
        return true
    }
}
