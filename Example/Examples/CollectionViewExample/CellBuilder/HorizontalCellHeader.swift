//
//  HorizontalCellHeader.swift
//  Example
//
//  Created by Pedro M. Zaroni on 01/08/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

import UIKit
import ViewCodeHelper

final class HorizontalCellHeader: UICollectionReusableView, Reusable {

    private lazy var playIcon = UIImageView()
        .. \.clipsToBounds <- true
        .. \.contentMode <- .scaleAspectFit
        .. \.image <- UIImage(named: "play")

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#warning("Move to ViewCodeHelper")
extension UIEdgeInsets {
    init(all value: CGFloat) {
        self.init(top: value, left: value, bottom: -value, right: -value)
    }
}

extension HorizontalCellHeader: ViewCodeProtocol {
    func setupHierarchy() {
        addSubviewWithConstraints(
            subview: playIcon,
            insets: .init(all: 30)
        )
    }

    func setupConstraints() {}

    func additionalSetup() {
        playIcon.tintColor = .white
    }
}
