//
//  CollectionViewCellBuilder.swift
//  TableViewFactory
//
//  Created by Pedro M. Zaroni on 30/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

public protocol CollectionViewCellBuilder {

    var cellSize: CGSize { get }

    func registerCellIdentifier(in collectionView: UICollectionView)
    func collectionViewCell(
        at indexPath: IndexPath,
        on collectionView: UICollectionView
    ) -> UICollectionViewCell
    func collectionViewSupplementaryView(
        kind: String,
        at indexPath: IndexPath,
        on collectionView: UICollectionView
    ) -> UICollectionReusableView

//    func collectionViewShouldSelectCell(_ collectionView: UICollectionView) -> Bool
    func collectionViewDidSelectCell(_ collectionView: UICollectionView, at indexPath: IndexPath)
}

public extension TableViewCellBuilder {
    func collectionViewDidSelectCell(_ collectionView: UICollectionView, at indexPath: IndexPath) {
        print("Default implementation")
    }
}
