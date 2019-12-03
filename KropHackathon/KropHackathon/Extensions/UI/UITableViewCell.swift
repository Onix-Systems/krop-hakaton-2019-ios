//
//  UITableViewCell.swift
//  KeyStoneHome
//
//  Created by Tetiana Nieizviestna on 5/20/19.
//  Copyright © 2019 KeyStoneHome. All rights reserved.
//

import Foundation
import UIKit



extension UITableViewCell {
    
    class var identifier: String {
        let separator = "."
        let fullName = String(describing: self)
        if fullName.contains(separator) {
            let items = fullName.components(separatedBy: separator)
            if let name = items.last {
                return name
            }
        }
        
        return fullName
    }
}
