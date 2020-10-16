//
//  EditableTableViewCell.swift
//  Example
//
//  Created by Pedro M. Zaroni on 17/05/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

import UIKit
import BricksAndTiles
import PaintAndBrush

class EditableTableViewCell: LabelCell, CellConfigurable {
    typealias ViewModel = Song

    func configure(with model: Song) {
        textLabel?.text = model.name
    }
}
