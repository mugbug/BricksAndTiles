//
//  CollectionViewExampleViewController.swift
//  Example
//
//  Created by Pedro M. Zaroni on 30/07/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

import UIKit
import PaintAndBrush
import BricksAndTiles

final class CollectionViewExampleViewController: UIViewController {

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
        layout.scrollDirection = .vertical
//        layout.headerReferenceSize = CGSize(width: 50, height: 50)
        return layout
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionViewExampleViewController: ViewCodeProtocol {
    func setupHierarchy() {
        view.addSubviewWithConstraints(subview: collectionView)
    }

    func setupConstraints() {}

    func additionalSetup() {
        title = ExampleType.collectionView.title

        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        }

        let factory = HorizontalListFactory(cellSize: cellSize)
        self.dataSource = CollectionViewDataSource(
            sections: factory.make(),
            collectionView: collectionView
        )
    }

    func cellSize(collectionSize: CGSize) -> CGSize {
        let height = collectionSize.width / CGFloat.random(in: (1...5))
        return CGSize(width: height, height: height)
    }
}
