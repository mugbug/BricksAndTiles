//
//  SecondStaticCell.swift
//  Example
//
//  Created by Pedro M. Zaroni on 27/06/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory

class SecondStaticCell: UITableViewCell, Identifiable {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Second cell"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SecondStaticCell: ViewCodeProtocol {
    func setupHierarchy() {
        contentView.addSubview(titleLabel)
    }

    func setupConstraints() {
        titleLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
             view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
             view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)]
        }
    }

    func additionalSetup() {
        backgroundColor = .orange
    }
}
