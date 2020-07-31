//
//  CollectionView.swift
//  TableViewFactory
//
//  Created by Pedro M. Zaroni on 30/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import ViewCodeHelper

//extension UICollectionViewCell: Reusable {}
typealias CollectionViewDelegate = UICollectionViewDelegateFlowLayout & UICollectionViewDataSource

public final class CollectionView<CellType: UICollectionViewCell>: UIView, CollectionViewDelegate where CellType: Reusable {

    // MARK: Configuration

    var numberOfItemsInSection = 10
    var scrollDirection: UICollectionView.ScrollDirection
    var color: UIColor
    //    private lazy var dataSource = VerticalListDataSource<CellType>(color: color)

    // MARK: Views

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout()
        )
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CellType.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    private func flowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        return layout
    }

    // MARK: Initialization

    public init(scrollDirection: UICollectionView.ScrollDirection,
                color: UIColor) {
        self.scrollDirection = scrollDirection
        self.color = color
        super.init(frame: .zero)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = frame.width
        var height: CGFloat = 150
        if scrollDirection == .horizontal {
            width /= 4
            height = frame.height
        }
        return CGSize(width: width, height: height)
    }

    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInSection
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CellType = collectionView.dequeueReusableCell(for: indexPath)
        cell.backgroundColor = color
        return cell
    }
}

// MARK: ViewCodeProtocol

extension CollectionView: ViewCodeProtocol {
    public func setupHierarchy() {
        addSubviewWithConstraints(subview: collectionView)
    }

    public func setupConstraints() { }
}
