//
//  HorizontalCellBuilder.swift
//  Example
//
//  Created by Pedro M. Zaroni on 01/08/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

/*
 For fixed width size, `HorizontalCollectionViewCellBuilder`
 removes some boilerplate (it'll use all available height)
 */

//struct HorizontalCellBuilder: HorizontalCollectionViewCellBuilder {
//
//    var cellWidth: CGFloat { 96 }

/*
 For relative to collection view sizes, go for `CollectionViewCellBuilder`
 but be careful on not requiring more space than you have
 */

struct HorizontalCellBuilder: CollectionViewCellBuilder {

    func cellSize(collectionSize: CGSize) -> CGSize {
        return cellSize(collectionSize)
    }

// --------------------------------------------------------------------------

    var imageName: String
    var cellSize: (CGSize) -> CGSize

    func registerCellIdentifier(in collectionView: UICollectionView) {
        collectionView.register(HorizontalCell.self)
        collectionView.register(
            HorizontalCellHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader
        )
    }

    func collectionViewCell(at indexPath: IndexPath, on collectionView: UICollectionView) -> UICollectionViewCell {
        let cell: HorizontalCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(with: imageName)
        return cell
    }

    func collectionViewSupplementaryView(kind: String,
                                         at indexPath: IndexPath,
                                         on collectionView: UICollectionView) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let view: HorizontalCellHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                for: indexPath
            )
            return view
        default:
            return UICollectionReusableView()
        }
    }

    func collectionViewDidSelectCell(_ collectionView: UICollectionView,
                                     at indexPath: IndexPath) {
        print("did tap cell at \(indexPath)")
    }
}
