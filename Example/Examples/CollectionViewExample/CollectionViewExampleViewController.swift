//
//  CollectionViewExampleViewController.swift
//  Example
//
//  Created by Pedro M. Zaroni on 30/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import ViewCodeHelper
import TableViewFactory

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
        title = "Available albums"

        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        }

        let factory = HorizontalListFactory(cellSize: cellSize).make()
        self.dataSource = CollectionViewDataSource(
            sections: factory,
            collectionView: collectionView
        )
    }

    func cellSize(collectionSize: CGSize) -> CGSize {
        let height = collectionSize.width / 2.05
        return CGSize(width: height, height: height)
    }
}
