//
//  SelectableTableViewCell.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory
import ViewCodeHelper

class SelectableExampleTableViewCell: LabelCell, CellConfigurable {
    typealias ViewModel = ExampleType

    // MARK: - Setup

    func configure(with model: ExampleType) {
        textLabel?.text = model.rawValue
        self.accessoryType = .disclosureIndicator
    }
}
