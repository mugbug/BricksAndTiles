//
//  HorizontalCell.swift
//  Example
//
//  Created by Pedro M. Zaroni on 01/08/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

import UIKit
import ViewCodeHelper

final class HorizontalCell: UICollectionViewCell, CellConfigurable {
    typealias ViewModel = String

    private lazy var coverArt = UIImageView()
        .. \.layer.cornerRadius <- 10
        .. \.clipsToBounds <- true

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: ViewModel) {
        coverArt.image = UIImage(named: model)
    }
}

extension HorizontalCell: ViewCodeProtocol {
    func setupHierarchy() {
        contentView.addSubviewWithConstraints(subview: coverArt)
    }

    func setupConstraints() { }
}
