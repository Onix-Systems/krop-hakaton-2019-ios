//
//  CALayer.swift
//  KropHackathon
//
//  Created by Альона Дробко on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    func applySketchShadow(color: UIColor = .black, alpha: Float = 0.5, xxx: CGFloat = 0, yyy: CGFloat = 2, blur: CGFloat = 4, spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: xxx, height: yyy)
        shadowRadius = blur / 2.0
        
        //masksToBounds = true
        
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
}
