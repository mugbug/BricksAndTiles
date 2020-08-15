//
//  SimpleHeader.swift
//  Example
//
//  Created by Pedro M. Zaroni on 15/08/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import ViewCodeHelper

final class SimpleHeader: UIView {
    lazy var titleLabel = UILabel()
        .. \.font <- .preferredFont(forTextStyle: .title2)
        .. \.text <- title

    let title: String
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        buildView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SimpleHeader: ViewCodeProtocol {
    func setupHierarchy() {
        addSubviewWithConstraints(subview: titleLabel, insets: .init(all: 16))
    }

    func setupConstraints() {}
}
