//
//  HorizontalCollectionViewCellBuilder.swift
//  BricksAndTiles
//
//  Created by Pedro M. Zaroni on 30/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

public protocol HorizontalCollectionViewCellBuilder: CollectionViewCellBuilder {
    var cellWidth: CGFloat { get }
}

public extension HorizontalCollectionViewCellBuilder {
    func cellSize(collectionSize: CGSize) -> CGSize {
        return CGSize(width: cellWidth, height: collectionSize.height)
    }
}
