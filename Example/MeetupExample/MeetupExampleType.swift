//
//  MeetupExampleType.swift
//  Example
//
//  Created by Pedro M. Zaroni on 05/09/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

enum MeetupExampleType: String, CaseIterable {
    case regular = "Regular"
    case factory = "TableViewFactory"

    var title: String {
        switch self {
        case .regular:
            return "Regular"
        case .factory:
            return "TableViewFactory"
        }
    }
}
