//
//  SecondStaticCell.swift
//  Example
//
//  Created by Pedro M. Zaroni on 27/06/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory
import ViewCodeHelper

class SecondStaticCell: UITableViewCell, CellConfigurable {
    typealias ViewModel = String

    func configure(with model: String) {
        textLabel?.text = model
        textLabel?.font = .systemFont(ofSize: 20)
        if #available(iOS 13.0, *) {
            backgroundColor = .groupTableViewBackground
        }
    }
}
