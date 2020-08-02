//
//  HorizontalCellHeader.swift
//  Example
//
//  Created by Pedro M. Zaroni on 01/08/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import ViewCodeHelper

final class HorizontalCellHeader: UICollectionReusableView, Reusable {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
