//
//  ExampleListTableViewFactory.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 mugbug. All rights reserved.
//

import UIKit
import BricksAndTiles

struct ExampleListTableViewFactory {
    typealias ExampleViewModel = ExampleType
    typealias SelectedExample = (ExampleViewModel) -> Void
    typealias MeetupViewModel = MeetupExampleType
    typealias SelectedMeetupExample = (MeetupViewModel) -> Void

    var didSelect: SelectedExample
    var didSelectMeetupExample: SelectedMeetupExample

    func make() -> [TableViewSection] {
        let section = StaticSection(
            cellBuilders: cellBuilders(),
            header: SimpleHeader(title: "Examples"),
            footer: UIView()
        )
        let meetupSection = StaticSection(
            cellBuilders: meetupBuilders(),
            header: SimpleHeader(title: "Dextra Meetup!"),
            footer: UIView()
        )
        return [section, meetupSection]
    }

    func cellBuilders() -> [TableViewCellBuilder] {
        return ExampleViewModel.allCases.map { type in
            SelectableCellBuilder<ExampleNameTableViewCell<ExampleViewModel>>(
                model: type, didSelect: didSelect
            )
        }
    }

    func meetupBuilders() -> [TableViewCellBuilder] {
        return MeetupViewModel.allCases.map { type in
            SelectableCellBuilder<ExampleNameTableViewCell<MeetupViewModel>>(
                model: type, didSelect: didSelectMeetupExample
            )
        }
    }
}
