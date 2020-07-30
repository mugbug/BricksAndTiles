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
    var size: CGSize { get }
    func registerCells(in collectionView: UICollectionView)

    func collectionViewCell(at indexPath: IndexPath,
                            on collectionView: UICollectionView) -> UICollectionViewCell
    func sizeForItem(at indexPath: IndexPath,
                     on collectionView: UICollectionView,
                     layout: UICollectionViewLayout) -> CGSize
    func didSelectItem(at indexPath: IndexPath, on collectionView: UICollectionView)
}
