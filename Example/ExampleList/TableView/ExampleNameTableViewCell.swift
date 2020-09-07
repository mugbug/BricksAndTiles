//
//  SelectableTableViewCell.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import BricksAndTiles
import ViewCodeHelper

class ExampleNameTableViewCell<ViewModel: RawRepresentable>: LabelCell, CellConfigurable
    where ViewModel.RawValue == String {
    typealias ViewModel = ViewModel

    // MARK: - Setup

    func configure(with model: ViewModel) {
        textLabel?.text = model.rawValue
        self.accessoryType = .disclosureIndicator
    }
}
