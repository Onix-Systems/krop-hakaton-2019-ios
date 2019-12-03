//
//  UICollectionView.swift
//  KeyStoneHome
//
//  Created by Tetiana Nieizviestna on 6/6/19.
//  Copyright © 2019 KeyStoneHome. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func register(_ cells: [String]) {
        cells.forEach {
            register(UINib(nibName: $0, bundle: nil), forCellWithReuseIdentifier: $0)
        }
    }
    
    func setDataSource(_ dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate? = nil) {
        self.dataSource = dataSource
        self.delegate = delegate
    }
}

extension UICollectionView {
    
    func scrollToLast() {
        
        guard numberOfSections > 0 else { return }
        
        guard numberOfItems(inSection: 0) > 0 else { return }
        
        let lastItemIndexPath = IndexPath(item: numberOfItems(inSection: 0) - 1,
                                          section: 0)
        scrollToItem(at: lastItemIndexPath, at: .bottom, animated: true)
    }
}
