//
//  CollectionViewDataSource.swift
//  TableViewFactory
//
//  Created by Pedro M. Zaroni on 05/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit

public class CollectionViewDataSource: NSObject {
    private var sections: [CollectionViewSection] = []

    public init(sections: [CollectionViewSection], collectionView: UICollectionView) {
        self.sections = sections

        super.init()

        collectionView.dataSource = self
//        collectionView.delegate = self
        registerCells(in: collectionView)
    }

    private func registerCells(in collectionView: UICollectionView) {
        for section in sections {
            section.registerCells(in: collectionView)
        }
    }

    private func section(at indexPath: IndexPath) -> CollectionViewSection {
        return sections[indexPath.section]
    }
}

extension CollectionViewDataSource: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = self.section(at: indexPath)
        return section.collectionViewCell(at: indexPath, on: collectionView)
    }
}
