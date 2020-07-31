//
//  StaticCollectionSection.swift
//  TableViewFactory
//
//  Created by Pedro M. Zaroni on 30/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

public final class StaticCollectionSection: CollectionViewSection {

    private var cellBuilders: [CollectionViewCellBuilder]
    private var header: UIView?
    private var footer: UIView?

    public init(cellBuilders: [CollectionViewCellBuilder],
                header: UIView? = nil,
                footer: UIView? = nil) {
        self.header = header
        self.footer = footer
        self.cellBuilders = cellBuilders
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

    public func sizeForItem(at indexPath: IndexPath,
                            on collectionView: UICollectionView,
                            layout: UICollectionViewLayout) -> CGSize {
        return self.row(at: indexPath).cellSize
    }

    public func didSelectItem(at indexPath: IndexPath, on collectionView: UICollectionView) {
        self.row(at: indexPath).collectionViewDidSelectCell(collectionView)
    }
}
