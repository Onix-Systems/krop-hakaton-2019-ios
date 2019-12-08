//
//  Style.swift
//  KropHackathon
//
//  Created by Альона Дробко on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

final class Style {
    
    struct Images {
        static let backIcon = UIImage(named: "ic_back")!
        static let locationIcon = UIImage(named: "icPinlocation")!
        static let scheduleIcon = UIImage(named: "icTime")!
        static let closedTimeIcon = UIImage(named: "icNoTime")!
    }
    
    struct Color {
        static let borderColor = UIColor(red: 226 / 255, green: 228 / 255, blue: 231 / 255, alpha: 1.0)
        static let shadowColor = UIColor(red: 0, green: 0, blue: 0)
        static let alphaForClearColor: Float = 0
        static let alphaForFullColor: Float = 1
        static let alphaForShadow: Float = 0.14
        static let uziPink = UIColor(red: 0.62, green: 0.29, blue: 0.81, alpha: 1)
        static let rengenBlue = UIColor(red: 0.33, green: 0.71, blue: 0.78, alpha: 1)
        static let funcOrange = UIColor(red: 0.92, green: 0.45, blue: 0.28, alpha: 1)
        static let endGreen = UIColor(red: 0.58, green: 0.74, blue: 0.16, alpha: 1)
        static let pinkDef = UIColor(red: 0.96, green: 0.56, blue: 0.52, alpha: 1.0)
    }
    
    struct Size {
        static let backBtnFrame = CGRect(x: 0, y: 0, width: 50, height: 50)
    }
    
    struct Radius {
        static let defaultRadius: CGFloat = 8
    }
    
    struct Font {
        static let navTitleFont = UIFont.sfRoundedBold(17)
    }
    
    static func setCellStyle(category: Category) -> (String, UIColor) {
        if category.name.contains("льтразвук") {
            return ("img_uzi", Color.uziPink)
        }
        if category.name.contains("ентген") {
            return ("img_rentgen", Color.rengenBlue)
        }
        if category.name.contains("ункц") {
            return ("img_funct", Color.funcOrange)
        }
        if category.name.contains("ндо") {
            return ("img_endo", Color.endGreen)
        }
        return ("img_all", Color.pinkDef)
    }
}
