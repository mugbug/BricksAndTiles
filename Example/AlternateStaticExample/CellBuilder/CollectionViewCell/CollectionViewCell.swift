//
//  CollectionViewCell.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory

class CollectionViewCell: UITableViewCell, Identifiable {

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HorizontalListItemCell.self)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private let names = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight"]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func systemLayoutSizeFitting(_ targetSize: CGSize,
                                          withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority,
                                          verticalFittingPriority: UILayoutPriority) -> CGSize {
        // `collectionView.contentSize` has a wrong width because in this nested example,
        // the sizing pass occurs before te layout pass,
        // so we need to force a layout pass with the correct width.
        self.contentView.frame = self.bounds
        self.contentView.layoutIfNeeded()
        // Returns `collectionView.contentSize` in order to set the UITableVieweCell height a value greater than 0.
        return self.collectionView.contentSize
    }

    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.estimatedItemSize = CGSize(width: 1, height: 1)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    //        let cellWidthHeightConstant: CGFloat = UIScreen.main.bounds.width * 0.2

            layout.sectionInset = UIEdgeInsets(top: 0,
                                               left: 10,
                                               bottom: 0,
                                               right: 10)
    //        layout.minimumInteritemSpacing = 0
    //        layout.minimumLineSpacing = 0
    //        layout.estimatedItemSize = CGSize(width: cellWidthHeightConstant, height: cellWidthHeightConstant)
        return layout
    }
}

extension CollectionViewCell: ViewCodeProtocol {
    func setupHierarchy() {
        contentView.addSubview(collectionView)
    }

    func setupConstraints() {
        collectionView.constraint { view in
            [view.topAnchor.constraint(equalTo: contentView.topAnchor),
             view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)]
        }
    }
}

extension CollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HorizontalListItemCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(withTitle: names[indexPath.row])
        return cell
    }
}
