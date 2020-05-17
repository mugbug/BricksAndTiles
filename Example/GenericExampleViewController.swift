//
//  GenericExampleViewController.swift
//  Example
//
//  Created by Pedro Zaroni on 16/05/20.
//  Copyright © 2020 Pedro Zaroni. All rights reserved.
//

import UIKit

protocol GenericPresenterProtocol: AnyObject {
    func setupDataSource(in tableView: UITableView)
}

final class GenericExampleViewController: UIViewController {

    // MARK: - Initialization

    private let presenter: GenericPresenterProtocol

    init(presenter: GenericPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Setup

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 40
        tableView.backgroundColor = .white
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(tableView)
        tableView.constraint { view in
            [view.topAnchor.constraint(equalTo: self.view.topAnchor),
             view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
             view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
             view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)]
        }

        presenter.setupDataSource(in: tableView)
    }

    // MARK: - Config

    func toggleEditable(_ isEditable: Bool) {
        tableView.isEditing = isEditable
    }
}

//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//struct DragableViewRepresentable: UIViewRepresentable {
//
//    var currentViewController = DragableExampleViewController()
//
//    func makeUIView(context: Context) -> UIView {
//        return currentViewController.view!
//    }
//
//    func updateUIView(_ view: UIView, context: Context) {
//
//    }
//}
//
//@available(iOS 13.0, *)
//struct DragableViewController_Preview: PreviewProvider {
//    static var previews: some View {
//        DragableViewRepresentable()
//    }
//}
//#endif
