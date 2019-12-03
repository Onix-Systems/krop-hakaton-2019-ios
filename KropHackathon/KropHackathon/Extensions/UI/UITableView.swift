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

// MARK: Scroll
extension UITableView {
    func scrollToLast(animated: Bool) {
        
        guard numberOfSections > 0 else { return }
        let lastSectionIndex = numberOfSections - 1
        guard numberOfRows(inSection: lastSectionIndex) > 0 else { return }
        
        let lastItemIndexPath = IndexPath(item: numberOfRows(inSection: lastSectionIndex) - 1,
                                          section: lastSectionIndex)
        scrollToRow(at: lastItemIndexPath, at: .bottom, animated: animated)
    }
    
    func scrollToTop(animated: Bool) {
        guard numberOfSections > 0 else { return }
        guard numberOfRows(inSection: 0) > 0 else { return }
        
        scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: animated)
    }
}
