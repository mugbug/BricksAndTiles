//
//  FirstStaticCell.swift
//  Example
//
//  Created by Pedro M. Zaroni on 27/06/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory
import ViewCodeHelper

class FirstStaticCell: UITableViewCell, Reusable {

    private lazy var coverArt = UIImageView()
        .. \.clipsToBounds <- true
        .. \.contentMode <- .scaleAspectFit
        .. \.image <- UIImage(named: "ed-sheeran-live")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FirstStaticCell: ViewCodeProtocol {
    func setupHierarchy() {
        contentView.addSubviewWithConstraints(subview: coverArt)
    }

    func setupConstraints() {
        coverArt.constraint { view in
            [view.heightAnchor.constraint(equalToConstant: 200)]
        }
    }
}
