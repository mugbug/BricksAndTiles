//
//  TableViewArrangeableCellBuilder.swift
//  MeuAlelo
//
//  Copyright © 2019 Alelo. All rights reserved.
//

protocol TableViewArrangeableCellBuilder: TableViewCellBuilder {
    func canMove() -> Bool
}

extension TableViewArrangeableCellBuilder {
    func canMove() -> Bool {
        return true
    }
}
