//
//  CollectionViewSection.swift
//  TableViewFactory
//
//  Created by Pedro M. Zaroni on 05/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

public protocol CollectionViewSection {
    var numberOfItems: Int { get }
    func registerCells(in collectionView: UICollectionView)

    func collectionViewCell(
        at indexPath: IndexPath,
        on collectionView: UICollectionView
    ) -> UICollectionViewCell
    func viewForSupplementaryElement(
        kind: String,
        at indexPath: IndexPath,
        on collectionView: UICollectionView
    ) -> UICollectionReusableView
    func sizeForItem(
        at indexPath: IndexPath,
        on collectionView: UICollectionView,
        layout: UICollectionViewLayout
    ) -> CGSize
    func didSelectItem(at indexPath: IndexPath, on collectionView: UICollectionView)
}
