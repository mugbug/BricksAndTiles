//
//  SimpleHeader.swift
//  Example
//
//  Created by Pedro M. Zaroni on 15/08/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

import UIKit
import ViewCodeHelper

final class SimpleHeader: UIView {
    lazy var titleLabel = UILabel()
        .. \.font <- .preferredFont(forTextStyle: textStyle)
        .. \.text <- title
        .. \.numberOfLines <- 0

    let title: String
    let textStyle: UIFont.TextStyle
    let insets: UIEdgeInsets

    init(title: String,
         textStyle: UIFont.TextStyle = .title2,
         insets: UIEdgeInsets = .init(all: 16)) {
        self.title = title
        self.textStyle = textStyle
        self.insets = insets
        super.init(frame: .zero)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SimpleHeader: ViewCodeProtocol {
    func setupHierarchy() {
        addSubviewWithConstraints(subview: titleLabel, insets: insets)
    }

    func setupConstraints() {}
}
