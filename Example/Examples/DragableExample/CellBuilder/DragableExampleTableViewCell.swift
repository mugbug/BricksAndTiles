//
//  DragableExampleTableViewCell.swift
//  Example
//
//  Created by Pedro M. Zaroni on 16/05/20.
//  Copyright © 2020 Dextra. All rights reserved.
//

import UIKit
import TableViewFactory
import ViewCodeHelper

class DragableExampleTableViewCell: UITableViewCell, Reusable {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DragableExampleTableViewCell: ViewCodeProtocol {
    func setupHierarchy() {
        contentView.addSubview(titleLabel)
    }

    func setupConstraints() {
        titleLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
             view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
             view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)]
        }
    }
}

//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//struct DragableExampleViewRepresentable: UIViewRepresentable {
//
//    var view = DragableExampleTableViewCell()
//
//    func makeUIView(context: Context) -> UIView {
//        return view
//    }
//
//    func updateUIView(_ view: UIView, context: Context) {
//
//    }
//}
//
//@available(iOS 13.0, *)
//struct DragableExample_Preview: PreviewProvider {
//    static var previews: some View {
//        DragableExampleViewRepresentable()
//            .previewLayout(.fixed(width: 400, height: 100))
//    }
//}
//#endif
