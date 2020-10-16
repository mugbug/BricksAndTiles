//
//  CollectionViewGridExampleController.swift
//  Example
//
//  Created by Tulio Bazan on 24/09/20.
//  Copyright © 2020 TucoBZ. All rights reserved.
//

import UIKit
import PaintAndBrush
import BricksAndTiles

final class CollectionViewGridExampleController: UIViewController {

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

extension CollectionViewGridExampleController: ViewCodeProtocol {
    func setupHierarchy() {
        view.addSubviewWithConstraints(subview: collectionView)
    }

    func setupConstraints() {}

    func additionalSetup() {
        title = ExampleType.gridColletion.title

        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        }

        let factory = GridListFactory(cellSize: cellSize)
        self.dataSource = CollectionViewDataSource(
            sections: factory.make(),
            collectionView: collectionView
        )
    }

    func cellSize(collectionSize: CGSize) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
}
