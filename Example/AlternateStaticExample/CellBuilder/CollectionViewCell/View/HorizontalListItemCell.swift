//
//  HorizontalListItemCell.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/07/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory
import ViewCodeHelper

final class HorizontalListItemCell: UICollectionViewCell, Reusable {

    private lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.borderWidth = 1
        view.constraint { view in
            [view.heightAnchor.constraint(equalToConstant: 70),
             view.widthAnchor.constraint(equalToConstant: 70)]
        }
        return view
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 20)
        label.textColor = .systemBlue
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        buildView()
    }

    func configure(withTitle title: String) {
        label.text = title
    }
}

extension HorizontalListItemCell: ViewCodeProtocol {
    func setupHierarchy() {
        contentView.addSubview(roundedBackgroundView)
        contentView.addSubview(label)
    }

    func setupConstraints() {
        // Needed to avoid the `UIView-Encapsulated-Layout-Height` issue
        let bottomConstraint = roundedBackgroundView.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor,
            constant: -5
        )
        bottomConstraint.priority = .required - 1

        // Needed to avoid the `UIView-Encapsulated-Layout-Width` issue
        let trailingConstraint = trailingAnchor.constraint(
            equalTo: contentView.trailingAnchor,
            constant: -5
        )
        trailingConstraint.priority = .required - 1

        roundedBackgroundView.constraint { view in
            [view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            trailingConstraint,
            bottomConstraint]
        }

        label.constraint { view in
            [view.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
             view.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)]
        }
    }

    func additionalSetup() {
//        backgroundColor = .red
    }
}
