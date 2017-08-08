//
//  UITableView+RegisterCells.swift
//  Buddy School Search
//
//  Created by AppStarter on 08.08.2017.
//  Copyright © 2017 Krzysztof Hołtyn. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCells(_ cellsClasses: [AnyClass]) {
        cellsClasses.forEach { cellClass in
            self.register(UINib(nibName: String(describing: cellClass.self), bundle: nil), forCellReuseIdentifier: String(describing: cellClass))
        }
    }
}
