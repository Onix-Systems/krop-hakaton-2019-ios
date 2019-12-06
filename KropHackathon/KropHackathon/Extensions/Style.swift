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
        static let backIcon = UIImage(named: "backIcon")!
        static let locationIcon = UIImage(named: "icPinlocation")!
        static let scheduleIcon = UIImage(named: "icTime")!
        static let closedTimeIcon = UIImage(named: "icNoTime")!
    }
    
    struct Color {
        static let marginGold = UIColor(red: 255 / 255, green: 203 / 255, blue: 2 / 255, alpha: 1.0)
        static let blueGrey = UIColor(red: 129 / 255, green: 148 / 255, blue: 165 / 255, alpha: 1.0)
        static let navy = UIColor(red: 3 / 255, green: 26 / 255, blue: 48 / 255, alpha: 1.0)
        static let azure = UIColor(red: 2 / 255, green: 136 / 255, blue: 245 / 255, alpha: 1.0)
        static let separatorColor = UIColor(red: 223 / 255, green: 228 / 255, blue: 232 / 255, alpha: 1.0)
        static let buttonInactiveColor = UIColor(red: 227 / 255, green: 231 / 255, blue: 234 / 255, alpha: 1.0)
        static let borderColor = UIColor(red: 226 / 255, green: 228 / 255, blue: 231 / 255, alpha: 1.0)
        static let phoneTextFieldBorderColor = UIColor(red: 193 / 255, green: 200 / 255, blue: 206 / 255, alpha: 1.0)
        static let shadowColor = UIColor(red: 0, green: 0, blue: 0)
        static let tabBarTintColor = UIColor(red: 33 / 255, green: 65 / 255, blue: 125 / 255, alpha: 1.0)
        static let locationButtonColor = UIColor(red: 55 / 255, green: 137 / 255, blue: 237 / 255, alpha: 1.0)
        static let pageControlColor = UIColor.black.withAlphaComponent(0.24)
        static let conclusionTextColor = UIColor(red: 0.01, green: 0.1, blue: 0.19, alpha: 1)
        //static let gradientColor = UIColor(hex: 0xFFFFFF)
        static let pinkForBanner = 0xFFFFFF
        static let lightBlue = 0x38D4F5
        static let darkBlue = 0x51a0d8
        static let red = 0xC22125
        static let yellow = 0xFFB100
        static let darkYellow = 0xebbe47
        static let lightPink = 0xd26eaa
        static let alphaForClearColor: Float = 0
        static let alphaForFullColor: Float = 1
        static let alphaForShadow: Float = 0.14
        static let uziPink = UIColor(red:0.62, green:0.29, blue:0.81, alpha:1)
        static let rengenBlue = UIColor(red:0.33, green:0.71, blue:0.78, alpha:1)
        static let funcOrange = UIColor(red:0.92, green:0.45, blue:0.28, alpha:1)
        static let endGreen = UIColor(red:0.58, green:0.74, blue:0.16, alpha:1)
    }
    
    struct Size {
    
    }
    
    struct Constaints {

    }
    
    struct Radius {
        static let textFieldRadius: CGFloat = 5
        static let miniMarkViewRadius: CGFloat = 6
        static let defaultRadius: CGFloat = 8
        static let alertRadius: CGFloat = 14
        static let cardRadius: CGFloat = 12
        static let iPadProfileRadius: CGFloat = 10
    }
    
    struct Font {
        
    }
}
