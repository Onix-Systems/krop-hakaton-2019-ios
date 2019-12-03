//
//  NSObject.swift
//  KeyStoneHome
//
//  Created by Tetiana Nieizviestna on 6/22/19.
//  Copyright © 2019 KeyStoneHome. All rights reserved.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
    
}
