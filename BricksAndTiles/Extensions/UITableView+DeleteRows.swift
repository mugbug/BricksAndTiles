//
//  UITableView+DeleteRows.swift
// BricksAndTiles
//
//  Created by Pedro Zaroni on 26/05/19.
//  Copyright © 2019 Dextra. All rights reserved.
//

import UIKit

extension UITableView {
    func deleteRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation,
                    completion: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)

        beginUpdates()
        deleteRows(at: indexPaths, with: animation)
        endUpdates()

        CATransaction.commit()
    }
}
