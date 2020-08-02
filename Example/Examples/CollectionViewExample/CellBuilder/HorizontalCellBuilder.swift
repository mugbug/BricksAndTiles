//
//  HorizontalCellBuilder.swift
//  Example
//
//  Created by Pedro M. Zaroni on 01/08/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

final class HorizontalCellBuilder: HorizontalCollectionViewCellBuilder {

    var cellWidth: CGFloat
    private let backgroundColor: UIColor

    init(width: CGFloat, backgroundColor: UIColor) {
        self.cellWidth = width
        self.backgroundColor = backgroundColor
    }

    func registerCellIdentifier(in collectionView: UICollectionView) {
        collectionView.register(HorizontalCell.self)
        collectionView.register(
            HorizontalCellHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader
        )
    }

    func collectionViewCell(at indexPath: IndexPath, on collectionView: UICollectionView) -> UICollectionViewCell {
        let cell: HorizontalCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(color: backgroundColor)
        return cell
    }

    func collectionViewSupplementaryView(kind: String,
                                         at indexPath: IndexPath,
                                         on collectionView: UICollectionView) -> UICollectionReusableView {
        let view: HorizontalCellHeader = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            for: indexPath
        )
        return view
    }

    func collectionViewDidSelectCell(_ collectionView: UICollectionView,
                                     at indexPath: IndexPath) {
        print("did tap cell at \(indexPath)")
    }
}
