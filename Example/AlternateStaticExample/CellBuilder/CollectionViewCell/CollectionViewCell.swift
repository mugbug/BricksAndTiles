//
//  CollectionViewCell.swift
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

    lazy var titleLabel = UILabel()
        .. \.font <- .systemFont(ofSize: 20)
        .. \.text <- "Header"
        .. \.textColor <- .black

    lazy var listView = CollectionView<UICollectionViewCell>(
        scrollDirection: .horizontal,
        color: .orange
    )

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
        contentView.addSubviewWithConstraints(subview: stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(listView)
    }

    func setupConstraints() { }
}
