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

class SelectableExampleTableViewCell: UITableViewCell, CellConfigurable {
    typealias ViewModel = ExampleType

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    func configure(with model: ExampleType) {
        textLabel?.text = model.rawValue
    }
}

extension SelectableExampleTableViewCell: ViewCodeProtocol {
    func setupHierarchy() {}

    func setupConstraints() {}

    func additionalSetup() {
        textLabel?.font = .preferredFont(forTextStyle: .title1)
        self.accessoryType = .disclosureIndicator
    }
}
