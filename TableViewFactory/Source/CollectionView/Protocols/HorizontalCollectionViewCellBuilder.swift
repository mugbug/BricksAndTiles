//
//  HorizontalCollectionViewCellBuilder.swift
//  TableViewFactory
//
//  Created by Pedro M. Zaroni on 30/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

public protocol HorizontalCollectionViewCellBuilder: CollectionViewCellBuilder {
    var cellWidth: CGFloat { get }
}

public extension HorizontalCollectionViewCellBuilder {
    func cellSize(collectionSize: CGSize) -> CGSize {
        return CGSize(width: cellWidth, height: collectionSize.height)
    }
}
