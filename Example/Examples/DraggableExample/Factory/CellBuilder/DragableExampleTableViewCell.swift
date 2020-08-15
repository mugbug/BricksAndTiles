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

class DragableExampleTableViewCell: UITableViewCell, CellConfigurable {
    typealias ViewModel = String

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with model: String) {
        titleLabel.text = model
    }
}

extension DragableExampleTableViewCell: ViewCodeProtocol {
    func setupHierarchy() {
        contentView.addSubviewWithConstraints(subview: titleLabel, insets: .init(all: 20))
    }

    func setupConstraints() { }
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
