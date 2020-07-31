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
        return collectionView
    }()

    private func flowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let factory = HorizontalListFactory().make()
        self.dataSource = CollectionViewDataSource(
            sections: factory,
            collectionView: collectionView
        )
    }
}

extension CollectionViewExampleViewController: ViewCodeProtocol {
    func setupHierarchy() {
        view.addSubviewWithConstraints(subview: collectionView)
    }

    func setupConstraints() { }

    func additionalSetup() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
    }
}
