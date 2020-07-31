//
//  HorizontalListFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import TableViewFactory

final class HorizontalListFactory {
    func make() -> [CollectionViewSection] {
        let section = StaticCollectionSection(
            cellBuilders: cellBuilders(),
            header: header()
        )
        return [section]
    }

    func cellBuilders() -> [CollectionViewCellBuilder] {
        return (0...5).map { _ in HorizontalCellBuilder() }
    }

    func header() -> UIView {
        let header = UILabel()
        header.text = "This is a section"
        return header
    }
}

final class HorizontalCellBuilder: CollectionViewCellBuilder {
    var cellSize: CGSize {
        CGSize(width: 300, height: 500)
    }

    func registerCellIdentifier(in collectionView: UICollectionView) {
        collectionView.register(UICollectionViewCell.self)
    }

    func collectionViewCell(at indexPath: IndexPath, on collectionView: UICollectionView) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }

    func collectionViewDidSelectCell(_ collectionView: UICollectionView) {

    }
}
