//
//  GenericExampleViewController.swift
//  Example
//
//  Created by Pedro Zaroni on 16/05/20.
//  Copyright © 2020 Pedro Zaroni. All rights reserved.
//

import UIKit

protocol GenericPresenterProtocol: AnyObject {
    var exampleName: String { get }
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

    private lazy var tableView = UITableView.standard()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubviewWithConstraints(subview: tableView)
        title = presenter.exampleName

        presenter.setupDataSource(in: tableView)
    }

    // MARK: - Config

    func toggleEditable(_ isEditable: Bool) {
        tableView.isEditing = isEditable
    }
}
