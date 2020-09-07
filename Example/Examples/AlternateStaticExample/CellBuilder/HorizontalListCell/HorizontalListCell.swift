//
//  HorizontalListCell.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/07/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

import UIKit
import ViewCodeHelper
import BricksAndTiles

final class HorizontalListCell: UITableViewCell, Reusable {

    var dataSource: CollectionViewDataSource?

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout()
        )
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    private func flowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        // Uncomment to show header
//        layout.headerReferenceSize = CGSize(width: 100, height: 50)
        layout.scrollDirection = .horizontal
        return layout
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HorizontalListCell: ViewCodeProtocol {
    func setupHierarchy() {
        contentView.addSubviewWithConstraints(
            subview: collectionView,
            insets: .init(
                top: 16,
                left: 0,
                bottom: -16,
                right: 0
            )
        )
    }

    func setupConstraints() { }

    func additionalSetup() {
        let factory = HorizontalListFactory(cellSize: cellSize).make()
        self.dataSource = CollectionViewDataSource(
            sections: factory,
            collectionView: collectionView
        )
    }

    func cellSize(collectionSize: CGSize) -> CGSize {
        let height = collectionSize.height
        return CGSize(width: height, height: height)
    }
}
