//
//  HorizontalListCell.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import ViewCodeHelper
import TableViewFactory

final class HorizontalListCell: UITableViewCell, Reusable {

    lazy var stackView = UIStackView()
        .. \.axis <- .vertical
        .. \.spacing <- 10

    lazy var titleLabel = UILabel()
        .. \.font <- .systemFont(ofSize: 20)
        .. \.text <- "Some horizontal list"
        .. \.textColor <- .black

    var dataSource: CollectionViewDataSource?

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout()
        )
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .darkGray
        return collectionView
    }()

    private func flowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        layout.headerReferenceSize = CGSize(width: 100, height: 50)
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
        contentView.addSubviewWithConstraints(subview: collectionView)
    }

    func setupConstraints() { }

    func additionalSetup() {
        let factory = HorizontalListFactory().make()
        self.dataSource = CollectionViewDataSource(
            sections: factory,
            collectionView: collectionView
        )
    }
}
