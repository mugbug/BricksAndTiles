//
//  GridCollectionSection.swift
//  BricksAndTiles
//
//  Created by Tulio Bazan on 24/09/20.
//  Copyright © 2020 TucoBZ. All rights reserved.
//

import UIKit

public final class GridCollectionSection: CollectionViewSection {

    public let spacingBetweenItems: ItemSpacing
    public let sectionInsets: UIEdgeInsets

    private let numberOfItemsPerRow: UInt
    private var cellBuilders: [CollectionViewCellBuilder]

    public init(cellBuilders: [CollectionViewCellBuilder],
                numberOfItemsPerRow: UInt,
                sectionInsets: UIEdgeInsets,
                spacingBetweenItems: ItemSpacing) {
        self.cellBuilders = cellBuilders
        self.numberOfItemsPerRow = numberOfItemsPerRow
        self.sectionInsets = sectionInsets
        self.spacingBetweenItems = spacingBetweenItems
    }

    public var numberOfItems: Int {
        return cellBuilders.count
    }

    private func row(at indexPath: IndexPath) -> CollectionViewCellBuilder {
        return cellBuilders[indexPath.row]
    }

    public func registerCells(in collectionView: UICollectionView) {
        for builder in cellBuilders {
            builder.registerCellIdentifier(in: collectionView)
        }
    }

    public func collectionViewCell(at indexPath: IndexPath,
                                   on collectionView: UICollectionView) -> UICollectionViewCell {
        return self.row(at: indexPath).collectionViewCell(at: indexPath, on: collectionView)
    }

    public func viewForSupplementaryElement(kind: String,
                                            at indexPath: IndexPath,
                                            on collectionView: UICollectionView) -> UICollectionReusableView {
        let row = self.row(at: indexPath)
        return row.collectionViewSupplementaryView(
            kind: kind,
            at: indexPath,
            on: collectionView
        )
    }

    public func sizeForItem(at indexPath: IndexPath,
                            on collectionView: UICollectionView,
                            layout: UICollectionViewLayout) -> CGSize {

        let cellSize = self.row(at: indexPath).cellSize(collectionSize: collectionView.bounds.size)

        let insetsHorizontalSpacing = sectionInsets.left + sectionInsets.right
        let paddingSpace =  spacingBetweenItems.horizontal * (CGFloat(numberOfItemsPerRow) + 1)
        let availableWidth = collectionView.frame.width - paddingSpace - insetsHorizontalSpacing
        let widthPerItem = availableWidth / CGFloat(numberOfItemsPerRow)

        return CGSize(width: widthPerItem, height: widthPerItem * cellSize.height / cellSize.width)
    }

    public func minimumVerticalItemSpacing(at section: Int,
                                           on collectionView: UICollectionView,
                                           layout: UICollectionViewLayout) -> CGFloat {
        return spacingBetweenItems.vertical - 1
    }

    public func minimumHorizontalItemSpacing(at section: Int,
                                             on collectionView: UICollectionView,
                                             layout: UICollectionViewLayout) -> CGFloat {
        return spacingBetweenItems.horizontal - 1
    }

    public func didSelectItem(at indexPath: IndexPath, on collectionView: UICollectionView) {
        self.row(at: indexPath).collectionViewDidSelectCell(collectionView, at: indexPath)
    }
}
