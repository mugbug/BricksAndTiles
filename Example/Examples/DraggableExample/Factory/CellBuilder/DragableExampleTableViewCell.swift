//
//  DragableExampleTableViewCell.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import BricksAndTiles
import ViewCodeHelper

class DragableExampleTableViewCell: LabelCell, CellConfigurable {
    typealias ViewModel = Song

    func configure(with model: Song) {
        textLabel?.text = model.name
        if #available(iOS 13.0, *) {
            let image = UIImage(systemName: "star.fill")
            imageView?.image = model.isFav ? image : nil
            imageView?.tintColor = .systemYellow
        }
    }
}
