//
//  UITableView.swift
//  KeyStoneHome
//
//  Created by Tetiana Nieizviestna on 6/22/19.
//  Copyright © 2019 KeyStoneHome. All rights reserved.
//

import UIKit

// MARK: Data source
extension UITableView {
    func register(_ cells: [String]) {
        cells.forEach {
            register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        }
    }
    
    func setDataSource(_ dataSource: UITableViewDataSource, delegate: UITableViewDelegate? = nil) {
        self.dataSource = dataSource
        self.delegate = delegate
    }
}

extension UITableView {
    
    func dequeCell<T: UITableViewCell>(for indexPath: IndexPath) -> T? {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.nibName, for: indexPath) as? T else { return nil }
        return cell
    }
    
}
