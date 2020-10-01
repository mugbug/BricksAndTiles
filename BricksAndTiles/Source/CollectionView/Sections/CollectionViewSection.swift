//
//  CollectionViewSection.swift
//  BricksAndTiles
//
//  Created by Pedro M. Zaroni on 05/07/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

import UIKit

public typealias ItemSpacing = (horizontal: CGFloat, vertical: CGFloat)

public protocol CollectionViewSection {

    ///The minimum spacing between items in horizontal and vertical directions
    var spacingBetweenItems: ItemSpacing { get }

    ///The edges Insets for border spacing in this section
    var sectionInsets: UIEdgeInsets { get }

    ///Number of Items in this section
    var numberOfItems: Int { get }

    func registerCells(in collectionView: UICollectionView)

    // MARK: - Configuration

    func collectionViewCell(
        at indexPath: IndexPath,
        on collectionView: UICollectionView
    ) -> UICollectionViewCell

    func viewForSupplementaryElement(
        kind: String,
        at indexPath: IndexPath,
        on collectionView: UICollectionView
    ) -> UICollectionReusableView

    // MARK: - Layout

    func sizeForItem(
        at indexPath: IndexPath,
        on collectionView: UICollectionView,
        layout: UICollectionViewLayout
    ) -> CGSize

    func sectionBorderEdges(
        at section: Int,
        on collectionView: UICollectionView,
        layout: UICollectionViewLayout) -> UIEdgeInsets

    func minimumVerticalItemSpacing(
        at section: Int,
        on collectionView: UICollectionView,
        layout: UICollectionViewLayout) -> CGFloat

    func minimumHorizontalItemSpacing(
        at section: Int,
        on collectionView: UICollectionView,
        layout: UICollectionViewLayout) -> CGFloat

    // MARK: - Actions
    func didSelectItem(at indexPath: IndexPath, on collectionView: UICollectionView)
}

extension CollectionViewSection {
    public func sectionBorderEdges(at section: Int,
                                   on collectionView: UICollectionView,
                                   layout: UICollectionViewLayout) -> UIEdgeInsets {
        return sectionInsets
    }

    public func minimumVerticalItemSpacing(at section: Int,
                                           on collectionView: UICollectionView,
                                           layout: UICollectionViewLayout) -> CGFloat {
        return spacingBetweenItems.vertical
    }

    public func minimumHorizontalItemSpacing(at section: Int,
                                             on collectionView: UICollectionView,
                                             layout: UICollectionViewLayout) -> CGFloat {
        return spacingBetweenItems.horizontal
    }
}
