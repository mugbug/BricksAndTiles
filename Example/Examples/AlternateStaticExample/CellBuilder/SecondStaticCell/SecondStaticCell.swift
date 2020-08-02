//
//  SecondStaticCell.swift
//  Example
//
//  Created by Pedro M. Zaroni on 27/06/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory
import ViewCodeHelper

class SecondStaticCell: UITableViewCell, Reusable {

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
        contentView.addSubviewWithConstraints(
            subview: titleLabel,
            insets: .init(top: 44, left: 16, bottom: -44, right: -16)
        )
    }

    func setupConstraints() {}

    func additionalSetup() {
        backgroundColor = .orange
    }
}
