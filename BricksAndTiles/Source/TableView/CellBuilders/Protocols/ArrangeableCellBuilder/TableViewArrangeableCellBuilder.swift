//
//  TableViewArrangeableCellBuilder.swift
//  BricksAndTiles
//
//  Copyright © 2019 mugbug. All rights reserved.
//

public protocol TableViewArrangeableCellBuilder: TableViewCellBuilder {
    func canMove() -> Bool
}

public extension TableViewArrangeableCellBuilder {
    func canMove() -> Bool {
        return true
    }
}
