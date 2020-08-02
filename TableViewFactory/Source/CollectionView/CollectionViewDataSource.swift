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
        collectionView.delegate = self
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
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }

    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = self.section(at: indexPath)
        return section.collectionViewCell(at: indexPath, on: collectionView)
    }

    public func collectionView(_ collectionView: UICollectionView,
                               viewForSupplementaryElementOfKind kind: String,
                               at indexPath: IndexPath) -> UICollectionReusableView {
        let section = self.section(at: indexPath)
        return section.viewForSupplementaryElement(
            kind: kind,
            at: indexPath,
            on: collectionView
        )
    }
}

extension CollectionViewDataSource: UICollectionViewDelegate {

    public func collectionView(_ collectionView: UICollectionView,
                               didSelectItemAt indexPath: IndexPath) {
        let section = self.section(at: indexPath)
        return section.didSelectItem(at: indexPath, on: collectionView)
    }
}

extension CollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = self.section(at: indexPath)
        return section.sizeForItem(
            at: indexPath,
            on: collectionView,
            layout: collectionViewLayout
        )
    }
}
