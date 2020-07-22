//
//  HorizontalListCollectionView.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory

final class HorizontalListCollectionView: UIView {
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HorizontalListItemCell.self)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

//    lazy var heightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 10)

    private let names = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight"]

    init() {
        super.init(frame: .zero)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
//        let cellWidthHeightConstant: CGFloat = UIScreen.main.bounds.width * 0.2

//        layout.sectionInset = UIEdgeInsets(top: 0,
//                                           left: 10,
//                                           bottom: 0,
//                                           right: 10)
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        layout.estimatedItemSize = CGSize(width: cellWidthHeightConstant, height: cellWidthHeightConstant)
        return layout
    }
}

extension HorizontalListCollectionView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(collectionView)
    }

    func setupConstraints() {
        collectionView.constraint { view in
            [
                view.topAnchor.constraint(equalTo: topAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
                view.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        }
    }
}

extension HorizontalListCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
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

//extension HorizontalListCollectionView: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        var size = collectionView.frame.size
//        size.width *= 0.2
//        return size
//    }
//}
