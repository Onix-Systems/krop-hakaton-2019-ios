//
//  UIStoryboard.swift
//  KeyStoneHome
//
//  Created by Tetiana Nieizviestna on 5/17/19.
//  Copyright © 2019 KeyStoneHome. All rights reserved.
//

import Foundation
import UIKit

struct Storyboard {
    static let main = UIStoryboard(name: "Main", bundle: nil)
    static let list = UIStoryboard(name: "List", bundle: nil)
    static let details = UIStoryboard(name: "Details", bundle: nil)
}

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self.self)
    }
}

extension UIStoryboard {
    func instantiateViewController<T: StoryboardIdentifiable>() -> T? {
        return instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T
    }
}

extension UIViewController: StoryboardIdentifiable { }
