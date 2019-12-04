//
//  UIFont.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

extension UIFont {

    static func sfRoundedUltralight(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "SFProRounded-Ultralight", size: fontSize)!
    }
    
    static func sfRoundedBold(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "SFProRounded-Bold", size: fontSize)!
    }
    
    static func sfRoundedSemibold(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "SFProRounded-Semibold", size: fontSize)!
    }
    
    static func sfRoundedRegular(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "SFProRounded-Regular", size: fontSize)!
    }
    
    static func sfRoundedHeavy(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: "SFProRounded-Heavy", size: fontSize)!
    }
}
