//
//  SingleSelectionTableViewCell.swift
//  Example
//
//  Created by Pedro M. Zaroni on 17/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory
import ViewCodeHelper

typealias SelectableConfigurableCell = SelectableTableViewCell & CellConfigurable

class SingleSelectionTableViewCell: LabelCell, SelectableConfigurableCell {

    // MARK: - CellConfigurable

    typealias ViewModel = Song

    func configure(with model: Song) {
        textLabel?.text = model.name
    }

    // MARK: - SelectableCell

    func makeSelectionVisible() {
        accessoryType = .checkmark
    }

    func makeSelectionInvisible() {
        accessoryType = .none
    }
}
