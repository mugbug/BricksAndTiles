//
//  DragableExampleViewController.swift
//  Example
//
//  Created by Pedro Zaroni on 16/05/20.
//  Copyright © 2020 Pedro Zaroni. All rights reserved.
//

import UIKit

final class DragableExampleViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 40
        tableView.backgroundColor = .white
        tableView.isEditing = true
        return tableView
    }()

    private let presenter = DragableExamplePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(tableView)
        tableView.constraint { view in
            [view.topAnchor.constraint(equalTo: self.view.topAnchor),
             view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
             view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
             view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),]
        }

        presenter.setupDataSource(in: tableView)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIKitViewRepresentable: UIViewRepresentable {

    var currentViewController = DragableExampleViewController()

    func makeUIView(context: Context) -> UIView {
        return currentViewController.view!
    }

    func updateUIView(_ view: UIView, context: Context) {

    }
}

@available(iOS 13.0, *)
struct UIKitViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIKitViewRepresentable()
    }
}
#endif
